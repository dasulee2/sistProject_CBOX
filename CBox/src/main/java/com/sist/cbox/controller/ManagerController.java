package com.sist.cbox.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sist.cbox.api.MovieAPI;
import com.sist.cbox.dao.CardDAO;
import com.sist.cbox.dao.CouponAccountDAO;
import com.sist.cbox.dao.CouponDAO;
import com.sist.cbox.dao.GiftyconAccountDAO;
import com.sist.cbox.dao.MemberDAO;
import com.sist.cbox.dao.MembershipDAO;
import com.sist.cbox.dao.MovieDAO;
import com.sist.cbox.dao.PointAccountDAO;
import com.sist.cbox.dao.SeatAccountDAO;
import com.sist.cbox.dao.SeatDAO;
import com.sist.cbox.dao.TheaterDAO;
import com.sist.cbox.dao.TimetableDAO;
import com.sist.cbox.vo.Movie;
import com.sist.cbox.vo.Timetable;

@Controller
@RequestMapping("/Manager/*")
public class ManagerController {
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
	
	@RequestMapping("Manager.do")
	public String ManagerPage(HttpServletRequest request,Model model){
		String mid;
		if(request.getSession().getAttribute("mid")==null){
			mid="green";
		}else{
			mid=(String)request.getSession().getAttribute("mid");
		}
		model.addAttribute("mid", mid);
		return "Manager.jsp";
	}
	
	@RequestMapping("bookSeat.do")
	public String bookSeat(HttpServletRequest request,String timeSeq,String seatNo,Model model){
		String mid;
		if(request.getSession().getAttribute("mid")==null){
			mid="green";
		}else{
			mid=(String)request.getSession().getAttribute("mid");
		}
		System.out.println("입력성공");
		return "Manager.do";
	}
	
	@RequestMapping("setSeat.do")
	public String setSeat(HttpServletRequest request,String timeSeq){
		String check=sadao.checkExisting(timeSeq);
		if(check!=null) {
			System.out.println("경고: 이미 같은 시간대 좌석이 존재합니다.");
			return "Manager.do";
		}
		String theaterNo=sadao.getTheaterNo(timeSeq);
		List<String> seatList=sdao.getSeatNo(theaterNo);
		for(int i=0;i<seatList.size();i++) {
			sadao.setAvilableSeat(seatList.get(i), timeSeq);
		}
		System.out.println(seatList.size()+"좌석 생성");
		return "Manager.do";
	}
	
	/*@RequestMapping("setSeats.do")
	   public String setSeats(){
	      List<Timetable> list=ttdao.getTimetables();
	      for(Timetable t:list) {
	         List<String> seatList=sdao.getSeatNo(t.getTheaterNo());
	         for(int i=0;i<seatList.size();i++) {
	            sadao.setAvilableSeat(seatList.get(i), t.getTimeSeq());
	         }
	         System.out.println(seatList.size()+"좌석 생성");
	      }
	      return "Manager.do";
	  }*/
	@RequestMapping("setSeats.do")
	public String setSeats(){
		List<Timetable> list=ttdao.getTimetables();
		ArrayList<Integer> timeSeqList=new ArrayList<Integer>();
		System.out.println("필터링 전 list사이즈: "+list.size());
		for(Timetable t:list) {
			String check=sadao.checkExisting(t.getTimeSeq());
			if(check!=null) {
				//System.out.println("경고: 이미 같은 시간대 좌석이 존재합니다. timeSeq: "+t.getTimeSeq());
				timeSeqList.add(list.indexOf(t));
			}
		}
		for(int i:timeSeqList) {
			System.out.println("INDEX:"+i);
			list.remove(i);
		}
		System.out.println("필터링 후 list사이즈: "+list.size());
		for(Timetable t:list) {
			List<String> seatList=sdao.getSeatNo(t.getTheaterNo());
			for(int i=0;i<seatList.size();i++) {
				sadao.setAvilableSeat(seatList.get(i), t.getTimeSeq());
			}
			System.out.println(seatList.size()+"좌석 생성");
		}
		System.out.println("======= 생성 완료 =======");
		return "Manager.do";
	}
	
	@RequestMapping("search.do")
	@ResponseBody
	public String search(HttpServletRequest request, String date) {
		MovieAPI ma=new MovieAPI();
		ArrayList<Movie> list=ma.getDailyChart(date);
		Gson gson=new Gson();
		String ajaxData=gson.toJson(list);
		System.out.println(ajaxData);
		return ajaxData;
	}
	
	/*@RequestMapping("addMovie.do")
	public String addMovie(String mcode) {
		if(mvdao.getMovie(mcode)==null) {
			MovieAPI ma=new MovieAPI();
			Movie movie=ma.getMovieDetail(mcode);
			mvdao.addMovie(movie);
		}else {
			System.out.println("이미 DB에 존재하는 영화입니다.");
		}
		return "Manager.jsp";
	}*/
	
	@RequestMapping("addTimetable.do")
	public String addTimetable(String mcode,String tn, String time, String day) {
		/*System.out.println("code: "+mcode);
		System.out.println("time: "+time);
		System.out.println("day: "+day);*/
		ttdao.addTimetable(mcode, tn, time, day);
		
		return "Manager.do";
	}
	
}
