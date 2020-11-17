package com.sist.cbox.vo;

public class Membership {
	private String mid;
	private int accPoint;
	private int usablePoint;
	private String grade;
	private String mseq;
	
	
	public String getMseq() {
		return mseq;
	}
	public void setMseq(String mseq) {
		this.mseq = mseq;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getAccPoint() {
		return accPoint;
	}
	public void setAccPoint(int accPoint) {
		this.accPoint = accPoint;
	}
	public int getUsablePoint() {
		return usablePoint;
	}
	public void setUsablePoint(int usablePoint) {
		this.usablePoint = usablePoint;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
}
