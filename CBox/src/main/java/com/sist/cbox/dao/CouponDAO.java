package com.sist.cbox.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;

import com.sist.cbox.vo.Coupon;

public interface CouponDAO {
	@Select("SELECT * FROM COUPON")
	public ArrayList<Coupon> getCouponList();
	@Select("SELECT * FROM COUPON WHERE couponCode=#{couponCode}")
	public Coupon getCoupon(String couponCode);
}