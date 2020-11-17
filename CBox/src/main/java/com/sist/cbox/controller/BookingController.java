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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sist.cbox.api.MovieAPI;
import com.sist.cbox.dao.CardDAO;
import com.sist.cbox.dao.CouponAccountDAO;
import com.sist.cbox.dao.CouponDAO;
import com.sist.cbox.dao.GiftyconAccountDAO;
import com.sist.cbox.dao.GiftyconDAO;
import com.sist.cbox.dao.GradeDAO;
import com.sist.cbox.dao.MemberDAO;
import com.sist.cbox.dao.MembershipDAO;
import com.sist.cbox.dao.MovieDAO;
import com.sist.cbox.dao.NonmemberDAO;
import com.sist.cbox.dao.PointAccountDAO;
import com.sist.cbox.dao.SeatAccountDAO;
import com.sist.cbox.dao.SeatDAO;
import com.sist.cbox.dao.TheaterDAO;
import com.sist.cbox.dao.TimetableDAO;
import com.sist.cbox.vo.Card;
import com.sist.cbox.vo.Coupon;
import com.sist.cbox.vo.CouponAccount;
import com.sist.cbox.vo.Giftycon;
import com.sist.cbox.vo.GiftyconAccount;
import com.sist.cbox.vo.Grade;
import com.sist.cbox.vo.Membership;
import com.sist.cbox.vo.Movie;
import com.sist.cbox.vo.Nonmember;
import com.sist.cbox.vo.PointAccount;
import com.sist.cbox.vo.SeatAccount;
import com.sist.cbox.vo.Theater;
import com.sist.cbox.vo.Timetable;


@Controller
@RequestMapping("/Ticket/*")
public class BookingController {

	//@Autowired
	//MembershipDAO msdao;
	//@Autowired
	//CouponAccountDAO cadao;
	//@Autowired
	//CouponDAO cdao;
	
	@Autowired
	NonmemberDAO nondao;
	@Autowired
	MemberDAO mdao;
	@Autowired
	MembershipDAO msdao;
	@Autowired
	CouponAccountDAO cadao;
	@Autowired
	CouponDAO cdao;
	@Autowired
	GiftyconAccountDAO gadao;
	@Autowired
	PointAccountDAO pdao;
	@Autowired
	MovieDAO mvdao;
	@Autowired
	SeatAccountDAO sadao;
	@Autowired
	TimetableDAO ttdao;
	@Autowired
	SeatDAO sdao;
	@Autowired
	TheaterDAO tdao;
	@Autowired
	CardDAO cardao;
	@Autowired
	GiftyconDAO gdao;
	private GradeDAO gddao;
	@Autowired
	public void setGddao(GradeDAO gddao) {
		this.gddao = gddao;
	}
	@Autowired
	private CouponDAO cpdao;
	
	@RequestMapping("bookingPage.do")
	public String booking(HttpServletRequest request,Model model,String timeSeq, String memberType){
		
		/*String mid;
		
		if(request.getSession().getAttribute("mid")==null){
			mid="AMANDA33";
		}else{
			mid=(String)request.getSession().getAttribute("mid");
		}*/

		
		Timetable table=ttdao.getTimetable(timeSeq);
		String theaterNo=table.getTheaterNo();
		String mcode=table.getMcode();
		
		MovieAPI movieApi=new MovieAPI();
		Movie movie=movieApi.getMovieDetail(mcode);
		movie.setImage(mvdao.getMovie(mcode).getImage());
		
		String title=movie.getMovieNm();
		String day=table.getDay();
		String time=table.getTime();
		Theater theater=tdao.getTheater(theaterNo);
		List<SeatAccount> salist=sadao.getOccupiedList(timeSeq);
		String list="";
		for(int i=0;i<salist.size();i++){
			String seatNo=sadao.getSeatNo(salist.get(i).getSeatSeq(),timeSeq);
			String result="'"+seatNo.substring(0, 1)+"-"+seatNo.substring(1,seatNo.length())+"'";
			if(i!=salist.size()) {
				list+=result+",";
			}
		}
		String occupiedlist=list.substring(0, list.length());		
		String price="9000";
		
		String seatMap=scanSeat(timeSeq);
		System.out.println(seatMap);
		
		model.addAttribute("seatMap",seatMap);
		model.addAttribute("timeSeq",timeSeq);
		model.addAttribute("title",title);
		model.addAttribute("day",day);
		model.addAttribute("time",time);
		model.addAttribute("theater",theater);
		model.addAttribute("price",price);
		model.addAttribute("occupiedlist",occupiedlist);
		model.addAttribute("movie",movie);
		model.addAttribute("memberType",memberType);
		
		return "booking.jsp";
	}
	
	private String scanSeat(String timeSeq) {
		String theaterNo=sadao.getTheaterNo(timeSeq);
		List<String> seatList=sdao.getSeatNo(theaterNo);
		
		String[][]ar=new String[10][10];
		for(int i=0;i<10;i++) {
			for(int j=0;j<10;j++) {
				ar[i][j]="_";
			}
		}
		
		for(int i=0;i<seatList.size();i++) {
			if(seatList.get(i).substring(0,1).equals("A")) {
				int seatNum=Integer.parseInt(seatList.get(i).substring(1,seatList.get(i).length()));
				ar[0][seatNum-1]="a";
			}else if(seatList.get(i).substring(0,1).equals("B")) {
				int seatNum=Integer.parseInt(seatList.get(i).substring(1,seatList.get(i).length()));
				ar[1][seatNum-1]="a";
			}else if(seatList.get(i).substring(0,1).equals("C")) {
				int seatNum=Integer.parseInt(seatList.get(i).substring(1,seatList.get(i).length()));
				ar[2][seatNum-1]="a";
			}else if(seatList.get(i).substring(0,1).equals("D")) {
				int seatNum=Integer.parseInt(seatList.get(i).substring(1,seatList.get(i).length()));
				ar[3][seatNum-1]="a";
			}else if(seatList.get(i).substring(0,1).equals("E")) {
				int seatNum=Integer.parseInt(seatList.get(i).substring(1,seatList.get(i).length()));
				ar[4][seatNum-1]="a";
			}else if(seatList.get(i).substring(0,1).equals("F")) {
				int seatNum=Integer.parseInt(seatList.get(i).substring(1,seatList.get(i).length()));
				ar[5][seatNum-1]="a";
			}else if(seatList.get(i).substring(0,1).equals("G")) {
				int seatNum=Integer.parseInt(seatList.get(i).substring(1,seatList.get(i).length()));
				ar[6][seatNum-1]="a";
			}else if(seatList.get(i).substring(0,1).equals("H")) {
				int seatNum=Integer.parseInt(seatList.get(i).substring(1,seatList.get(i).length()));
				ar[7][seatNum-1]="a";
			}else if(seatList.get(i).substring(0,1).equals("I")) {
				int seatNum=Integer.parseInt(seatList.get(i).substring(1,seatList.get(i).length()));
				ar[8][seatNum-1]="a";
			}else if(seatList.get(i).substring(0,1).equals("J")) {
				int seatNum=Integer.parseInt(seatList.get(i).substring(1,seatList.get(i).length()));
				ar[9][seatNum-1]="a";
			}
		}
		String result="";
		for(int i=0;i<10;i++) {
			result+="'";
			for(int j=0;j<10;j++) {
				result+=ar[i][j];
			}
			if(i!=9) {
				result+="',";
			}else {
				result+="'";
			}
		}
		return result;
	}
	
	
	@RequestMapping(value={"payPage.do"},method=RequestMethod.GET)
	public String pay(HttpServletRequest request,Model model,String total,String timeSeq,String seat, int point, int dpoint, int dealNum, String code, String memberType) {
		
		String mid = null;
		System.out.println(memberType);
		if( memberType.equals("non")) {
			String nmid = (String)request.getSession().getAttribute("non");
			System.out.println("비회원 아이디 : "+nmid);
			System.out.println("비회원 이름 : "+nondao.getNonMember(nmid).getName());
			mid = nondao.getNonMember(nmid).getName();
		}else {
			mid=(String)request.getSession().getAttribute("mid");
		}
		
		/*if(request.getSession().getAttribute("mid")==null){
			mid="green";
		}else{
		}*/
		System.out.println("seat:"+seat);
		System.out.println("point!!! : "+point);
		System.out.println("dpoint!!! : "+dpoint);
		
		model.addAttribute("code", code);
		model.addAttribute("dealNum", dealNum);
		model.addAttribute("point", point);
		model.addAttribute("dpoint", dpoint);
		model.addAttribute("price",total);
		model.addAttribute("mid",mid);
		model.addAttribute("seat",seat);
		model.addAttribute("timeSeq",timeSeq);
		model.addAttribute("memberType",memberType);
		return "payment.jsp";
	}
	
	@RequestMapping(value={"payment.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String payment(String mid, String cardNum, String pwd,String seat, String timeSeq,HttpServletRequest request, String total, int point, int dpoint, int dealNum, String code,String memberType){
		System.out.println("timeSeq~~~ : "+timeSeq);
		System.out.println("point~~~ : "+point);
		System.out.println("gk....:"+dealNum);
		System.out.println("코코코코코드드드드듣 : "+code);
		System.out.println("total : "+total);
		
		System.out.println("cardNum="+cardNum);
		System.out.println("mid="+mid);
		System.out.println("pwd : "+pwd);
		System.out.println("timeSeq: "+timeSeq);
		System.out.println("결제하기seat: "+seat);
		
		
		
		Card card = cardao.getCard(cardNum);
		String[] seats=seat.split("/");
		if(card==null){
			System.out.println("cardX");
			return "cardX";
		}else if(!card.getMid().equals(mid)){
			System.out.println("midX");
			return "midX";
		}else if(card.getPwd().equals(pwd)){
			if(request.getSession().getAttribute("mid")==null){
				mid="green";
			}else{
				mid=(String)request.getSession().getAttribute("mid");
			}
			for(String s:seats) {
				System.out.println(s);
				System.out.println(s+" : "+timeSeq);
				String seatSeq=sadao.getSeatSeq(s, timeSeq);
				System.out.println("seatSeq: "+seatSeq);
				sadao.addBookingMid(mid, timeSeq, seatSeq);
			}
			
			if(memberType.equals("non")) {
				
			}else {
																//////////////////////////
				//등급검사와 포인트적립 그리고 업뎃
				int uppoint = (int) (Integer.parseInt(total)*0.2);
				System.out.println("uppoint : "+uppoint);
				//int uppoint = 2000;
				//1. 내 등급검사
				String myGrade = msdao.getGrade(mid);
				
				//목표그레이트
				Grade upgrade = gddao.nextGrade(mid);
				
				System.out.println("myGrade : "+myGrade);
				//System.out.println("upgrade : "+upgrade);
				//현재내포인트
				//int mypoint = pdao.getPoint(mid);
				
				//2. point 적립
				System.out.println("사용한 point : "+point);
				PointAccount pa = new PointAccount();
				if(point==0) {
					pa.setMid(mid);
					pa.setPoint(uppoint);
					pa.setSort("예매");
					
					int af = pdao.addPointAc(pa);
					if(af==1) {
						System.out.println("적립했다.");
						Membership mb = new Membership();
						mb.setAccPoint(point);
						mb.setUsablePoint((int)pa.getPoint());
						mb.setMid(mid);
						
						//현재내포인트
						int mypoint = pdao.getPoint(mid);//현재내포인트
						System.out.println("적립하기전 포인트다 : "+mypoint);
						System.out.println("적립할 포인트다 : "+uppoint);
						
						if(upgrade!=null) {
							System.out.println("목표 포인트다 :"+upgrade.getReqpoint());
							System.out.println("적립한 내 포인트다 : "+(mypoint+uppoint));
							if(Integer.parseInt(upgrade.getReqpoint())<(mypoint+uppoint)) {
								int af2 = msdao.updateMembership(mid, (mypoint+uppoint), upgrade.getGradeName());
								if(af2==1) {
									System.out.println("업데이트했다.");
								}
							}else {
								int af6 = msdao.upMembership(mid, mypoint);
								if(af6==1) {
									System.out.println("업데이트못해");
								}
							}
							
						}
					}
					System.out.println("적립후 내 등급 : "+msdao.getGrade(mid));
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
				}else {
					System.out.println("구매시 적립 안합니다.");
					if(point==0) {
						System.out.println("포인트 차감아님");
						//쿠폰어카운트 업뎃
						if(code.equals("M1")) {
							if(dealNum!=0) {
								int af5 = gadao.upGiftyconAc(dealNum);
							}
						}
					}else {
						pa.setMid(mid);
						pa.setPoint(-point);
						pa.setSort("구매시 포인트 사용");
					}
				}
			}							
			
			//////////////////////////
			System.out.println("success");
			return "success";
		}else{
			System.out.println("pwdX");
			return "cardX";
		}
		
	}
	
	
	@RequestMapping("bookingInfo.do")
	public String bookingInfo(HttpServletRequest request, Model model, String mcode, String memberType) {
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		
		if(mid==null&&memberType==null){
			session.setAttribute("url", "redirect:../Ticket/bookingInfo.do");
			return "redirect:../joinus/login.do";
		}
		
		String selectM = null;
		if(mcode!=null) {
			selectM = mcode;
		}
		
		System.out.println("selectM= "+selectM);
		ArrayList<String> mcodes = (ArrayList<String>) ttdao.getMcodes();
		ArrayList<Movie> movies = new ArrayList<Movie>();
	
		MovieAPI api = new MovieAPI();
		for(int i=0; i<mcodes.size(); i++) {
			Movie m = new Movie();
			m = api.getMovieDetail(mcodes.get(i));
			movies.add(m);
		}
		
		/*for(Movie listM : movies){			

			Movie daoMovie = mdao.getMovie(listM.getMovieCd()); //DB
			
			if(daoMovie==null){
				listM.setImage("../image/choo.jpg");
				listM.setGPA(0);
				listM.setSummary("아직 내용 입력전");
				listM.setMcode(listM.getMovieCd()); // 무비정보 생성

				System.out.println(listM.toString());
				
				mdao.addMovie(listM); //없으면 디폴트줘서 무비객체 생성

			}else{							
				listM.setSummary(daoMovie.getSummary());
				listM.setGPA(daoMovie.getGPA());
				listM.setImage(daoMovie.getImage());
												
				mdao.updateMovie(listM); // 
				
			}			
		}*/
		
		
		
		ArrayList<String> theaterNames = (ArrayList<String>) ttdao.getTheaterNames();
		//ArrayList<Theater> theaters = new ArrayList<Theater>();
		
		model.addAttribute("movies",movies);
		model.addAttribute("selectM",selectM);
		model.addAttribute("theaterNames",theaterNames);
		model.addAttribute("memberType",memberType);
		
		
		return "bookingInfo.jsp";
	}
		

	
	@RequestMapping("movie_theaterList.do")
	@ResponseBody
	public String movie_theaterList(Model model, String mcode) {
		
		System.out.println(mcode);
		ArrayList<String> theaterNames = (ArrayList<String>) ttdao.selectTheater(mcode);
		for(int i=0; i<theaterNames.size(); i++) {
			System.out.println(theaterNames.get(i));
		}
		Gson gson = new Gson();
		String jsonStr = gson.toJson(theaterNames);
		
		System.out.println(jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping("movie_timetableDay.do")
	@ResponseBody
	public String movie_timetableDay(Model model, String mcode, String theaterName) {
		
		System.out.println("timetableList.do===="+theaterName+":"+mcode);
		ArrayList<String> timetables =(ArrayList<String>) ttdao.selectDay(mcode, theaterName);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(timetables);
		
		System.out.println(jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping("movie_timeList.do")
	@ResponseBody
	public String movie_timeList(Model model, String mcode, String theaterName, String day) {
		System.out.println("timeList.do===="+theaterName+":"+mcode+":"+day);
		ArrayList<Timetable> timetables =(ArrayList<Timetable>) ttdao.selectTime(mcode, theaterName, day);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(timetables);
		
		System.out.println(jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping(value={"getMovie.do"})
	@ResponseBody
	public String MovieChart(Model model, String mcode){
		
		MovieAPI api = new MovieAPI();
		Movie movie = api.getMovieDetail(mcode);
		System.out.println(mcode);
		movie.setImage(mvdao.getMovie(mcode).getImage());
		Gson gson = new Gson();
		String jsonStr = gson.toJson(movie);
		
		return jsonStr;
	}

	@RequestMapping(value={"getTimetable.do"})
	@ResponseBody
	public String getTimetable(Model model, String timeSeq){
		Timetable t = new Timetable();
		t = ttdao.getTimetable(timeSeq);
		t.setTheaterNo(((Integer)tdao.getTheater(t.getTheaterNo()).getPlace()).toString());
		Gson gson = new Gson();
		String jsonStr = gson.toJson(t);
		
		return jsonStr;
	}
	
	////////////////////민경
	//midprocess
	@RequestMapping("midprocess.do")
	public String midprocess(HttpServletRequest request, Model model,String total,String timeSeq,String seat,String ticket, String memberType) {
		
		HttpSession session = request.getSession();
		String mid= null;
		
		if(memberType.equals("non")) {
			mid = (String) session.getAttribute("non");
			model.addAttribute("memberType", memberType);
		}else {
			//보유 포인트 출력
			mid = (String)session.getAttribute("mid");
			int point = pdao.getPoint(mid);
			
			
			//사용가능한 쿠폰리스트 출력
			String state = "USABLE";
			List<CouponAccount> cList = cadao.getusable(mid);
			for(int i=0; i<cList.size(); i++) {
				System.out.println(cList.get(i).getContent());
			}
			List<GiftyconAccount> gList = gadao.gmovieAccount(mid);
			for(int i=0; i<gList.size(); i++) {
				System.out.println(gList.get(i).getGiftyconCode());
			}
			//영화관람권 조회
			
			System.out.println("size : "+cList.size());
			System.out.println("gsize : "+gList.size());
			System.out.println("point : "+point);
			model.addAttribute("gList", gList);
			model.addAttribute("cList", cList);
			model.addAttribute("point", point);
			
		}
		
		System.out.println("아이디 : "+mid);

		//예매확인 출력
		Timetable table=ttdao.getTimetable(timeSeq);
		String theaterNo=table.getTheaterNo();
		String mcode=table.getMcode();
		MovieAPI movieApi=new MovieAPI();
		Movie movie=movieApi.getMovieDetail(mcode);
		String image = mvdao.getMovie(mcode).getImage();
		String title=movie.getMovieNm();
		String day=table.getDay();
		String time=table.getTime();
		Theater theater=tdao.getTheater(theaterNo);
		
		
		
		System.out.println("total: "+total);
		System.out.println("timeSeq : "+timeSeq);
		System.out.println("seat : "+seat);
		System.out.println("title : "+title);
		System.out.println("day : "+day);
		System.out.println("time : "+time);
		System.out.println("theater : "+theater);
		model.addAttribute("image", image);
		System.out.println("ticket : "+ticket);
		
		
		
		model.addAttribute("title", title);
		model.addAttribute("day", day);
		model.addAttribute("time", time);
		model.addAttribute("theater", theater);
		model.addAttribute("ticket", ticket);
		
		model.addAttribute("total", total);
		model.addAttribute("timeSeq", timeSeq);
		model.addAttribute("seat", seat);
		
		return "midprocess.jsp";
	}
	
	//포인트 사용
	@RequestMapping("pointUse.do")
	@ResponseBody
	public String pointUse(int point) {
		System.out.println("사용할 포인트 : "+point);
		/*int pointUse = pdao.getPoint(mid);
		System.out.println("조회한 포인트 : "+pointUse);
		if(pointUse==point) {
		System.out.println("조회O");
		return "yes";
		}else {
		System.out.println("조회X");
		return "no";
		}*/
		if(point!=0) {
		System.out.println("포인트사용가능");
			return "yes";
		}else {
		System.out.println("포인트조회하세요");
			return "no";
		}
	}
	
	//쿠폰 사용
	@RequestMapping("usecoupon.do")
	@ResponseBody
	public String usecoupon(String couponCode, String total) {
		System.out.println("couponCode : "+couponCode);
		System.out.println("total : "+total);
		Coupon cp = cpdao.getCoupon(couponCode);
		System.out.println((cp.getDiscountRate()/100.0));
		String data = null;
		Gson gson = new Gson();
		data = gson.toJson((int)((cp.getDiscountRate()/100.0)*Integer.parseInt(total)));
		
		System.out.println("data : "+data);
		return data;
	}
	
	//쿠폰 사용
	@RequestMapping("usemovie.do")
	@ResponseBody
	public String usemovie(String giftyconCode, String total) {
		System.out.println("giftyconCode : "+giftyconCode);
		System.out.println("total : "+total);
		
		Giftycon g = gdao.getGiftycon(giftyconCode);
		System.out.println(g.getPrice());
		String data = null;
		Gson gson = new Gson();
		data = gson.toJson(g.getPrice());
		
		System.out.println("data : "+data);
		return data;
	}

}
