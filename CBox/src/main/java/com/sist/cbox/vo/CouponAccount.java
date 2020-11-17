package com.sist.cbox.vo;

public class CouponAccount {
	int dealNum;
	private String mid;
	private String couponCode;
	private String regdate;
	private String expireDate;
	private String content;
	private String cancelCheck;
	private String state;
	private String usedDate;
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUsedDate() {
		return usedDate;
	}
	public void setUsedDate(String usedDate) {
		this.usedDate = usedDate;
	}
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	
	public int getDealNum() {
		return dealNum;
	}
	public void setDealNum(int dealNum) {
		this.dealNum = dealNum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCancelCheck() {
		return cancelCheck;
	}
	public void setCancelCheck(String cancelCheck) {
		this.cancelCheck = cancelCheck;
	}
	
	
}
