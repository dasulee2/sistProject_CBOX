package com.sist.cbox.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sist.cbox.api.MovieAPI;
import com.sist.cbox.dao.CouponAccountDAO;
import com.sist.cbox.dao.GiftyconAccountDAO;
import com.sist.cbox.dao.GiftyconDAO;
import com.sist.cbox.dao.MemberDAO;
import com.sist.cbox.dao.MembershipDAO;
import com.sist.cbox.dao.MovieDAO;
import com.sist.cbox.dao.MovieDiaryDAO;
import com.sist.cbox.dao.PointAccountDAO;
import com.sist.cbox.dao.SeatAccountDAO;
import com.sist.cbox.dao.SeatDAO;
import com.sist.cbox.dao.TheaterDAO;
import com.sist.cbox.dao.TimetableDAO;
import com.sist.cbox.vo.GiftyconAccount;
import com.sist.cbox.vo.Member;
import com.sist.cbox.vo.Movie;
import com.sist.cbox.vo.MovieDiary;
import com.sist.cbox.vo.SeatAccount;
import com.sist.cbox.vo.Theater;
import com.sist.cbox.vo.Timetable;


@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired
	private MemberDAO mdao;
	@Autowired
	private GiftyconAccountDAO gadao;
	@Autowired
	private GiftyconDAO gdao;
	@Autowired
	private SeatAccountDAO sdao;
	@Autowired
	private TimetableDAO tdao;
	@Autowired
	private TheaterDAO tadao;
	@Autowired
	private MovieDAO movieDao;
	@Autowired
	private MovieDiaryDAO mddao;
	@Autowired
	private SeatDAO ssdao;
	@Autowired
	private PointAccountDAO pdao;
	@Autowired
	private MembershipDAO msdao;
	@Autowired
	CouponAccountDAO cadao;
	
	@RequestMapping("mypage.do")
	public String mypage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		System.out.println("mid : "+mid);
		
		if(mid==null) {
			session.setAttribute("url", "../mypage/mypage.do");
			return "../joinus/login.do";
		}
		
		Member m = mdao.getMember(mid);
		String grade = msdao.getGrade(mid);
	      int point = pdao.getPoint(mid);
	      int count = gadao.countGiftyconAc(mid);
	      int ccount = gadao.countCoupontAc(mid);
	      
	      System.out.println("ccount : "+ccount);
	      System.out.println("count : "+count);
	      System.out.println("point : "+point);
	      System.out.println("Grade : "+grade);
	      
	      model.addAttribute("ccount", ccount);
	      model.addAttribute("count", count);
	      model.addAttribute("point", point);
	      model.addAttribute("grade", grade);
		model.addAttribute("m", m);

		return "mypage.jsp";
	}

	
	
	
	@RequestMapping("memberInfo.do")
	public String memberInfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");

		Member m = mdao.getMember(mid);
		model.addAttribute("m", m);

		return "memberInfo.jsp";
	}
	//��й�ȣ üũ
	@RequestMapping("pwdCheck.do")
	public String pwdCheck(HttpServletRequest request, String pwd) {
		System.out.println("pwd : "+pwd);
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		Member m = mdao.getMember(mid);
		if(pwd.equals(m.getPwd())) {
			System.out.println("��й�ȣ ��ġ");
			return "redirect:updateMember.do";
		}else {
			System.out.println("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			return "redirect:memberInfo.do";
		}
	}
	//ȸ������ ����
	@RequestMapping(value={"updateMember.do"}, method=RequestMethod.GET)
	public String updateMember(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");

		System.out.println("���̵� : "+mid);
		Member m = mdao.getMember(mid);
		model.addAttribute("m", m);

		return "updateMember.jsp";
	}

	@RequestMapping(value={"updateMember.do"}, method=RequestMethod.POST)
	public String updateMember(HttpServletRequest request, String pwd, String phone) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		
		Member m = new Member();
		m.setPwd(pwd);
		m.setPhone(phone);
		m.setMid(mid);
		
		int af = mdao.updateMember(m);
		System.out.println("af : "+af);
		if(af==1) {
			System.out.println("������Ʈ ����");
			return "redirect:memberInfo.do";
		}else {
			System.out.println("������Ʈ ����");
			return "redirect:updateMember.do";
		}
	}
	

	@RequestMapping("delMember.do")
	public String delMember(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");

		int af = mdao.delMember(mid);
		if(af==1) {
			System.out.println("ȸ�� ���� ����");
			return "redirect:../index.do";
		}else {
			System.out.println("ȸ�� ���� ����");
			//������������ �̵�
			return "";
		}
	}
	
	
	@RequestMapping("shopMygiftycon.do")
	public String shopMygiftycon(HttpServletRequest request, Model model, String type) {
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		ArrayList<GiftyconAccount> gList = null;
		ArrayList<GiftyconAccount> ugList = null;
		System.out.println("if����type="+type);
		if(type.equals("M")){
			//��밡���� ����Ƽ�� ���
			System.out.println("if��type="+type);
			gList = (ArrayList<GiftyconAccount>) gadao.getMygiftcon_M(mid);
			for(int i=0; i<gList.size(); i++) {
				String giftyconCode = gList.get(i).getGiftyconCode();
				gList.get(i).setGiftyconCode(gdao.getGiftycon(giftyconCode).getGiftyconName());
			}
			//����� ����Ƽ�� ���
			ugList = (ArrayList<GiftyconAccount>) gadao.getUsedMygiftcon_M(mid);
			for(int i=0; i<ugList.size(); i++) {
				String giftyconCode = ugList.get(i).getGiftyconCode();
				ugList.get(i).setGiftyconCode(gdao.getGiftycon(giftyconCode).getGiftyconName());
			}
			
		}else {
			//��밡���� ����Ƽ�� ���
			gList = (ArrayList<GiftyconAccount>) gadao.getMygiftcon(mid);
			for(int i=0; i<gList.size(); i++) {
				String giftyconCode = gList.get(i).getGiftyconCode();
				gList.get(i).setGiftyconCode(gdao.getGiftycon(giftyconCode).getGiftyconName());
			}
			//����� ����Ƽ�� ���
			ugList = (ArrayList<GiftyconAccount>) gadao.getUsedMygiftcon(mid);
			for(int i=0; i<ugList.size(); i++) {
				String giftyconCode = ugList.get(i).getGiftyconCode();
				ugList.get(i).setGiftyconCode(gdao.getGiftycon(giftyconCode).getGiftyconName());
			}
			
		}
		
		model.addAttribute("gList", gList);
		model.addAttribute("ugList", ugList);
	
		return "shopMygiftycon.jsp";
	}
	
	@RequestMapping(value={"myMovie.do"}, method=RequestMethod.GET)
	public String myPage(Model model, HttpServletRequest request, HttpServletRequest response){

		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		
		System.out.println("&****************dfdsfsdfs�־ȵ�l*****");
		
		List<SeatAccount> slist = sdao.getSeatAccount(mid); //�ش� ���̵��� ���������� �����´�.
		
		List<String> tseqList = null;  // timeSeq�� ���� ����Ʈ 
		List<String> sseqList = null;
		tseqList = new ArrayList<String>();
		sseqList = new ArrayList<String>();
		if(slist != null) {
		for(SeatAccount s : slist) {
			
			System.out.println("dealNum : "+s.getDealNum());
			String tseq = s.getTimeSeq();
			
			
			tseqList.add(tseq); // Tseq �� �̾Ƽ� ����Ʈ�� ��´�. 
			
			
			String sseq = s.getSeatSeq();
			sseqList.add(sseq); // sseq �� �̾Ƽ� ����Ʈ�� ��´�. 
		}
		
		
		List<Timetable> tList = null;  //Timetable�� ���̴� ����Ʈ 
		
		tList = new ArrayList<Timetable>();  
		for(String t : tseqList) {					
			
			Timetable ttable = tdao.getTimetable(t);  // ttbale ��ü�� �̾Ƴ���. ���⼭ time�� ����
			tList.add(ttable);  // ttable ��ü�� ������. ���� **tList**�� time�� �̾Ƴ������� ����ؾߵ�	
			
		}
		
		List<String> seatList = null;
		seatList = new ArrayList<String>();
		for(String seatseq : sseqList) {
			String seat = ssdao.mySeatNo(seatseq);	
			
			seat = seat+"��";
			
			seatList.add(seat);
		}
		
		
		List<Theater> taList = null;
		List<Movie> mList = null;
		
		taList = new ArrayList<Theater>();
		mList= new ArrayList<Movie>();
		
		
		for(Timetable tt : tList) {
			
			
			Theater ta = tadao.getTheater(tt.getTheaterNo());

			taList.add(ta);  //����Ʈ�� ��ȭ�� �� ���� ������ ������ ���̴�. 
			
			MovieAPI ma = new MovieAPI();
			Movie mDetail = ma.getMovieDetail(tt.getMcode());  //API ���� ���� ������ , ���� ����Ѵ�? 
			Movie m = movieDao.getMovie(tt.getMcode());   //DB�� ��ȭ ����
			
			System.out.println("m:"+m);
			System.out.println("mDetail:"+mDetail);
			
			
			m.setMovieNm(mDetail.getMovieNm());
			m.setMovieNmEn(mDetail.getMovieNmEn());   //DB���� ���� ��ȭ ������ ������ �־��ش�.
			m.setWatchGradeNm(mDetail.getWatchGradeNm()); // �󿵵�� 
			m.setShowTm(mDetail.getShowTm());
			
			mList.add(m); //DB+ API���� ��ȭ ���� �߰��ؼ� ����Ʈ�� ��Ҵ�.  
		}

		List<String> mdCheck = new ArrayList<String>();
		System.out.println(mList.toString());

		MovieDiary mdc = null;
		for(Movie mm : mList) {
			
			mdc = new MovieDiary();
			
			mdc = mddao.myDiary(mid ,mm.getMcode());

			if( mdc != null) {
				mdCheck.add("YES");

				System.out.println(mdc.getMcode());
			}else {
				mdCheck.add("NO");

			}
						
		}
		
		for(String ss : mdCheck) {
			
			
			System.out.println(ss);
		}
		
		//tList�� time , mcode ������  taList�� theatername ���� ������ �������ִ�. mList�� ��ȭ���� 

		
		//���� ���̾ ����Ʈ �����ͼ� �ѷ��ֱ� (view������ ���ڿ� mdseq�� ����Ұ���)
		List<MovieDiary> mdList = mddao.allDiary(mid);
		if(mdList != null) {
			model.addAttribute("mdList", mdList); 
		}
		
		//������̾ check�� 
		//List<String> mdCheck = mddao.checkDiary();
		
		int mSize = 0;
		if(mList != null) {
			mSize = mList.size();
		}
		
		
		session.setAttribute("mSize", mSize);
		
		
			
		model.addAttribute("mdCheck", mdCheck);
		model.addAttribute("mList", mList); //��ȭ���� ��� 
		model.addAttribute("tList", tList); //time ������ ��� 
		model.addAttribute("taList", taList); //��ȭ������ 
		model.addAttribute("seatList", seatList);
		
		return "myMovie.jsp";

		
		}
	}

	@RequestMapping(value={"nonMMovie.do"}, method=RequestMethod.GET)
	public String nonMMovie(Model model, HttpServletRequest request, HttpServletRequest response){
			

			HttpSession session = request.getSession();
			String nmid = (String)session.getAttribute("non");
			
			System.out.println("&****************dfdsfsdfs�־ȵ�l*****");
			
			List<SeatAccount> slist = sdao.getSeatAccount(nmid); //�ش� ���̵��� ���������� �����´�.
			
			List<String> tseqList = null;  // timeSeq�� ���� ����Ʈ 
			List<String> sseqList = null;
			tseqList = new ArrayList<String>();
			sseqList = new ArrayList<String>();
			if(slist != null) {
			for(SeatAccount s : slist) {
				
				System.out.println("dealNum : "+s.getDealNum());
				String tseq = s.getTimeSeq();
				
				
				tseqList.add(tseq); // Tseq �� �̾Ƽ� ����Ʈ�� ��´�. 
				
				
				String sseq = s.getSeatSeq();
				sseqList.add(sseq); // sseq �� �̾Ƽ� ����Ʈ�� ��´�. 
			}
			
			
			List<Timetable> tList = null;  //Timetable�� ���̴� ����Ʈ 
			
			tList = new ArrayList<Timetable>();  
			for(String t : tseqList) {					
				
				Timetable ttable = tdao.getTimetable(t);  // ttbale ��ü�� �̾Ƴ���. ���⼭ time�� ����
				tList.add(ttable);  // ttable ��ü�� ������. ���� **tList**�� time�� �̾Ƴ������� ����ؾߵ�	
				
			}
			
			List<String> seatList = null;
			seatList = new ArrayList<String>();
			for(String seatseq : sseqList) {
				String seat = ssdao.mySeatNo(seatseq);	
				
				seat = seat+"��";
				
				seatList.add(seat);
			}
			
			
			List<Theater> taList = null;
			List<Movie> mList = null;
			
			taList = new ArrayList<Theater>();
			mList= new ArrayList<Movie>();
			
			
			for(Timetable tt : tList) {
				
				
				Theater ta = tadao.getTheater(tt.getTheaterNo());

				taList.add(ta);  //����Ʈ�� ��ȭ�� �� ���� ������ ������ ���̴�. 
				
				MovieAPI ma = new MovieAPI();
				Movie mDetail = ma.getMovieDetail(tt.getMcode());  //API ���� ���� ������ , ���� ����Ѵ�? 
				Movie m = movieDao.getMovie(tt.getMcode());   //DB�� ��ȭ ����
				
				System.out.println("m:"+m);
				System.out.println("mDetail:"+mDetail);
				
				
				m.setMovieNm(mDetail.getMovieNm());
				m.setMovieNmEn(mDetail.getMovieNmEn());   //DB���� ���� ��ȭ ������ ������ �־��ش�.
				m.setWatchGradeNm(mDetail.getWatchGradeNm()); // �󿵵�� 
				m.setShowTm(mDetail.getShowTm());
				
				mList.add(m); //DB+ API���� ��ȭ ���� �߰��ؼ� ����Ʈ�� ��Ҵ�.  
			}

			List<String> mdCheck = new ArrayList<String>();
			System.out.println(mList.toString());

			MovieDiary mdc = null;
			for(Movie mm : mList) {
				
				mdc = new MovieDiary();
				
				mdc = mddao.myDiary(mid ,mm.getMcode());

				if( mdc != null) {
					mdCheck.add("YES");

					System.out.println(mdc.getMcode());
				}else {
					mdCheck.add("NO");

				}
							
			}
			
			for(String ss : mdCheck) {
				
				
				System.out.println(ss);
			}
			
			//tList�� time , mcode ������  taList�� theatername ���� ������ �������ִ�. mList�� ��ȭ���� 

			
			//���� ���̾ ����Ʈ �����ͼ� �ѷ��ֱ� (view������ ���ڿ� mdseq�� ����Ұ���)
			List<MovieDiary> mdList = mddao.allDiary(mid);
			if(mdList != null) {
				model.addAttribute("mdList", mdList); 
			}
			
			//������̾ check�� 
			//List<String> mdCheck = mddao.checkDiary();
			
			int mSize = 0;
			if(mList != null) {
				mSize = mList.size();
			}
			
			
			session.setAttribute("mSize", mSize);
			
			
				
			model.addAttribute("mdCheck", mdCheck);
			model.addAttribute("mList", mList); //��ȭ���� ��� 
			model.addAttribute("tList", tList); //time ������ ��� 
			model.addAttribute("taList", taList); //��ȭ������ 
			model.addAttribute("seatList", seatList);
			
			return "myMovie.jsp";

			
			}

		return "myMovie.jsp";
	}
		
	@RequestMapping(value={"MovieDiary.do"}, method=RequestMethod.GET)
	public String movieDiary(Model model, String mid, HttpServletRequest request, HttpServletRequest response){
		
		List<SeatAccount> slist = sdao.getSeatAccount(mid); //�ش� ���̵��� ���������� �����´�.
		
		if(slist != null) {
		List<String> tseqList = null;  // timeSeq�� ���� ����Ʈ 
		List<String> sseqList = null;
		tseqList = new ArrayList<String>();
		sseqList = new ArrayList<String>();
		
		for(SeatAccount s : slist) {
			
			String tseq = s.getTimeSeq();
			
			
			tseqList.add(tseq); // Tseq �� �̾Ƽ� ����Ʈ�� ��´�. 
			
			
			String sseq = s.getSeatSeq();
			sseqList.add(sseq); // sseq �� �̾Ƽ� ����Ʈ�� ��´�. 
		}
		
		
		List<Timetable> tList = null;  //Timetable�� ���̴� ����Ʈ 
		
		tList = new ArrayList<Timetable>();  
		for(String t : tseqList) {					
			
			Timetable ttable = tdao.getTimetable(t);  // ttbale ��ü�� �̾Ƴ���. ���⼭ time�� ����
			tList.add(ttable);  // ttable ��ü�� ������. ���� **tList**�� time�� �̾Ƴ������� ����ؾߵ�	
			
		}
		
		
		List<String> seatList = null;
		seatList = new ArrayList<String>();
		for(String seatseq : sseqList) {
			String seat = ssdao.mySeatNo(seatseq);	
			
			seat = seat+"��";
			
			seatList.add(seat);
		}
		
		
		List<Theater> taList = null;
		List<Movie> mList = null;
		
		taList = new ArrayList<Theater>();
		mList= new ArrayList<Movie>();
		
		
		for(Timetable tt : tList) {
			
			
			Theater ta = tadao.getTheater(tt.getTheaterNo());

			taList.add(ta);  //����Ʈ�� ��ȭ�� �� ���� ������ ������ ���̴�. 
			
			MovieAPI ma = new MovieAPI();
			Movie mDetail = ma.getMovieDetail(tt.getMcode());  //API ���� ���� ������ , ���� ����Ѵ�? 
			Movie m = movieDao.getMovie(tt.getMcode());   //DB�� ��ȭ ����
			
			m.setMovieNm(mDetail.getMovieNm());
			m.setMovieNmEn(mDetail.getMovieNmEn());   //DB���� ���� ��ȭ ������ ������ �־��ش�.
			m.setWatchGradeNm(mDetail.getWatchGradeNm()); // �󿵵�� 
			m.setShowTm(mDetail.getShowTm());
			
			mList.add(m); //DB+ API���� ��ȭ ���� �߰��ؼ� ����Ʈ�� ��Ҵ�.  
		}

		//tList�� time , mcode ������  taList�� theatername ���� ������ �������ִ�. mList�� ��ȭ���� 

		List<String> mdCheck = new ArrayList<String>();
		for(Movie mm : mList) {

			MovieDiary mdc = mddao.myDiary(mid ,mm.getMcode());
			

			if( mdc != null) {
				mdCheck.add("YES");
			}else {
				mdCheck.add("NO");
			}
						
		}
		
		
		int mSize = 0;
		if(mList != null) {
			mSize = mList.size();
		}
		
		
		HttpSession session = request.getSession();		
		
		session.setAttribute("mSize", mSize);

		//���� ���̾ ����Ʈ �����ͼ� �ѷ��ֱ� (view������ ���ڿ� mdseq�� ����Ұ���)
		List<MovieDiary> mdList = mddao.allDiary(mid);
		if(mdList != null) {
			model.addAttribute("mdList", mdList); 
		}		
		
		model.addAttribute("mdList", mdList);
		model.addAttribute("mdCheck", mdCheck);
		model.addAttribute("mList", mList); //��ȭ���� ��� 
		model.addAttribute("tList", tList); //time ������ ��� 
		model.addAttribute("taList", taList); //��ȭ������ 
		model.addAttribute("seatList", seatList);
		
		return "movieDiary.jsp";
		
		}
		return "movieDiary.jsp";
	}
	
	@RequestMapping(value={"MovieDiaryReg.do"}, method=RequestMethod.GET)
	public String movieDiaryReg(Model model, String mid, String mcode, String day, String time, String theaterNo){
		
		/*List<MovieDiary> mdList = mddao.myDiary(mid, mcode);*/
		
		
		MovieAPI ma = new MovieAPI();
		Movie mDetail = ma.getMovieDetail(mcode);  //API ���� ���� ������ , ���� ����Ѵ�? 
		Movie m = movieDao.getMovie(mcode);   //DB�� ��ȭ ����
		
		m.setMovieNm(mDetail.getMovieNm());
		m.setMovieNmEn(mDetail.getMovieNmEn());   //DB���� ���� ��ȭ ������ ������ �־��ش�.
		m.setWatchGradeNm(mDetail.getWatchGradeNm()); // �󿵵�� 

		
		
		
		System.out.println("*****check********" + mid);

		
		String [] days = day.split("/");
		String mDay = "20" + days[0] + "��" + days[1] + "��"+ days[2] +"��";
		
		Theater ta = tadao.getTheater(theaterNo);
		String theater = ta.getTheatername();		
				
		
		String mdtime = mDay + " "+ time;

		List<MovieDiary> mdList = mddao.allDiary(mid);		
		
		model.addAttribute("movie", m);
		model.addAttribute("mdtime", mdtime);
		model.addAttribute("theater", theater);
		if(mdList != null) {
			model.addAttribute("mdList", mdList); 
		}	
		
			
		
		return "movieDiaryReg.jsp";
	}
	
	
	@RequestMapping(value={"MovieDiaryReg.do"}, method=RequestMethod.POST)
	public String movieDiaryReg(Model model, String mid, String mcode, MovieDiary md){
		
		/*List<MovieDiary> mdList = mddao.myDiary(mid, mcode);*/
		
		System.out.println(md.toString());
		
		int af = mddao.addDiary(md);
		if(af == 1) {
			System.out.println("���̾ �߰� ����!");
		}else {
			System.out.println("���̾ �߰� ����!");
		}

		
		
		return "redirect:MovieDiary.do?mid="+mid;
	}
	
	@RequestMapping(value={"DiaryDetail.do"}, method=RequestMethod.GET)
	public String diaryDetail(String mid, String mdseq, Model model, String mcode){		
		
		List<MovieDiary> mdList = mddao.allDiary(mid);
		
		
		if(mcode != null) {
			String mdseq_ = null;
			mdseq_ = mddao.diaryDetail(mid, mcode);
			mdseq = mdseq_;
			
			MovieDiary md = mddao.getDiary(mdseq);
			
			if(mdList != null) {
				model.addAttribute("mdList", mdList); 
			}	
			model.addAttribute("md", md);

			return "diaryDetail.jsp";
			
		}else {	 	
		
			MovieDiary md = mddao.getDiary(mdseq);
			
			if(mdList != null) {
				model.addAttribute("mdList", mdList); 
			}	
			model.addAttribute("md", md);
			
			return "diaryDetail.jsp";
		}
	}
	@RequestMapping(value={"MovieDiaryEdit.do"}, method=RequestMethod.GET)
	public String movieDiaryEdit(Model model, String mdseq, String mid){
		
		List<MovieDiary> mdList = mddao.allDiary(mid);
		
		
		MovieDiary md = mddao.getDiary(mdseq);
		
		if(mdList != null) {
			model.addAttribute("mdList", mdList); 
		}	
		model.addAttribute("md", md);
			
		return "movieDiaryEdit.jsp";
	}
	
	@RequestMapping(value={"MovieDiaryEdit.do"}, method=RequestMethod.POST)
	public String movieDiaryEdit(MovieDiary md,String mid){
		
		

		int af = mddao.updateDiary(md);
		
		if(af == 1 ) {
			System.out.println("���̾ ���� ����!");
		}else {
			System.out.println("���̾ ���� ����!");
		}
		
			
		return "redirect:DiaryDetail.do?mdseq="+md.getMdseq()+"&mid="+mid;
	}
	
	
	
	@RequestMapping(value={"DiaryDelete.do"}, method=RequestMethod.GET)
	public String diaryDelete(String mid , String mdseq){
		
		
		int af = mddao.deleteDiary(mdseq);
		if(af == 1 ) {
			System.out.println("���̾ ���� ����!");
		}else {
			System.out.println("���̾ ���� ����!");
		}
		
			
		return "redirect:myMovie.do?mid="+mid;
	}
	
	
	
}
