package com.sist.cbox.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sist.cbox.api.MovieAPI;
import com.sist.cbox.dao.MovieDAO;
import com.sist.cbox.dao.TheaterDAO;
import com.sist.cbox.dao.TimetableDAO;
import com.sist.cbox.vo.Movie;
import com.sist.cbox.vo.Theater;
import com.sist.cbox.vo.Timetable;


@Controller
@RequestMapping("/theater/*")
public class TheaterController {

	private TheaterDAO tdao;
	@Autowired
	public void setTdao(TheaterDAO tdao) {
		this.tdao = tdao;
	}
	@Autowired
	private TimetableDAO ttdao;

	@Autowired
	private MovieDAO mdao;

	@RequestMapping(value= {"theaterMain.do"}, method=RequestMethod.GET)
	public String theaterMain(String location, Model model, String date) {
		
		ArrayList<Theater> theaterList = (ArrayList<Theater>) tdao.getTheaters();
		//System.out.println(theaterList);
		
		if(location==null) {
			location="강남";
		}
		if(date==null) {
			date="0";
		}
		
		int dateInt = Integer.parseInt(date);
		
		ArrayList<Movie> mList = new ArrayList<Movie>();
		ArrayList<String> mcodes = (ArrayList<String>) ttdao.theaterMovie(location, dateInt);
		MovieAPI api = new MovieAPI();
		for(String m : mcodes) {
			Movie movie = api.getMovieDetail(m);
			mList.add(movie);
		}
		
		System.out.println("mList = "+mList);
		
		ArrayList<Timetable> timetable = (ArrayList<Timetable>) ttdao.theaterTimetable(location, dateInt);
		
		Date now = new Date();
		Calendar todayC = Calendar.getInstance();
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM월 dd일 E요일");
		String today = sdf.format(todayC.getTime());
		Calendar dateC1 = Calendar.getInstance();
		dateC1.add(Calendar.DATE, -3);
		String date1 = sdf.format((dateC1.getTime()));
		Calendar dateC2 = Calendar.getInstance();
		dateC2.add(Calendar.DATE, -2);
		String date2 = sdf.format((dateC2.getTime()));
		Calendar dateC3 = Calendar.getInstance();
		dateC3.add(Calendar.DATE, -1);
		String date3 = sdf.format((dateC3.getTime()));
		Calendar dateC4 = Calendar.getInstance();
		dateC4.add(Calendar.DATE, 1);
		String date4 = sdf.format((dateC4.getTime()));
		Calendar dateC5 = Calendar.getInstance();
		dateC5.add(Calendar.DATE, 2);
		String date5 = sdf.format((dateC5.getTime()));
		Calendar dateC6 = Calendar.getInstance();
		dateC6.add(Calendar.DATE, 3);
		String date6 = sdf.format((dateC6.getTime()));
		
		Theater theater = tdao.getTheater2(location);
		
		model.addAttribute("theaterList",theaterList);
		model.addAttribute("theater",theater);
		model.addAttribute("mList",mList);
		model.addAttribute("timetable",timetable);
		model.addAttribute("today",today);
		model.addAttribute("date1",date1);
		model.addAttribute("date2",date2);
		model.addAttribute("date3",date3);
		model.addAttribute("date4",date4);
		model.addAttribute("date5",date5);
		model.addAttribute("date6",date6);
		model.addAttribute("date", date);
		model.addAttribute("location", location);
		return "theaterMain.jsp";
		
	}
	
	@RequestMapping(value= {"theaterMain.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String theaterMain(String location,String date, Model model) {
		
		int dateInt = Integer.parseInt(date);
		
		ArrayList<Timetable> timetable = (ArrayList<Timetable>) ttdao.theaterTimetable(location, dateInt);
		
		for(Timetable t : timetable) {
			System.out.println(t.getMcode());
		}
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(timetable);
		
		System.out.println(jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping(value= {"theaterMap.do"}, method=RequestMethod.GET)
	public String theaterMap(String location,Model model) {
		
		ArrayList<Theater> theaterList = (ArrayList<Theater>) tdao.getTheaters();
		Theater theater = tdao.getTheater2(location);
		
		model.addAttribute("theaterList",theaterList);
		model.addAttribute("theater",theater);
		model.addAttribute("location", location);
		
		return "theaterMap.jsp";
	}

}
