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
//		getMovieCd("�丣");
//		ArrayList<Movie> list= getDailyChart("20171106");
//		for(Movie m : list ){
//			System.out.println(m.getMovieCd());
//		}
//		//getMovieCount("����");	
//		
//		
//		getMovieCd("�丣");
//		
//		/*ArrayList<Movie> list= getDailyChart("20171105");
//		for(Movie m : list ){
//			System.out.println(m.toString());
//		}*/
//		//getMovieCount("����");
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

	//��ȭ�ڵ�� ��ȭ�������� ���� Movie��ü ���� 
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
		
		
        //�Ľ�
        JSONParser jsonparser = new JSONParser();
        JSONObject jsonobject;
        Movie md = new Movie();
		try {
			System.out.println(jsonStr);
			jsonobject = (JSONObject)jsonparser.parse(jsonStr);
			JSONObject json =  (JSONObject) jsonobject.get("movieInfoResult");
			JSONObject movie = (JSONObject) json.get("movieInfo");
			
			String movieCd1 = (String) movie.get("movieCd"); 		//��ȭ�ڵ�
//			System.out.println("movieCd :"+movieCd1 );
			md.setMovieCd(movieCd1);
			
			String movieNm = (String) movie.get("movieNm");			//��ȭ��
//			System.out.println("movieNm :"+movieNm );
			md.setMovieNm(movieNm);
			
			String movieNmEn = (String) movie.get("movieNmEn");
//			System.out.println("movieNmEn :"+movieNmEn);
			md.setMovieNmEn(movieNmEn);
			
			String showTm = (String) movie.get("showTm");			//�󿵽ð�(��)
//			System.out.println("showTm :"+showTm );
			md.setShowTm(showTm);
			
			String openDt = (String) movie.get("openDt");			//������
//			System.out.println("openDt :"+openDt );
			md.setOpenDt(openDt);
			
			String prdtStatNm = (String) movie.get("prdtStatNm");	//��������
//			System.out.println("prdtStatNm :"+prdtStatNm );
			md.setPrdtStatNm(prdtStatNm);
			
			JSONArray genres = (JSONArray)movie.get("genres");		//�帣(�迭)
//			System.out.println("genres :"+genres );
			String[] genreNm = new String [genres.size()];
			for(int j=0; j<genres.size(); j++){
				JSONObject entity2 = (JSONObject)genres.get(j);
				genreNm[j] = (String)entity2.get("genreNm");
				System.out.println(genreNm[j]);
			}
			md.setGenreNm(genreNm);
			
			JSONArray directors = (JSONArray)movie.get("directors");	//����(�迭)
			String[] director = new String [directors.size()];  //��ü ũ�⸸ŭ �迭 ũ�� ����? 
			for(int j=0; j<directors.size(); j++){
				JSONObject entity2 = (JSONObject)directors.get(j);	// 
				director[j] = (String)entity2.get("peopleNm");
//				System.out.println(director[j]);
			}
			md.setDirectors(director);
			
			JSONArray actors = (JSONArray)movie.get("actors");			//���(�迭)
			String[] actor = new String [actors.size()];  //************����**************
		
			
			for(int j=0; j<actors.size(); j++){
				JSONObject entity2 = (JSONObject)actors.get(j);
				actor[j] = (String)entity2.get("peopleNm");
//				System.out.println("����̸��̿�:"+actor[j]);
				
			}
				md.setActors(actor);
			
			
	

			JSONArray audits = (JSONArray)movie.get("audits");		
			for(int j=0; j<audits.size(); j++){
				JSONObject entity2 = (JSONObject)audits.get(j);
				String watchGradeNm = (String)entity2.get("watchGradeNm");		//�������
//				System.out.println(watchGradeNm);
				md.setWatchGradeNm(watchGradeNm);
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return md;
		
	}
	
	//�˻� - �˻�� ������ ��ȭ�ڵ帮��Ʈ�� ���� 
	public ArrayList<String> getMovieCd(String movieNm){
		
		
		ArrayList<String> list = new ArrayList<String>();
		
		//�˻���
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
					//+"&openEndDt=2017"			//��ȸ���� ��������
					+"&movieNm="+urlQeury	//��ȭ����
					//+"$directorNm="			//������
					//+"&itemPerPage="		//��� row��  default:10
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

	//�˻� - �˻����� ������ �ش� �Ǵ� ��ȭ�� ���� ���� 
	public int getMovieCount(String movieNm){
		
		//�˻���
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
					+"&movieNm="+urlQeury	//��ȭ����
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

	
	//���Ϸ�ũ - ���� ��¥�� ������ ��ȭ�ڵ�,��ȭ�̸�,������ ������ �ִ� Movie��ü 10���� ��� ����Ʈ ����
	public ArrayList<Movie> getDailyChart(String date){

		ArrayList<Movie> list = new ArrayList<Movie>();
		
		//�˻���
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
