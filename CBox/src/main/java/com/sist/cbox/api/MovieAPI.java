package com.sist.cbox.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.sist.cbox.vo.Movie;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;



public class MovieAPI {

//	public static void main(String args[]){
//		//getMovieDetail("20175121");
//		getMovieCd("토르");
//		ArrayList<Movie> list= getDailyChart("20171106");
//		for(Movie m : list ){
//			System.out.println(m.getMovieCd());
//		}
//		//getMovieCount("범죄");	
//		
//		
//		getMovieCd("토르");
//		
//		/*ArrayList<Movie> list= getDailyChart("20171105");
//		for(Movie m : list ){
//			System.out.println(m.toString());
//		}*/
//		//getMovieCount("범죄");
//	}
	
	public String readURL(URL url){
		
		BufferedReader reader = null;
		String jsonStr = null;
				
        try {
            reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
            StringBuffer buffer = new StringBuffer();
            String str;

            while( (str = reader.readLine()) != null){
              buffer.append(str);
            }
            jsonStr = buffer.toString();
            
        } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonStr;
	}

	//영화코드로 영화상세정보를 담은 Movie객체 리턴 
	public Movie getMovieDetail(String movieCd){

		String urlQeury = "";
		try {
			urlQeury = URLEncoder.encode(movieCd, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
				
		URL url = null;
		try {
			url = new URL(
					" http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
					+"?key=58c2dd35d323716da0eab706ffee68dd"
					+"&movieCd="+urlQeury	
					);
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String jsonStr = readURL(url);
		
		
        //파싱
        JSONParser jsonparser = new JSONParser();
        JSONObject jsonobject;
        Movie md = new Movie();
		try {
			System.out.println(jsonStr);
			jsonobject = (JSONObject)jsonparser.parse(jsonStr);
			JSONObject json =  (JSONObject) jsonobject.get("movieInfoResult");
			JSONObject movie = (JSONObject) json.get("movieInfo");
			
			String movieCd1 = (String) movie.get("movieCd"); 		//영화코드
//			System.out.println("movieCd :"+movieCd1 );
			md.setMovieCd(movieCd1);
			
			String movieNm = (String) movie.get("movieNm");			//영화명
//			System.out.println("movieNm :"+movieNm );
			md.setMovieNm(movieNm);
			
			String movieNmEn = (String) movie.get("movieNmEn");
//			System.out.println("movieNmEn :"+movieNmEn);
			md.setMovieNmEn(movieNmEn);
			
			String showTm = (String) movie.get("showTm");			//상영시간(분)
//			System.out.println("showTm :"+showTm );
			md.setShowTm(showTm);
			
			String openDt = (String) movie.get("openDt");			//개봉일
//			System.out.println("openDt :"+openDt );
			md.setOpenDt(openDt);
			
			String prdtStatNm = (String) movie.get("prdtStatNm");	//개봉유무
//			System.out.println("prdtStatNm :"+prdtStatNm );
			md.setPrdtStatNm(prdtStatNm);
			
			JSONArray genres = (JSONArray)movie.get("genres");		//장르(배열)
//			System.out.println("genres :"+genres );
			String[] genreNm = new String [genres.size()];
			for(int j=0; j<genres.size(); j++){
				JSONObject entity2 = (JSONObject)genres.get(j);
				genreNm[j] = (String)entity2.get("genreNm");
				System.out.println(genreNm[j]);
			}
			md.setGenreNm(genreNm);
			
			JSONArray directors = (JSONArray)movie.get("directors");	//감독(배열)
			String[] director = new String [directors.size()];  //객체 크기만큼 배열 크기 지정? 
			for(int j=0; j<directors.size(); j++){
				JSONObject entity2 = (JSONObject)directors.get(j);	// 
				director[j] = (String)entity2.get("peopleNm");
//				System.out.println(director[j]);
			}
			md.setDirectors(director);
			
			JSONArray actors = (JSONArray)movie.get("actors");			//배우(배열)
			String[] actor = new String [actors.size()];  //************질문**************
		
			
			for(int j=0; j<actors.size(); j++){
				JSONObject entity2 = (JSONObject)actors.get(j);
				actor[j] = (String)entity2.get("peopleNm");
//				System.out.println("배우이름이여:"+actor[j]);
				
			}
				md.setActors(actor);
			
			
	

			JSONArray audits = (JSONArray)movie.get("audits");		
			for(int j=0; j<audits.size(); j++){
				JSONObject entity2 = (JSONObject)audits.get(j);
				String watchGradeNm = (String)entity2.get("watchGradeNm");		//관람등급
//				System.out.println(watchGradeNm);
				md.setWatchGradeNm(watchGradeNm);
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return md;
		
	}
	
	//검색 - 검색어를 넣으면 영화코드리스트를 리턴 
	public ArrayList<String> getMovieCd(String movieNm){
		
		
		ArrayList<String> list = new ArrayList<String>();
		
		//검색어
		String urlQeury = "";
		try {
			urlQeury = URLEncoder.encode(movieNm, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		URL url = null;
		try {
			url = new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json"
					+"?key=58c2dd35d323716da0eab706ffee68dd"
					//+"&openStartDt=2017"
					//+"&openEndDt=2017"			//조회종료 개봉연도
					+"&movieNm="+urlQeury	//영화제목
					//+"$directorNm="			//감독명
					//+"&itemPerPage="		//결과 row수  default:10
					);
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		JSONParser jsonparser = new JSONParser();
        JSONObject jsonobject;
        
        String jsonStr = readURL(url);
		try {
			jsonobject = (JSONObject)jsonparser.parse(jsonStr);
			JSONObject json =  (JSONObject) jsonobject.get("movieListResult");
			
			int count = Integer.parseInt(json.get("totCnt").toString());
//			System.out.println(count);
			
			JSONArray array = (JSONArray)json.get("movieList");
			
			for(int i = 0 ; i < array.size(); i++){
				
				JSONObject entity = (JSONObject)array.get(i);
				String movieCd = (String) entity.get("movieCd");
				list.add(movieCd);
				String movieNm1 = (String) entity.get("movieNm");
				
//				System.out.println(movieCd+" : "+movieNm1);
			}	
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	//검색 - 검색어을 넣으면 해당 되는 영화의 갯수 리턴 
	public int getMovieCount(String movieNm){
		
		//검색어
		String urlQeury = "";
		int count = 0;
		
		try {
			urlQeury = URLEncoder.encode(movieNm, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		URL url = null;
		try {
			url = new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json"
					+"?key=58c2dd35d323716da0eab706ffee68dd"
					+"&movieNm="+urlQeury	//영화제목
					);
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		JSONParser jsonparser = new JSONParser();
        JSONObject jsonobject;
        
        String jsonStr = readURL(url);
		try {
			jsonobject = (JSONObject)jsonparser.parse(jsonStr);
			JSONObject json =  (JSONObject) jsonobject.get("movieListResult");
			
			count = Integer.parseInt(json.get("totCnt").toString());
//			System.out.println(count);
			

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;		
	}

	
	//일일랭크 - 오늘 날짜를 넣으면 영화코드,영화이름,개봉일 정보가 있는 Movie객체 10개가 담긴 리스트 리턴
	public ArrayList<Movie> getDailyChart(String date){

		ArrayList<Movie> list = new ArrayList<Movie>();
		
		//검색어
		String urlQeury = "";
		try {
			urlQeury = URLEncoder.encode(date, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		URL url = null;
		try {
			url = new URL(
					"http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
					+"?key=58c2dd35d323716da0eab706ffee68dd"
					+"&targetDt="+urlQeury
					);
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		JSONParser jsonparser = new JSONParser();
        JSONObject jsonobject;
        
        String jsonStr = readURL(url);
//        System.out.println(jsonStr);
        
        System.out.println("dddddd");
        System.out.println(jsonStr);
        
		try {
			
			jsonobject = (JSONObject)jsonparser.parse(jsonStr);
			JSONObject json =  (JSONObject) jsonobject.get("boxOfficeResult");
			//JSONObject dailyBoxOfficeList =  (JSONObject) json.get("dailyBoxOfficeList");
			JSONArray array = (JSONArray)json.get("dailyBoxOfficeList");
			
			for(int i = 0 ; i < array.size(); i++){
				
				Movie movie = new Movie();
				
				JSONObject entity = (JSONObject)array.get(i);
				String movieCd = (String) entity.get("movieCd");
				movie.setMovieCd(movieCd);
				String movieNm = (String) entity.get("movieNm");
				movie.setMovieNm(movieNm);
				String openDt = (String) entity.get("openDt");
				movie.setOpenDt(openDt);
				
				list.add(movie);
			}	
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
}
