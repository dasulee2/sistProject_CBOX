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
	
	//���̵�ã��
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
			System.out.println("���̵� ����");
			System.out.println("mid : "+mid);
			return "redirect:idFind.do?mid="+mid;
			
		}else {
			System.out.println("���̵� ����");
			return "redirect:idFind.do";
		}
	}
	
	//��й�ȣ ã��/�缳��
	@RequestMapping(value= {"rePwd.do"}, method=RequestMethod.GET)
	public String rePwd(String id, Model model) {
		System.out.println("id �� : "+id);
		model.addAttribute("id", id);
		return "rePwd.jsp";
	}
	@RequestMapping(value= {"rePwd.do"}, method=RequestMethod.POST)
	public String rePwd(String pwd, String mid) {
		System.out.println("pwd �G : "+pwd);
		System.out.println("mid ���� : "+mid);
		Member m = new Member();
		m.setPwd(pwd);
		m.setMid(mid);
		System.out.println("m.getPwd : "+m.getPwd());
		System.out.println("m.getMid : "+m.getMid());
		int af = mdao.rePwd(pwd, mid);
		System.out.println("af : "+af);
		if(af==1) {
			System.out.println("��й�ȣ ����");
			System.out.println("pwd : "+pwd);
			return "redirect:login.do";
		}else {
			System.out.println("��й�ȣ ���� �ȵ�");
			return "redirect:rePwd.do";
		}
	}
	//ȸ�� �α���
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
		//System.out.println("����Ʈ");
		Member m = mdao.getMember(mid); 
		//System.out.println("m : "+mid);
		
		if(m==null || !pwd.equals(m.getPwd())) {
			System.out.println("���̵����");
			return "redirect:login.do";
		}else {
			System.out.println("�α��� ����");
			
			HttpSession session = request.getSession();
			session.setAttribute("mid", mid);
			
			String url = (String)session.getAttribute("url");
			System.out.println("url : "+url);
			if(url!=null) {
				return url;
			}
			
			//�α��� �� �� ���Ȯ��
			String myGrade = msdao.getGrade(mid);
			
			//��ǥ�ϴ� ���
			Grade upgrade = gddao.nextGrade(mid);
			
			//�α��� ����Ʈ ����
			String sort = "�α���";
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
			String regdate = sdf.format(date);
			//String regdate="17/11/26";
			System.out.println("regdate : "+regdate);
			System.out.println("sort : "+sort);
			String today = pdao.getDate(regdate, sort, mid);
			System.out.println("today: "+today);
			
			int uppoint = 50;
			System.out.println("������ ����Ʈ�� : "+uppoint);
			if(today==null) {
				System.out.println("��������");
				PointAccount pa = new PointAccount();
				pa.setPoint(50);
				pa.setMid(mid);
				pa.setSort(sort);
				
				int af = pdao.addPointAc(pa);
				if(af==1) {
					System.out.println("�α��� ����Ʈ�� �����մϴ�. �׸��� �����ߴ�.");
					int mypoint = pdao.getPoint(mid);//���系����Ʈ
					System.out.println("�������� ����Ʈ�� : "+mypoint);
					System.out.println("��ǥ ����Ʈ�� :"+upgrade.getReqpoint());
					//System.out.println("������ �� ����Ʈ�� : "+(mypoint+uppoint));
					if(Integer.parseInt(upgrade.getReqpoint())<(mypoint+uppoint)) {
						int af2 = msdao.updateMembership(mid, (mypoint+uppoint), upgrade.getGradeName());
						System.out.println("������Ʈ�ߴ�.");
					}
					System.out.println("������ �� ��� : "+msdao.getGrade(mid));
					if(msdao.getGrade(mid).equals("NORMAL")) {
						System.out.println("�븻");
					}else {
						CouponAccount ca = new CouponAccount();
						if(msdao.getGrade(mid).equals("VIP")) {
							ca.setCouponCode("V1");
							ca.setContent("VIP���� -10%����");
						}else if(msdao.getGrade(mid).equals("VVIP")) {
							ca.setCouponCode("V2");
							ca.setContent("VVIP���� -20%����");
						}else if(msdao.getGrade(mid).equals("VVVIP")) {
							ca.setCouponCode("V3");
							ca.setContent("VVVIP���� -30%����");
						}
						ca.setMid(mid);
						ca.setCancelCheck("FALSE");
						ca.setState("��밡��");
						ca.setUsedDate("N/A");
						int af3 = cadao.addCouponAc(ca);
						if(af3==1) {
							System.out.println("���� ���� ����");
						}
					}
				}else {
					System.out.println("�α��� ����Ʈ ���� ����");
				}
			}else {
				System.out.println("����Ʈ ���� �Ұ�");
			}
			
			if(checkBoxMid!=null && !checkBoxMid.equals("")) {
				Cookie ck = new Cookie("mid", mid);
				ck.setMaxAge(60*60*24*30);
				System.out.println("��Ű����");
				response.addCookie(ck);
				
				Cookie ck2 = new Cookie("pwd", pwd);
				ck2.setMaxAge(60*60*24*30);
				System.out.println("pwd ��Ű ����");
				response.addCookie(ck2);
			}else {
				Cookie ck = new Cookie("mid", null);
				ck.setMaxAge(0); //�����Ⱓ �Ѵ�
				System.out.println("��Ű����");
				response.addCookie(ck);

				Cookie ck2 = new Cookie("pwd", null);
				ck2.setMaxAge(0); //�����Ⱓ �Ѵ�
				System.out.println("pwd ��Ű����");
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
	
	//ȯ���մϴ�.
	@RequestMapping("welcome.do")
	public String welcomeLogin() {
		return "welcome.jsp";
	}
	
	//��ȸ�� �α���
	@RequestMapping(value={"nonMemberLogin.do"}, method=RequestMethod.GET)
	public String nonMemberLogin(String logintype, Model model) {
		model.addAttribute("logintype", logintype);
		System.out.println("logintype :"+logintype);
		//return "nonMemberLogin.jsp";
		//�ٳ��������� �̷��� �ٲٽÿ�(jsp��)
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
	         
			System.out.println("��ȸ�� �α��� ����");
			if(logintype.equals("reserve")) {
				System.out.println("���� ��������");
				System.out.println("���̵ǳ�");
				
				return "redirect:../Ticket/bookingInfo.do?memberType=non";
			}else {
				System.out.println("������ȸ��������");
				return "redirect:../mypage/myMovie.do?mid="+non.getNmid();
			}
			
		}else {
			System.out.println("��ȸ�� �α��� ����");
			//�ٽ� �α��� ������
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
			System.out.println("ȸ������ ����");
			PointAccount pa = new PointAccount();
			pa.setMid(m.getMid());
			pa.setPoint(200);
			pa.setSort("ȸ������");
			int af2 = pdao.addPointAc(pa);
			if(af2==1) {
				System.out.println("ȸ������ ����Ʈ ���� ����");
				int af3 = msdao.insertMembership(m.getMid());
				if(af3==1) {
					System.out.println("����� �μ�Ʈ ���� ����");
				}
			}
			return "redirect:login.do";
		}else {
			System.out.println("ȸ������ ����");
			return "redirect:join.do";
		}
	}
	
	@RequestMapping("idCheck.do")
	@ResponseBody
	public String idCheck(String mid) {
		Member m = mdao.getMember(mid);
		System.out.println("���Ͷ�");
		if(m==null) {
			System.out.println("��밡���� ���̵��Դϴ�.");
			return "YES";
		}else {
			System.out.println("���Ұ����� ���̵��Դϴ�.");
			return "NO";
		}
	}
	
	//���̵� ��ȸ
	@RequestMapping("idSearch.do")
	@ResponseBody
	public String idSearch(String id) {
		System.out.println("mid ��ȸ : "+id);
		Member m = mdao.getMember(id); 
		if(m!=null) {
			System.out.println("�������� ���̵�");
			return "success";
		}else {
			System.out.println("�����Ұ��� ���̵�");
			return "fail";
		}
	}
	
	//�α׾ƿ�
	@RequestMapping("logout.do")
	public String logout() {
				
		
		return "logout.jsp";
	}
	
}
