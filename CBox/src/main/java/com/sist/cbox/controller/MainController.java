package com.sist.cbox.controller;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.cbox.api.MovieAPI;
import com.sist.cbox.dao.MovieDAO;
import com.sist.cbox.vo.Movie;

@Controller
public class MainController {
	
	@Autowired
	private MovieDAO mdao;
	
	
	@RequestMapping("index.do")
	public String index(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		
		return "index.jsp";
	}
	
	@RequestMapping("main.do")
	public String main(Model model) {
			
			MovieAPI api = new MovieAPI();
			
			Calendar cal = Calendar.getInstance();
			
			int year1 = cal.get(cal.YEAR);
			int month1 = cal.get(cal.MONTH)+1;
			int date1 = cal.get(cal.DATE)-1;
			
			String year = String.valueOf(year1);
			String month = String.valueOf(month1);
			String date = String.valueOf(date1);
			
			String today = year+month+date;
			System.out.println(today);

			ArrayList<Movie> movieList = api.getDailyChart("20171201");
			
			for(Movie listM : movieList){			
	
				System.out.println(listM.getMovieNm());
				System.out.println(listM.getMovieCd());
				
				Movie daoMovie = mdao.getMovie(listM.getMovieCd()); //DB
				
				if(daoMovie==null){
					listM.setImage("../image/choo.jpg");
					listM.setGPA(0);
					listM.setSummary("아직 내용 입력전");
					listM.setMcode(listM.getMovieCd()); // 무비정보 생성
	
					System.out.println(listM.toString());
					
					mdao.addMovie(listM); //없으면 디폴트줘서 무비객체 생성
	
				}else{		
					System.out.println(daoMovie.getMcode());
					System.out.println(daoMovie.getMovieClip());
					listM.setSummary(daoMovie.getSummary());
					listM.setGPA(daoMovie.getGPA());
					listM.setImage(daoMovie.getImage());
					listM.setMovieClip(daoMovie.getMovieClip());							
					
					mdao.updateMovie(listM); // 
					
				}			
			}
			
			model.addAttribute("movie", movieList);
			
			return "main.jsp";
			
		}
}
