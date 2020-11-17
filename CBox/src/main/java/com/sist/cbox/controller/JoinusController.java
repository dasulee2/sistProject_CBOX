package com.sist.cbox.controller;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.cbox.dao.CouponAccountDAO;
import com.sist.cbox.dao.CouponDAO;
import com.sist.cbox.dao.GradeDAO;
import com.sist.cbox.dao.MemberDAO;
import com.sist.cbox.dao.MembershipDAO;
import com.sist.cbox.dao.NonmemberDAO;
import com.sist.cbox.dao.PointAccountDAO;
import com.sist.cbox.utill.CookieManager;
import com.sist.cbox.vo.CouponAccount;
import com.sist.cbox.vo.Grade;
import com.sist.cbox.vo.Member;
import com.sist.cbox.vo.Nonmember;
import com.sist.cbox.vo.PointAccount;



@Controller
@RequestMapping("/joinus/*")
public class JoinusController {
	
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private MembershipDAO msdao; 
	
	private NonmemberDAO nmdao;
	@Autowired
	public void setNmdao(NonmemberDAO nmdao) {
		this.nmdao = nmdao;
	}
	private PointAccountDAO pdao;
	@Autowired
	public void setPdao(PointAccountDAO pdao) {
		this.pdao = pdao;
	}
	private GradeDAO gddao;
	@Autowired
	public void setGddao(GradeDAO gddao) {
		this.gddao = gddao;
	}
	private CouponAccountDAO cadao;
	@Autowired
	public void setCadao(CouponAccountDAO cadao) {
		this.cadao = cadao;
	}
	@Autowired
	private CouponDAO cpdao;
	
	//아이디찾기
	@RequestMapping(value= {"idFind.do"}, method=RequestMethod.GET)
	public String idFind(String mid,Model model) {
		
		model.addAttribute("mid", mid);
		//System.out.println(mid);
		return "idFind.jsp";
	}
	@RequestMapping(value= {"idFind.do"}, method=RequestMethod.POST)
	public String idFind(String name, String phone) {
		System.out.println("name : "+name);
		System.out.println("phone : "+phone);
		String mid = mdao.idFind(name, phone);
		//System.out.println("mid");
		
		if(mid!=null) {
			System.out.println("아이디가 존재");
			System.out.println("mid : "+mid);
			return "redirect:idFind.do?mid="+mid;
			
		}else {
			System.out.println("아이디가 없음");
			return "redirect:idFind.do";
		}
	}
	
	//비밀번호 찾기/재설정
	@RequestMapping(value= {"rePwd.do"}, method=RequestMethod.GET)
	public String rePwd(String id, Model model) {
		System.out.println("id 겟 : "+id);
		model.addAttribute("id", id);
		return "rePwd.jsp";
	}
	@RequestMapping(value= {"rePwd.do"}, method=RequestMethod.POST)
	public String rePwd(String pwd, String mid) {
		System.out.println("pwd 숮 : "+pwd);
		System.out.println("mid 프록 : "+mid);
		Member m = new Member();
		m.setPwd(pwd);
		m.setMid(mid);
		System.out.println("m.getPwd : "+m.getPwd());
		System.out.println("m.getMid : "+m.getMid());
		int af = mdao.rePwd(pwd, mid);
		System.out.println("af : "+af);
		if(af==1) {
			System.out.println("비밀번호 수정");
			System.out.println("pwd : "+pwd);
			return "redirect:login.do";
		}else {
			System.out.println("비밀번호 수정 안됨");
			return "redirect:rePwd.do";
		}
	}
	//회원 로그인
	@RequestMapping(value={"login.do"}, method=RequestMethod.GET)
	public String login(HttpServletRequest request, Model model) {
		Cookie[] coos = request.getCookies();
		String cookieMid = CookieManager.getCookie(coos, "username");
		String cookiePwd = CookieManager.getCookie(coos, "password");
		
		if(cookieMid !=null && !cookieMid.equals("")) {
			model.addAttribute("cookieMid", cookieMid);
		}else {
			model.addAttribute("cookiePwd", cookiePwd);
		}
		return "login.jsp";
	}
	
	@RequestMapping(value={"login.do"}, method=RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, String mid, String pwd, String checkBoxMid) {
		//System.out.println("포스트");
		Member m = mdao.getMember(mid); 
		//System.out.println("m : "+mid);
		
		if(m==null || !pwd.equals(m.getPwd())) {
			System.out.println("아이디오류");
			return "redirect:login.do";
		}else {
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();
			session.setAttribute("mid", mid);
			
			String url = (String)session.getAttribute("url");
			System.out.println("url : "+url);
			if(url!=null) {
				return url;
			}
			
			//로그인 시 내 등급확인
			String myGrade = msdao.getGrade(mid);
			
			//목표하는 등급
			Grade upgrade = gddao.nextGrade(mid);
			
			//로그인 포인트 적립
			String sort = "로그인";
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			String regdate = sdf.format(date);
			//String regdate="17/11/26";
			System.out.println("regdate : "+regdate);
			System.out.println("sort : "+sort);
			String today = pdao.getDate(regdate, sort, mid);
			System.out.println("today: "+today);
			
			int uppoint = 50;
			System.out.println("적립할 포인트다 : "+uppoint);
			if(today==null) {
				System.out.println("적립가능");
				PointAccount pa = new PointAccount();
				pa.setPoint(50);
				pa.setMid(mid);
				pa.setSort(sort);
				
				int af = pdao.addPointAc(pa);
				if(af==1) {
					System.out.println("로그인 포인트를 적립합니다. 그리고 성공했다.");
					int mypoint = pdao.getPoint(mid);//현재내포인트
					System.out.println("적립한후 포인트다 : "+mypoint);
					System.out.println("목표 포인트다 :"+upgrade.getReqpoint());
					//System.out.println("적립한 내 포인트다 : "+(mypoint+uppoint));
					if(Integer.parseInt(upgrade.getReqpoint())<(mypoint+uppoint)) {
						int af2 = msdao.updateMembership(mid, (mypoint+uppoint), upgrade.getGradeName());
						System.out.println("업데이트했다.");
					}
					System.out.println("적립후 내 등급 : "+msdao.getGrade(mid));
					if(msdao.getGrade(mid).equals("NORMAL")) {
						System.out.println("노말");
					}else {
						CouponAccount ca = new CouponAccount();
						if(msdao.getGrade(mid).equals("VIP")) {
							ca.setCouponCode("V1");
							ca.setContent("VIP쿠폰 -10%할인");
						}else if(msdao.getGrade(mid).equals("VVIP")) {
							ca.setCouponCode("V2");
							ca.setContent("VVIP쿠폰 -20%할인");
						}else if(msdao.getGrade(mid).equals("VVVIP")) {
							ca.setCouponCode("V3");
							ca.setContent("VVVIP쿠폰 -30%할인");
						}
						ca.setMid(mid);
						ca.setCancelCheck("FALSE");
						ca.setState("사용가능");
						ca.setUsedDate("N/A");
						int af3 = cadao.addCouponAc(ca);
						if(af3==1) {
							System.out.println("쿠폰 적립 성공");
						}
					}
				}else {
					System.out.println("로그인 포인트 적립 실패");
				}
			}else {
				System.out.println("포인트 적립 불가");
			}
			
			if(checkBoxMid!=null && !checkBoxMid.equals("")) {
				Cookie ck = new Cookie("mid", mid);
				ck.setMaxAge(60*60*24*30);
				System.out.println("쿠키생성");
				response.addCookie(ck);
				
				Cookie ck2 = new Cookie("pwd", pwd);
				ck2.setMaxAge(60*60*24*30);
				System.out.println("pwd 쿠키 생성");
				response.addCookie(ck2);
			}else {
				Cookie ck = new Cookie("mid", null);
				ck.setMaxAge(0); //생존기간 한달
				System.out.println("쿠키삭제");
				response.addCookie(ck);

				Cookie ck2 = new Cookie("pwd", null);
				ck2.setMaxAge(0); //생존기간 한달
				System.out.println("pwd 쿠키삭제");
				response.addCookie(ck2);
			}
			
			return "redirect:../main.do";
		}
	}
	
	@RequestMapping("error.do")
	@ResponseBody
	public String error(String mid, String pwd) {
		Member m = mdao.getMember(mid);
		
		if(m==null || !pwd.equals(m.getPwd())) {
			return "fail";
		}else {
			return "success";
		}
	}
	
	//환영합니다.
	@RequestMapping("welcome.do")
	public String welcomeLogin() {
		return "welcome.jsp";
	}
	
	//비회원 로그인
	@RequestMapping(value={"nonMemberLogin.do"}, method=RequestMethod.GET)
	public String nonMemberLogin(String logintype, Model model) {
		model.addAttribute("logintype", logintype);
		System.out.println("logintype :"+logintype);
		//return "nonMemberLogin.jsp";
		//다끝난다음에 이렇게 바꾸시오(jsp만)
		return "nonMemberLogin.jsp";
	}
	
	@RequestMapping(value={"nonMemberLogin.do"}, method=RequestMethod.POST)
	public String nonMemberLogin(Nonmember non, String logintype, HttpServletRequest request) {
		System.out.println("logintype2 : "+logintype);
		int af = nmdao.addNonMember(non);
		System.out.println(non.getGender());
		if(af==1) {
			HttpSession session = request.getSession();
	         session.setAttribute("non", non.getNmid());
	         
			System.out.println("비회원 로그인 성공");
			if(logintype.equals("reserve")) {
				System.out.println("예매 페이지로");
				System.out.println("말이되냐");
				
				return "redirect:../Ticket/bookingInfo.do?memberType=non";
			}else {
				System.out.println("예매조회페이지로");
				return "redirect:../mypage/myMovie.do?mid="+non.getNmid();
			}
			
		}else {
			System.out.println("비회원 로그인 실패");
			//다시 로그인 페이지
			return "redirect:login.do";
		}
	}
	
	@RequestMapping(value={"join.do"}, method=RequestMethod.GET)
	public String join() {
		return "join.jsp";
	}
	
	@RequestMapping(value={"join.do"}, method=RequestMethod.POST)
	public String join(Member m) {
		
		int af = mdao.addMember(m);
		if(af==1) {
			System.out.println("회원가입 성공");
			PointAccount pa = new PointAccount();
			pa.setMid(m.getMid());
			pa.setPoint(200);
			pa.setSort("회원가입");
			int af2 = pdao.addPointAc(pa);
			if(af2==1) {
				System.out.println("회원가입 포인트 적립 성공");
				int af3 = msdao.insertMembership(m.getMid());
				if(af3==1) {
					System.out.println("멤버십 인서트 적립 성공");
				}
			}
			return "redirect:login.do";
		}else {
			System.out.println("회원가입 실패");
			return "redirect:join.do";
		}
	}
	
	@RequestMapping("idCheck.do")
	@ResponseBody
	public String idCheck(String mid) {
		Member m = mdao.getMember(mid);
		System.out.println("나와라");
		if(m==null) {
			System.out.println("사용가능한 아이디입니다.");
			return "YES";
		}else {
			System.out.println("사용불가능한 아이디입니다.");
			return "NO";
		}
	}
	
	//아이디 조회
	@RequestMapping("idSearch.do")
	@ResponseBody
	public String idSearch(String id) {
		System.out.println("mid 조회 : "+id);
		Member m = mdao.getMember(id); 
		if(m!=null) {
			System.out.println("수정가능 아이디");
			return "success";
		}else {
			System.out.println("수정불가능 아이디");
			return "fail";
		}
	}
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logout() {
				
		
		return "logout.jsp";
	}
	
}
