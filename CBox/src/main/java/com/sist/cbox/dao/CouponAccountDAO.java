package com.sist.cbox.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.cbox.vo.CouponAccount;
import com.sist.cbox.vo.myMembershipAccount;

public interface CouponAccountDAO {
	@Select("SELECT * FROM COUPONACCOUNT CA INNER JOIN COUPON C ON CA.COUPONCODE=C.COUPONCODE WHERE CA.MID=#{mid} AND CA.STATE LIKE 'USED'")
	public List<myMembershipAccount> getUsedCoupon(String mid);

	@Select("SELECT * FROM (SELECT * FROM COUPONACCOUNT WHERE MID=#{mid} AND STATE='USED')CA INNER JOIN COUPON C ON CA.COUPONCODE=C.COUPONCODE WHERE USEDDATE BETWEEN #{fDate} AND #{tDate}")
	public List<myMembershipAccount> getUsedCouponByDate(@Param("mid")String mid,@Param("fDate")String fDate,@Param("tDate")String tDate);

	@Select("SELECT * FROM COUPONACCOUNT CA INNER JOIN COUPON C ON CA.COUPONCODE=C.COUPONCODE WHERE CA.MID=#{mid}  AND CA.STATE LIKE 'USABLE'")
	public List<myMembershipAccount> getUsableCoupon(String mid);

	@Select("SELECT * FROM CouponAccount WHERE dealNum=#{dealNum}")
	public CouponAccount getCouponAccount(int dealNum);

	@Select("INSERT INTO COUPONACCOUNT VALUES((SELECT MAX(NVL(DEALNUM,0))+1 FROM COUPONACCOUNT),#{mid},#{couponCode},(SELECT to_char(trunc(sysdate),'yy/mm/dd') FROM dual),'FALSE',(SELECT to_char(add_months(sysdate,12),'yy/mm/dd') FROM dual),'USABLE','N/A')")
	public int addCouponAccount(@Param("mid")String mid,@Param("couponCode")String couponCode);

	@Update("UPDATE COUPONACCOUNT SET USEDDATE=(SELECT to_char(trunc(sysdate),'yy/mm/dd') FROM dual),STATE='USED' WHERE DEALNUM=#{DEALNUM}")
	public int updateCouponAccount(int DEALNUM);

	//사용가능한 쿠폰리스트
	public List<CouponAccount> getusable(String mid);

	//쿠폰추가
	public int addCouponAc(CouponAccount ca);

	//업뎃
	public int updateCouponAc(int dealNum);
}