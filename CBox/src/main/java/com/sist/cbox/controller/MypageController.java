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
	//비밀번호 체크
	@RequestMapping("pwdCheck.do")
	public String pwdCheck(HttpServletRequest request, String pwd) {
		System.out.println("pwd : "+pwd);
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		Member m = mdao.getMember(mid);
		if(pwd.equals(m.getPwd())) {
			System.out.println("비밀번호 일치");
			return "redirect:updateMember.do";
		}else {
			System.out.println("비밀번호가 일치하지 않습니다.");
			return "redirect:memberInfo.do";
		}
	}
	//회원정보 수정
	@RequestMapping(value={"updateMember.do"}, method=RequestMethod.GET)
	public String updateMember(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");

		System.out.println("아이디 : "+mid);
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
			System.out.println("업데이트 성공");
			return "redirect:memberInfo.do";
		}else {
			System.out.println("업데이트 실패");
			return "redirect:updateMember.do";
		}
	}
	

	@RequestMapping("delMember.do")
	public String delMember(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");

		int af = mdao.delMember(mid);
		if(af==1) {
			System.out.println("회원 삭제 성공");
			return "redirect:../index.do";
		}else {
			System.out.println("회원 삭제 실패");
			//마이페이지로 이동
			return "";
		}
	}
	
	
	@RequestMapping("shopMygiftycon.do")
	public String shopMygiftycon(HttpServletRequest request, Model model, String type) {
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		ArrayList<GiftyconAccount> gList = null;
		ArrayList<GiftyconAccount> ugList = null;
		System.out.println("if문밖type="+type);
		if(type.equals("M")){
			//사용가능한 기프티콘 목록
			System.out.println("if문type="+type);
			gList = (ArrayList<GiftyconAccount>) gadao.getMygiftcon_M(mid);
			for(int i=0; i<gList.size(); i++) {
				String giftyconCode = gList.get(i).getGiftyconCode();
				gList.get(i).setGiftyconCode(gdao.getGiftycon(giftyconCode).getGiftyconName());
			}
			//사용한 기프티콘 목록
			ugList = (ArrayList<GiftyconAccount>) gadao.getUsedMygiftcon_M(mid);
			for(int i=0; i<ugList.size(); i++) {
				String giftyconCode = ugList.get(i).getGiftyconCode();
				ugList.get(i).setGiftyconCode(gdao.getGiftycon(giftyconCode).getGiftyconName());
			}
			
		}else {
			//사용가능한 기프티콘 목록
			gList = (ArrayList<GiftyconAccount>) gadao.getMygiftcon(mid);
			for(int i=0; i<gList.size(); i++) {
				String giftyconCode = gList.get(i).getGiftyconCode();
				gList.get(i).setGiftyconCode(gdao.getGiftycon(giftyconCode).getGiftyconName());
			}
			//사용한 기프티콘 목록
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
		
		System.out.println("&****************dfdsfsdfs왜안돼l*****");
		
		List<SeatAccount> slist = sdao.getSeatAccount(mid); //해당 아이디의 예매정보를 가져온다.
		
		List<String> tseqList = null;  // timeSeq를 가진 리스트 
		List<String> sseqList = null;
		tseqList = new ArrayList<String>();
		sseqList = new ArrayList<String>();
		if(slist != null) {
		for(SeatAccount s : slist) {
			
			System.out.println("dealNum : "+s.getDealNum());
			String tseq = s.getTimeSeq();
			
			
			tseqList.add(tseq); // Tseq 를 뽑아서 리스트에 담는다. 
			
			
			String sseq = s.getSeatSeq();
			sseqList.add(sseq); // sseq 를 뽑아서 리스트에 담는다. 
		}
		
		
		List<Timetable> tList = null;  //Timetable을 먹이는 리스트 
		
		tList = new ArrayList<Timetable>();  
		for(String t : tseqList) {					
			
			Timetable ttable = tdao.getTimetable(t);  // ttbale 객체를 뽑아낸다. 여기서 time을 쓸것
			tList.add(ttable);  // ttable 객체를 만들어낸다. 이제 **tList**는 time을 뽑아내기위해 사용해야됨	
			
		}
		
		List<String> seatList = null;
		seatList = new ArrayList<String>();
		for(String seatseq : sseqList) {
			String seat = ssdao.mySeatNo(seatseq);	
			
			seat = seat+"번";
			
			seatList.add(seat);
		}
		
		
		List<Theater> taList = null;
		List<Movie> mList = null;
		
		taList = new ArrayList<Theater>();
		mList= new ArrayList<Movie>();
		
		
		for(Timetable tt : tList) {
			
			
			Theater ta = tadao.getTheater(tt.getTheaterNo());

			taList.add(ta);  //리스트에 영화를 본 지점 정보를 가져올 것이다. 
			
			MovieAPI ma = new MovieAPI();
			Movie mDetail = ma.getMovieDetail(tt.getMcode());  //API 에서 들어온 상세정보 , 제목만 사용한다? 
			Movie m = movieDao.getMovie(tt.getMcode());   //DB의 영화 정보
			
			System.out.println("m:"+m);
			System.out.println("mDetail:"+mDetail);
			
			
			m.setMovieNm(mDetail.getMovieNm());
			m.setMovieNmEn(mDetail.getMovieNmEn());   //DB에서 빼온 영화 정보에 제목을 넣어준다.
			m.setWatchGradeNm(mDetail.getWatchGradeNm()); // 상영등급 
			m.setShowTm(mDetail.getShowTm());
			
			mList.add(m); //DB+ API에서 영화 정보 추가해서 리스트에 담았다.  
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
		
		//tList는 time , mcode 정보를  taList는 theatername 지점 정보를 가지고있다. mList는 영화정보 

		
		//무비 다이어리 리스트 가져와서 뿌려주기 (view에서는 숫자와 mdseq를 사용할거임)
		List<MovieDiary> mdList = mddao.allDiary(mid);
		if(mdList != null) {
			model.addAttribute("mdList", mdList); 
		}
		
		//무비다이어리 check용 
		//List<String> mdCheck = mddao.checkDiary();
		
		int mSize = 0;
		if(mList != null) {
			mSize = mList.size();
		}
		
		
		session.setAttribute("mSize", mSize);
		
		
			
		model.addAttribute("mdCheck", mdCheck);
		model.addAttribute("mList", mList); //영화정보 써라 
		model.addAttribute("tList", tList); //time 빼내서 써라 
		model.addAttribute("taList", taList); //영화관정보 
		model.addAttribute("seatList", seatList);
		
		return "myMovie.jsp";

		
		}
	}

	@RequestMapping(value={"nonMMovie.do"}, method=RequestMethod.GET)
	public String nonMMovie(Model model, HttpServletRequest request, HttpServletRequest response){
			

			HttpSession session = request.getSession();
			String nmid = (String)session.getAttribute("non");
			
			System.out.println("&****************dfdsfsdfs왜안돼l*****");
			
			List<SeatAccount> slist = sdao.getSeatAccount(nmid); //해당 아이디의 예매정보를 가져온다.
			
			List<String> tseqList = null;  // timeSeq를 가진 리스트 
			List<String> sseqList = null;
			tseqList = new ArrayList<String>();
			sseqList = new ArrayList<String>();
			if(slist != null) {
			for(SeatAccount s : slist) {
				
				System.out.println("dealNum : "+s.getDealNum());
				String tseq = s.getTimeSeq();
				
				
				tseqList.add(tseq); // Tseq 를 뽑아서 리스트에 담는다. 
				
				
				String sseq = s.getSeatSeq();
				sseqList.add(sseq); // sseq 를 뽑아서 리스트에 담는다. 
			}
			
			
			List<Timetable> tList = null;  //Timetable을 먹이는 리스트 
			
			tList = new ArrayList<Timetable>();  
			for(String t : tseqList) {					
				
				Timetable ttable = tdao.getTimetable(t);  // ttbale 객체를 뽑아낸다. 여기서 time을 쓸것
				tList.add(ttable);  // ttable 객체를 만들어낸다. 이제 **tList**는 time을 뽑아내기위해 사용해야됨	
				
			}
			
			List<String> seatList = null;
			seatList = new ArrayList<String>();
			for(String seatseq : sseqList) {
				String seat = ssdao.mySeatNo(seatseq);	
				
				seat = seat+"번";
				
				seatList.add(seat);
			}
			
			
			List<Theater> taList = null;
			List<Movie> mList = null;
			
			taList = new ArrayList<Theater>();
			mList= new ArrayList<Movie>();
			
			
			for(Timetable tt : tList) {
				
				
				Theater ta = tadao.getTheater(tt.getTheaterNo());

				taList.add(ta);  //리스트에 영화를 본 지점 정보를 가져올 것이다. 
				
				MovieAPI ma = new MovieAPI();
				Movie mDetail = ma.getMovieDetail(tt.getMcode());  //API 에서 들어온 상세정보 , 제목만 사용한다? 
				Movie m = movieDao.getMovie(tt.getMcode());   //DB의 영화 정보
				
				System.out.println("m:"+m);
				System.out.println("mDetail:"+mDetail);
				
				
				m.setMovieNm(mDetail.getMovieNm());
				m.setMovieNmEn(mDetail.getMovieNmEn());   //DB에서 빼온 영화 정보에 제목을 넣어준다.
				m.setWatchGradeNm(mDetail.getWatchGradeNm()); // 상영등급 
				m.setShowTm(mDetail.getShowTm());
				
				mList.add(m); //DB+ API에서 영화 정보 추가해서 리스트에 담았다.  
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
			
			//tList는 time , mcode 정보를  taList는 theatername 지점 정보를 가지고있다. mList는 영화정보 

			
			//무비 다이어리 리스트 가져와서 뿌려주기 (view에서는 숫자와 mdseq를 사용할거임)
			List<MovieDiary> mdList = mddao.allDiary(mid);
			if(mdList != null) {
				model.addAttribute("mdList", mdList); 
			}
			
			//무비다이어리 check용 
			//List<String> mdCheck = mddao.checkDiary();
			
			int mSize = 0;
			if(mList != null) {
				mSize = mList.size();
			}
			
			
			session.setAttribute("mSize", mSize);
			
			
				
			model.addAttribute("mdCheck", mdCheck);
			model.addAttribute("mList", mList); //영화정보 써라 
			model.addAttribute("tList", tList); //time 빼내서 써라 
			model.addAttribute("taList", taList); //영화관정보 
			model.addAttribute("seatList", seatList);
			
			return "myMovie.jsp";

			
			}

		return "myMovie.jsp";
	}
		
	@RequestMapping(value={"MovieDiary.do"}, method=RequestMethod.GET)
	public String movieDiary(Model model, String mid, HttpServletRequest request, HttpServletRequest response){
		
		List<SeatAccount> slist = sdao.getSeatAccount(mid); //해당 아이디의 예매정보를 가져온다.
		
		if(slist != null) {
		List<String> tseqList = null;  // timeSeq를 가진 리스트 
		List<String> sseqList = null;
		tseqList = new ArrayList<String>();
		sseqList = new ArrayList<String>();
		
		for(SeatAccount s : slist) {
			
			String tseq = s.getTimeSeq();
			
			
			tseqList.add(tseq); // Tseq 를 뽑아서 리스트에 담는다. 
			
			
			String sseq = s.getSeatSeq();
			sseqList.add(sseq); // sseq 를 뽑아서 리스트에 담는다. 
		}
		
		
		List<Timetable> tList = null;  //Timetable을 먹이는 리스트 
		
		tList = new ArrayList<Timetable>();  
		for(String t : tseqList) {					
			
			Timetable ttable = tdao.getTimetable(t);  // ttbale 객체를 뽑아낸다. 여기서 time을 쓸것
			tList.add(ttable);  // ttable 객체를 만들어낸다. 이제 **tList**는 time을 뽑아내기위해 사용해야됨	
			
		}
		
		
		List<String> seatList = null;
		seatList = new ArrayList<String>();
		for(String seatseq : sseqList) {
			String seat = ssdao.mySeatNo(seatseq);	
			
			seat = seat+"번";
			
			seatList.add(seat);
		}
		
		
		List<Theater> taList = null;
		List<Movie> mList = null;
		
		taList = new ArrayList<Theater>();
		mList= new ArrayList<Movie>();
		
		
		for(Timetable tt : tList) {
			
			
			Theater ta = tadao.getTheater(tt.getTheaterNo());

			taList.add(ta);  //리스트에 영화를 본 지점 정보를 가져올 것이다. 
			
			MovieAPI ma = new MovieAPI();
			Movie mDetail = ma.getMovieDetail(tt.getMcode());  //API 에서 들어온 상세정보 , 제목만 사용한다? 
			Movie m = movieDao.getMovie(tt.getMcode());   //DB의 영화 정보
			
			m.setMovieNm(mDetail.getMovieNm());
			m.setMovieNmEn(mDetail.getMovieNmEn());   //DB에서 빼온 영화 정보에 제목을 넣어준다.
			m.setWatchGradeNm(mDetail.getWatchGradeNm()); // 상영등급 
			m.setShowTm(mDetail.getShowTm());
			
			mList.add(m); //DB+ API에서 영화 정보 추가해서 리스트에 담았다.  
		}

		//tList는 time , mcode 정보를  taList는 theatername 지점 정보를 가지고있다. mList는 영화정보 

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

		//무비 다이어리 리스트 가져와서 뿌려주기 (view에서는 숫자와 mdseq를 사용할거임)
		List<MovieDiary> mdList = mddao.allDiary(mid);
		if(mdList != null) {
			model.addAttribute("mdList", mdList); 
		}		
		
		model.addAttribute("mdList", mdList);
		model.addAttribute("mdCheck", mdCheck);
		model.addAttribute("mList", mList); //영화정보 써라 
		model.addAttribute("tList", tList); //time 빼내서 써라 
		model.addAttribute("taList", taList); //영화관정보 
		model.addAttribute("seatList", seatList);
		
		return "movieDiary.jsp";
		
		}
		return "movieDiary.jsp";
	}
	
	@RequestMapping(value={"MovieDiaryReg.do"}, method=RequestMethod.GET)
	public String movieDiaryReg(Model model, String mid, String mcode, String day, String time, String theaterNo){
		
		/*List<MovieDiary> mdList = mddao.myDiary(mid, mcode);*/
		
		
		MovieAPI ma = new MovieAPI();
		Movie mDetail = ma.getMovieDetail(mcode);  //API 에서 들어온 상세정보 , 제목만 사용한다? 
		Movie m = movieDao.getMovie(mcode);   //DB의 영화 정보
		
		m.setMovieNm(mDetail.getMovieNm());
		m.setMovieNmEn(mDetail.getMovieNmEn());   //DB에서 빼온 영화 정보에 제목을 넣어준다.
		m.setWatchGradeNm(mDetail.getWatchGradeNm()); // 상영등급 

		
		
		
		System.out.println("*****check********" + mid);

		
		String [] days = day.split("/");
		String mDay = "20" + days[0] + "년" + days[1] + "월"+ days[2] +"일";
		
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
			System.out.println("다이어리 추가 성공!");
		}else {
			System.out.println("다이어리 추가 실패!");
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
			System.out.println("다이어리 수정 성공!");
		}else {
			System.out.println("다이어리 수정 실패!");
		}
		
			
		return "redirect:DiaryDetail.do?mdseq="+md.getMdseq()+"&mid="+mid;
	}
	
	
	
	@RequestMapping(value={"DiaryDelete.do"}, method=RequestMethod.GET)
	public String diaryDelete(String mid , String mdseq){
		
		
		int af = mddao.deleteDiary(mdseq);
		if(af == 1 ) {
			System.out.println("다이어리 삭제 성공!");
		}else {
			System.out.println("다이어리 삭제 실패!");
		}
		
			
		return "redirect:myMovie.do?mid="+mid;
	}
	
	
	
}
