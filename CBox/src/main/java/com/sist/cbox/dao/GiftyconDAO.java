package com.sist.cbox.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.cbox.vo.Giftycon;

public interface GiftyconDAO {

	//타입별 상품 리턴 (type: C-콤보  S-스낵  B-음료  M-영화관람권)
	public List<Giftycon> getGiftycons(String type);
	
	//코드와 일치하는 상품 리턴
	public Giftycon getGiftycon(String giftyconCode);
	
	@Select("SELECT * FROM GiftyCon")
	public ArrayList<Giftycon> getCouponList();
	@Select("SELECT * FROM GIFTYCON WHERE couponCode=#{couponCode}")
	public Giftycon getCoupon(String couponCode);
}
