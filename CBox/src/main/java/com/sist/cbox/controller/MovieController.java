package com.sist.cbox.controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sist.cbox.api.MovieAPI;
import com.sist.cbox.dao.GpaDAO;
import com.sist.cbox.dao.MovieDAO;
import com.sist.cbox.dao.ReviewDAO;
import com.sist.cbox.vo.Gpa;
import com.sist.cbox.vo.Movie;
import com.sist.cbox.vo.Review;

@Controller
@RequestMapping("/movie/*")
public class MovieController {
	
	@Autowired
	private ReviewDAO rdao;
	@Autowired
	private MovieDAO mdao;
	@Autowired
	private GpaDAO gdao;
	
	
	public String searchMovie(String movieNm){
		
		return "";
	}

	
	@RequestMapping(value={"MovieChart.do"}, method=RequestMethod.GET)
	public String MovieChart(Model model){

		Calendar cal = Calendar.getInstance();
		
		int year1 = cal.get(cal.YEAR);
		int month1 = cal.get(cal.MONTH)+1;
		int date1 = cal.get(cal.DATE)-1;
		
		/*if(date1==0){
			
			month1 = month1-1;
			
			if(month1==0){
				
				year1 = year1-1;
				month1 = 12;
				date1 = 31;
				
			}else if(month1==4 && month1==6 && month1==9 && month1==11 ){
				
				date1 = 30;
				
			}else if(month1==1 & month1==3 && month1==5 && month1==7 && month1==8 && month1==10 && month1==12 ){
				
				date1= 31;
			}
		
		}else{
			
		}*/
		
		String year = String.valueOf(year1);
		String month = String.valueOf(month1);
		String date = String.valueOf(date1);		
		
		String today = year+month+date;

		MovieAPI ma = new MovieAPI();
		ArrayList<Movie> movieList = ma.getDailyChart("20171130");
		
		
		for(Movie listM : movieList){			

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
		}
		
		model.addAttribute("mList", movieList);
		
		return "MovieChart.jsp";
	}

	@RequestMapping(value={"movieDetail.do"}, method=RequestMethod.GET)
	public String movieDetail(String mcode, Model model,String pg){
		
		MovieAPI ma = new MovieAPI();
			
	 	Movie m = ma.getMovieDetail(mcode);
	 	System.out.println("***********************mcode*****************"+mcode);
	 	
//	 	String sourceFile = "D:/business.txt";
//	 	
//	 	System.out.println("감독정보"+m.getDirectors());
//	 	System.out.println("배우정보"+m.getActors());
	 		
	 	
	 	Movie daoMovie = mdao.getMovie(mcode); //DB
		
		m.setSummary(daoMovie.getSummary());
		m.setGPA(daoMovie.getGPA());
		m.setImage(daoMovie.getImage());		 	
	   	
		int ipg;
		if(pg!=null && !pg.equals("")) {
			ipg = Integer.parseInt(pg);
		}else {
			ipg=1;
		}
		
		int sPage = ipg - (ipg-1)%5;
		int seqCount = rdao.getSeqCount(mcode);
		int finalPage = seqCount/5 + (seqCount%5==0?0:1);		
		
		List<Review> rList = rdao.allReview(ipg,mcode);
		
		
		String year = m.getOpenDt().substring(0, 4);
		String month = m.getOpenDt().substring(4, 6);
		String day = m.getOpenDt().substring(6, 8);				
		
		String[] actorName = m.getActors();
		String[] genre = m.getGenreNm();
		String[] director = m.getDirectors();
		
		model.addAttribute("m", m);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("rList", rList);
		model.addAttribute("pg", ipg);
		model.addAttribute("sPage", sPage);
		model.addAttribute("finalPage", finalPage);
		model.addAttribute("actors", actorName); 
		model.addAttribute("genre", genre);
		model.addAttribute("director", director);
		model.addAttribute("mcode", mcode);
		
		return "MovieDetail.jsp";
	 	
	}
	
	@RequestMapping(value={"reviewReg.do"}, method=RequestMethod.POST)
	public String reviewReg(Model model,Review r,String mid, String mcode){
		
		Gpa g = gdao.getGpa(mcode);
		Movie m = mdao.getMovie(mcode);  //영화 DB에도 평점을 수정해준다. 

		if(g ==null ){  // 등록된 평점이 없는 상태 
			Gpa newg = new Gpa();
			
			newg.setMcode(mcode);
			newg.setTn(1.0);
			newg.setAverage(r.getGPA());
			
			gdao.addGpa(newg);  // 평점 객체 생성
			
			
			m.setGPA(r.getGPA());  //영화 DB에도 평점을 수정해준다. 	
			mdao.updateMovie(m);
			
		}else{  //등록된 평점이 존재하는 상태 
			
			
			Double totalGp = (g.getAverage()*g.getTn())+r.getGPA();			
			
			Double nanugi = g.getTn()+1.0;
			Double newAverage = totalGp / nanugi;
			
			String a = String.format(" %.2f", newAverage);
			
			
			Double d= Double.parseDouble(a);
			
			g.setTn(nanugi);
			g.setAverage(d);  //소수점 둘째자리까지만 출력되게 제어 
		
			gdao.updateGpa(g); // 수정 
			
			m.setGPA(g.getAverage());  //영화 DB에도 평점을 수정해준다. 	
			mdao.updateMovie(m);

		}		
		r.setMid(mid);
		rdao.addReview(r);
		
		return "redirect:movieDetail.do?mcode="+mcode;
	}
	
	@RequestMapping(value={"reviewReg.do"}, method=RequestMethod.GET)
	public String reviewReg(HttpServletRequest request, String mcode,Model model,Review r){
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		
		if(mid==null){
			session.setAttribute("url", "../movie/reviewReg.do?mcode="+mcode);
			return "redirect:../joinus/login.do";
		}else{
			
			model.addAttribute("mcode", mcode);
			model.addAttribute("r", r);
			
			
			return "reviewReg.jsp";
			
		}
		
	}
	
	@RequestMapping(value={"reviewEdit.do"}, method=RequestMethod.GET)
	public String reviewEdit(String mcode,Model model,String rseq){
		
		model.addAttribute("mcode", mcode);
		
		int rseq2= Integer.parseInt(rseq);
		
		Review r = rdao.getReview(rseq2);	
		
		model.addAttribute("r", r);
		
		return "reviewEdit.jsp";
	}
	
	@RequestMapping(value={"reviewEdit.do"}, method=RequestMethod.POST)
	public String reviewEdit(String mcode,Model model,Review r,String bGpa){
		

			Gpa g = gdao.getGpa(mcode);
								//등록된 평점이 존재하는 상태 
			Double beforeGpa= Double.parseDouble(bGpa);
		
			Double totalGp = (g.getAverage()*g.getTn())-beforeGpa+r.getGPA();			
			
			Double nanugi = g.getTn();
			Double newAverage = totalGp / nanugi;
			String a = String.format(" %.2f", newAverage);
			
			Double d= Double.parseDouble(a);
						
			g.setAverage(d);  //소수점 둘째자리까지만 출력되게 제어 
		
			gdao.updateGpa(g); // 수정 
			
			
			Movie m = mdao.getMovie(mcode);  //영화 DB에도 평점을 수정해준다. 
			m.setGPA(d);	
			mdao.updateMovie(m);
		
			rdao.updateReview(r);
			
		return "redirect:movieDetail.do?mcode="+mcode;
	}
	
	@RequestMapping(value={"reviewDel.do"}, method=RequestMethod.GET)
	public String reviewDel(String mcode, Model model, String rseq){
		
		int rseq2= Integer.parseInt(rseq);	
		
		Gpa g = gdao.getGpa(mcode);
		Review r = rdao.getReview(rseq2);
		
		Double totalGp = (g.getAverage()*g.getTn())-r.getGPA();			
			
		Double nanugi = g.getTn()-1.0;
		Double newAverage = totalGp / nanugi;
		newAverage.toString();
		String a = String.format(" %.2f", newAverage);
			
		Double d= Double.parseDouble(a);
					
		g.setTn(nanugi);
		g.setAverage(d);  //소수점 둘째자리까지만 출력되게 제어 
		
		gdao.updateGpa(g); // 수정 					
		
		Movie m = mdao.getMovie(mcode);  //영화 DB에도 평점을 수정해준다. 
		m.setGPA(g.getAverage());		
		mdao.updateMovie(m);

		
		rdao.deleteReview(rseq2);	
		model.addAttribute("mcode", mcode);

		return "redirect:movieDetail.do?mcode"+mcode; 
	}

	
}
