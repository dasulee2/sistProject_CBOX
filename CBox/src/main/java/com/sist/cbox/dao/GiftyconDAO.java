package com.sist.cbox.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.sist.cbox.vo.Giftycon;

public interface GiftyconDAO {

	//Ÿ�Ժ� ��ǰ ���� (type: C-�޺�  S-����  B-����  M-��ȭ������)
	public List<Giftycon> getGiftycons(String type);
	
	//�ڵ�� ��ġ�ϴ� ��ǰ ����
	public Giftycon getGiftycon(String giftyconCode);
	
	@Select("SELECT * FROM GiftyCon")
	public ArrayList<Giftycon> getCouponList();
	@Select("SELECT * FROM GIFTYCON WHERE couponCode=#{couponCode}")
	public Giftycon getCoupon(String couponCode);
}
