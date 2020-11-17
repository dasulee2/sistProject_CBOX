package com.sist.cbox.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.cbox.vo.CouponAccount;
import com.sist.cbox.vo.Giftycon;
import com.sist.cbox.vo.GiftyconAccount;
import com.sist.cbox.vo.MyGiftycon;
import com.sist.cbox.vo.myMembershipAccount;

public interface GiftyconAccountDAO {

	//기프티콘 구매시 거래내역 추가
	public int addGiftyconAccount1(GiftyconAccount shopAccount);

	//해당 회원의 거래내역 리턴
	public ArrayList<GiftyconAccount> getGiftyconAccountMember(String mid);

	@Select("SELECT * FROM GIFTYCONACCOUNT GA INNER JOIN GIFTYCON G ON GA.GIFTYCONCODE=G.GIFTYCONCODE WHERE GA.MID=#{mid} AND GA.STATE NOT LIKE 'USED'")
	public List<MyGiftycon> getMyGiftyconlistByMid(String mid);

	@Select("SELECT * FROM (SELECT * FROM GIFTYCONACCOUNT WHERE USEDDATE BETWEEN #{fromDate} AND #{toDate})GA INNER JOIN GIFTYCON G ON GA.GIFTYCONCODE=G.GIFTYCONCODE WHERE GA.MID=#{mid}")
	public List<MyGiftycon> getListByDate(@Param("mid")String mid, @Param("fromDate")String fromDate,@Param("toDate")String toDate);

	@Select("SELECT * FROM GIFTYCONACCOUNT GA INNER JOIN GIFTYCON G ON GA.GIFTYCONCODE=G.GIFTYCONCODE WHERE GA.MID=#{mid} AND GA.STATE='USED'")
	public List<MyGiftycon> getMyUsedGalistByMid(String mid);

	@Select("SELECT * FROM GiftyconAccount WHERE dealNum=#{dealNum}")
	public GiftyconAccount getGiftyconAccount(int dealNum);

	@Insert("INSERT INTO GIFTYCONACCOUNT VALUES((SELECT MAX(NVL(DEALNUM,0))+1 FROM GIFTYCONACCOUNT),#{couponCode},(SELECT to_char(trunc(sysdate),'yy/mm/dd') FROM dual),#{mid},#{recipient},(SELECT to_char(add_months(sysdate,12),'yy/mm/dd') FROM dual),'USABLE','N/A')")
	public int addGiftyconAccount(@Param("mid")String mid,@Param("couponCode")String couponCode,@Param("recipient")String recipient);

	@Update("UPDATE GIFTYCONACCOUNT SET USEDDATE=(SELECT to_char(trunc(sysdate),'yy/mm/dd') FROM dual),STATE='USED' WHERE DEALNUM=#{dealNum}")
	public int useGiftycon(int dealNum);

	@Select("select * from giftyconaccount where recipient=#{mid} and state='USABLE' and giftyconcode not like '%M%' order by dealnum desc")
	public List<GiftyconAccount> getMygiftcon(String mid);

	@Select("select * from giftyconaccount where recipient=#{mid} and state='USED' and giftyconcode not like '%M%' order by dealnum desc")
	public List<GiftyconAccount> getUsedMygiftcon(String mid);

	@Select("select * from giftyconaccount where recipient=#{mid} and state='USABLE' and giftyconcode like '%M%' order by dealnum desc")
	public List<GiftyconAccount> getMygiftcon_M(String mid);

	@Select("select * from giftyconaccount where recipient=#{mid} and state='USED' and giftyconcode like '%M%' order by dealnum desc")
	public List<GiftyconAccount> getUsedMygiftcon_M(String mid);

	//영화관람권조회
	public List<GiftyconAccount> gmovieAccount(String mid);

	public int upGiftyconAc(int dealNum);
	
	public int countGiftyconAc(String mid);
	   
	public int countCoupontAc(String mid);
}
