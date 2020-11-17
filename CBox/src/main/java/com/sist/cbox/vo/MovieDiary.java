package com.sist.cbox.vo;

public class MovieDiary {
	private String mdseq;
	private String mcode;  // ajax or a태그 
	private String mid;
	private String content;
	private String image;  
	private String friend;
	private String mdtime;  // 예약어 때문에 이름바꿈 timetable   day + time 
	private String theater;  //theater theaterName
	private String movieNm;
	private String movieNmEn;
	private String regdate; 
	
	
	
	
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getMovieNmEn() {
		return movieNmEn;
	}
	public void setMovieNmEn(String movieNmEn) {
		this.movieNmEn = movieNmEn;
	}
	public String getMdtime() {
		return mdtime;
	}
	public void setMdtime(String mdtime) {
		this.mdtime = mdtime;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getMdseq() {
		return mdseq;
	}
	public void setMdseq(String mdseq) {
		this.mdseq = mdseq;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getFriend() {
		return friend;
	}
	public void setFriend(String friend) {
		this.friend = friend;
	}

	public String getTheater() {
		return theater;
	}
	public void setTheater(String theater) {
		this.theater = theater;
	}
	
	
	@Override
	public String toString() {
		return "MovieDiary [mdseq=" + mdseq + ", mcode=" + mcode + ", mid=" + mid + ", content=" + content + ", image="
				+ image + ", friend=" + friend + ", mdtime=" + mdtime + ", theater=" + theater + ", movieNm=" + movieNm
				+ ", movieNmEn=" + movieNmEn + ", regdate=" + regdate + "]";
	}
	
	
	

	

}
