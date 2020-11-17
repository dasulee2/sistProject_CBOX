package com.sist.cbox.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sist.cbox.dao.CouponAccountDAO;
import com.sist.cbox.dao.CouponDAO;
import com.sist.cbox.dao.GiftyconAccountDAO;
import com.sist.cbox.dao.MemberDAO;
import com.sist.cbox.dao.MembershipDAO;
import com.sist.cbox.dao.PointAccountDAO;
import com.sist.cbox.vo.Member;
import com.sist.cbox.vo.Membership;
import com.sist.cbox.vo.MyGiftycon;
import com.sist.cbox.vo.PointAccount;
import com.sist.cbox.vo.myMembershipAccount;

@Controller
@RequestMapping("/Membership/*")
public class MembershipController {
	@Autowired
	MemberDAO mdao;
	@Autowired
	MembershipDAO msdao;
	@Autowired
	CouponAccountDAO cadao;
	@Autowired
	CouponDAO cdao;
	@Autowired
	GiftyconAccountDAO gadao;
	@Autowired
	PointAccountDAO pdao;
	
	@RequestMapping("membership.do")
	public String membership(HttpServletRequest request,Model model){
		String mid;
		if(request.getSession().getAttribute("mid")==null){
			mid="green";
		}else{
			mid=(String)request.getSession().getAttribute("mid");
		}
		Member m=mdao.getMember(mid);
		Membership ms=msdao.getMembership(mid);
		List<myMembershipAccount> mmlist=cadao.getUsableCoupon(mid);
		List<myMembershipAccount> usedmmlist=cadao.getUsedCoupon(mid);
		List<MyGiftycon> galist=gadao.getMyGiftyconlistByMid(mid);
		List<MyGiftycon> usedgalist=gadao.getMyUsedGalistByMid(mid);
		model.addAttribute("m",m);
		model.addAttribute("ms",ms);
		model.addAttribute("mmlist",mmlist);
		model.addAttribute("galist",galist);
		model.addAttribute("usedmmlist",usedmmlist);
		model.addAttribute("usedgalist",usedgalist);
		
		return "membership.jsp";
	}
	
	@RequestMapping(value={"date.do"},method=RequestMethod.GET)
	@ResponseBody
	public String date(HttpServletRequest request,String fromDate,String toDate,String listType){
		//System.out.println(fromDate+"//"+toDate);
		//System.out.println("listType: "+listType);
		String mid="green";
		String fd1=fromDate.substring(2, 4);
		String fd2=fromDate.substring(4, 6);
		String fd3=fromDate.substring(6, 8);
		String fDate=fd1+"/"+fd2+"/"+fd3;
		String td1=toDate.substring(2, 4);
		String td2=toDate.substring(4, 6);
		String td3=toDate.substring(6, 8);
		String tDate=td1+"/"+td2+"/"+td3;
		System.out.println("fdate: "+fDate);
		
		Gson gson = new Gson();
		String ajaxData=null;
		if(listType.equals("galist")) {
			List<MyGiftycon> galistDate=gadao.getListByDate(mid, fDate, tDate);
			ajaxData = gson.toJson(galistDate);
		}else if(listType.equals("calist")) {
			List<myMembershipAccount> calistDate=cadao.getUsedCouponByDate(mid, fDate, tDate);
			ajaxData=gson.toJson(calistDate);
			ArrayList<myMembershipAccount> mlist=gson.fromJson(ajaxData, new TypeToken<ArrayList<myMembershipAccount>>(){}.getType());
		}else {
			ajaxData="암것도 없디요?";
		}
		//System.out.println(ajaxData);
		return ajaxData;
	}
	
	@RequestMapping("pointPage.do")
	public String pointPage(HttpServletRequest request,Model model){
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		
		List<PointAccount> palist=pdao.getPointAccountlistByMid(mid);
		Membership membership = msdao.getMembership(mid);
		
		int myPoint=(int)pdao.getMyPoints(mid);
		model.addAttribute("myPoint",myPoint);
		model.addAttribute("palist",palist);
		model.addAttribute("membership",membership);
		
		return "pointPage.jsp";
	}
}
