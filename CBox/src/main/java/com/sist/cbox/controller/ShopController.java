package com.sist.cbox.controller;

import java.awt.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sist.cbox.dao.CardDAO;
import com.sist.cbox.dao.CouponAccountDAO;
import com.sist.cbox.dao.GiftyconAccountDAO;
import com.sist.cbox.dao.GiftyconDAO;
import com.sist.cbox.dao.GradeDAO;
import com.sist.cbox.dao.MemberDAO;
import com.sist.cbox.dao.MembershipDAO;
import com.sist.cbox.dao.NonmemberDAO;
import com.sist.cbox.dao.PointAccountDAO;
import com.sist.cbox.vo.Card;
import com.sist.cbox.vo.CouponAccount;
import com.sist.cbox.vo.Giftycon;
import com.sist.cbox.vo.GiftyconAccount;
import com.sist.cbox.vo.Grade;
import com.sist.cbox.vo.Member;
import com.sist.cbox.vo.Membership;
import com.sist.cbox.vo.PointAccount;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	private GiftyconDAO gdao;
	@Autowired
	public void setGdao(GiftyconDAO gdao) {
		this.gdao = gdao;
	}
	
	private GiftyconAccountDAO gadao;
	@Autowired
	public void setGadao(GiftyconAccountDAO gadao) {
		this.gadao = gadao;
	}

	private MemberDAO mdao;
	@Autowired
	public void setMdao(MemberDAO mdao) {
		this.mdao = mdao;
	}
	@Autowired
	private NonmemberDAO nondao;
	
	private CardDAO cdao;
	@Autowired
	public void setCdao(CardDAO cdao) {
		this.cdao = cdao;
	}
	private PointAccountDAO pdao;
	@Autowired
	public void setPdao(PointAccountDAO pdao) {
		this.pdao = pdao;
	}
	private MembershipDAO mbdao;
	@Autowired
	public void setMbdao(MembershipDAO mbdao) {
		this.mbdao = mbdao;
	}
	private GradeDAO gddao;
	@Autowired
	public void setGddao(GradeDAO gddao) {
		this.gddao = gddao;
	}
	private CouponAccountDAO cadao;
	@Autowired
	public void setCadao(CouponAccountDAO cadao) {
		this.cadao = cadao;
	}

	@RequestMapping(value={"shopMain.do"}, method=RequestMethod.GET)
	public String shopMain(Model model, String type){
		
		if(type==null){
			type="C";
		}else{
			type = type.substring(0,1);
		}

		ArrayList<Giftycon> giftyconList = (ArrayList<Giftycon>) gdao.getGiftycons(type);
		model.addAttribute("giftyconList", giftyconList);
		
		return "shopMain.jsp";
	}
	
	@RequestMapping(value={"shopMovie.do"}, method=RequestMethod.GET)
	public String shopMovie(Model model){
		
		String type="M";

		ArrayList<Giftycon> giftyconList = (ArrayList<Giftycon>) gdao.getGiftycons(type);
		model.addAttribute("giftyconList", giftyconList);
		
		return "shopMovie.jsp";
	}
	
	@RequestMapping(value={"giftyconList.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String comboList(String type, Model model){
		
		System.out.println("giftyconList.do , type="+type);
		
		type = type.substring(0,1);
		
		ArrayList<Giftycon> giftyconList = (ArrayList<Giftycon>) gdao.getGiftycons(type);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(giftyconList);
		
		System.out.println(jsonStr);
		
		return jsonStr;
	}
	
	@RequestMapping(value={"giftyconDetail.do"}, method=RequestMethod.GET)
	public String giftyconDetail(String giftyconCode, Model model){
		
		Giftycon giftycon = gdao.getGiftycon(giftyconCode);
		
		model.addAttribute("giftycon", giftycon);
		model.addAttribute("content1", giftycon.getContent().split("/")[0]);
		model.addAttribute("content2", giftycon.getContent().split("/")[1]);
		
		return "giftyconDetail.jsp";
	}

	@RequestMapping(value={"giftyconBuy.do"}, method=RequestMethod.GET)
	public String giftyconBuy(Model model, String giftyconCode, String gift, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		
		if(mid==null){
			session.setAttribute("url", "redirect:../shop/giftyconDetail.do?giftyconCode="+giftyconCode);
			return "redirect:../joinus/login.do";
		}else{
			
			/*if(gift==null||gift.equals("")){
				model.addAttribute("gift","X");
			}*/
			
			Member m = mdao.getMember(mid);
			
			Giftycon giftycon = gdao.getGiftycon(giftyconCode);
			model.addAttribute("giftycon", giftycon);
			//model.addAttribute("gift", "O");
			model.addAttribute("content1", giftycon.getContent().split("/")[0]);
			model.addAttribute("content2", giftycon.getContent().split("/")[1]);
			model.addAttribute("m", m);
			
			return "giftyconBuy.jsp";
		}
	}
	
	@RequestMapping(value={"giftyconBuy.do"}, method=RequestMethod.POST)
	public String giftyconBuy(String[] rphone, String[] giftyconCode, String buyPhone, HttpServletRequest request, Model model, String total, String amount, int point){
		
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		
		ArrayList<GiftyconAccount> rList = new ArrayList<GiftyconAccount>();
		
		System.out.println("rphone.length : "+rphone.length);
		System.out.println("giftyconCode.length : "+giftyconCode.length);
		
		for(int i=0; i<rphone.length; i++){
			for(int j=0; j<giftyconCode.length; j++) {
				
				System.out.println("j :"+j);
				if(!rphone[i].equals("")){
					//System.out.println(rphone[i]);
					GiftyconAccount ga = new GiftyconAccount();
					
					ga.setMid(mid);
					ga.setGiftyconCode(giftyconCode[j]);
					//System.out.println(mdao.getPhone(rphone[i]).getMid());
					ga.setRecipient(mdao.getPhone(rphone[i]).getMid());
					//ga.setRecipient(rphone[i]);
					
					System.out.println(ga.getMid()+ " / "+ga.getGiftyconCode()+" / "+ga.getRecipient());
					
					int af = gadao.addGiftyconAccount1(ga);
					ga.setRecipient(rphone[i]);
					System.out.println("af:"+af);
					rList.add(ga);
				}
			}
		}
		
		ArrayList<Giftycon> gList = new ArrayList<Giftycon>();
		for(int i=0; i<giftyconCode.length; i++) {
			Giftycon giftycon = gdao.getGiftycon(giftyconCode[i]);
			gList.add(giftycon);
		}
		
		
		Member m = mdao.getMember(mid);
		
		int uppoint = (int)(Integer.parseInt(total)*0.2);
		
		//int uppoint = 2000;
		//1. �� ��ް˻�
		String myGrade = mbdao.getGrade(mid);
		
		//��ǥ�׷���Ʈ
		Grade upgrade = gddao.nextGrade(mid);
		
		System.out.println("myGrade : "+myGrade);
		System.out.println("upgrade : "+upgrade);
		//���系����Ʈ
		//int mypoint = pdao.getPoint(mid);
		
		//2. point ����
		System.out.println("����� point : "+point);
		PointAccount pa = new PointAccount();
		if(point==0) {
			pa.setMid(mid);
			pa.setPoint(uppoint);
			pa.setSort("����");
			
			int af = pdao.addPointAc(pa);
			if(af==1) {
				System.out.println("�����ߴ�.");
				Membership mb = new Membership();
				mb.setAccPoint(point);
				mb.setUsablePoint((int)pa.getPoint());
				mb.setMid(mid);
				
				//���系����Ʈ
				int mypoint = pdao.getPoint(mid);//���系����Ʈ
				System.out.println("�����ϱ��� ����Ʈ�� : "+mypoint);
				System.out.println("������ ����Ʈ�� : "+uppoint);
				
				System.out.println("��ǥ ����Ʈ�� :"+upgrade.getReqpoint());
				System.out.println("������ �� ����Ʈ�� : "+(mypoint+uppoint));
				if(Integer.parseInt(upgrade.getReqpoint())<(mypoint+uppoint)) {
					int af2 = mbdao.updateMembership(mid, (mypoint+uppoint), upgrade.getGradeName());
					if(af2==1) {
						System.out.println("������Ʈ�ߴ�.");
					}
				}else {
					int af6=mbdao.upMembership(mid, mypoint);
					if(af6==1) {
						System.out.println("��޻����Ϸ�");
					}
				}
				System.out.println("������ �� ��� : "+mbdao.getGrade(mid));
				if(mbdao.getGrade(mid).equals("NORMAL")) {
					System.out.println("�븻");
				}else {
					CouponAccount ca = new CouponAccount();
					if(mbdao.getGrade(mid).equals("VIP")) {
						ca.setCouponCode("V1");
						ca.setContent("VIP���� -10%����");
					}else if(mbdao.getGrade(mid).equals("VVIP")) {
						ca.setCouponCode("V2");
						ca.setContent("VVIP���� -20%����");
					}else if(mbdao.getGrade(mid).equals("VVVIP")) {
						ca.setCouponCode("V3");
						ca.setContent("VVVIP���� -30%����");
					}
					ca.setMid(mid);
					ca.setCancelCheck("FALSE");
					ca.setState("��밡��");
					ca.setUsedDate("N/A");
					int af3 = cadao.addCouponAc(ca);
					if(af3==1) {
						System.out.println("���� ���� ����");
					}
					
				}
			}
		}else {
			System.out.println("���Ž� ���� ���մϴ�.");
			pa.setMid(mid);
			pa.setPoint(-point);
			pa.setSort("���Ž� ����Ʈ ���");
		}
		
		model.addAttribute("rList", rList);
		model.addAttribute("gList", gList);
		model.addAttribute("total", total);
		model.addAttribute("amount", amount);
		model.addAttribute("m", m);
		
		return "buyResult.jsp";
		
	}

	@RequestMapping(value={"phoneCheck.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String phoneCheck(String phone){
		
		Member m = mdao.getPhone(phone);
		if(m!=null){
			return "checkO";
		}else{
			return "checkX";
		}
	}
	

	@RequestMapping(value={"payment.do"}, method=RequestMethod.GET)
	public String payment(Model model,String price){
		
		model.addAttribute("price",price);
		
		return "payment.jsp";
	}

	@RequestMapping(value={"payment.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String payment(String mid, String cardNum, String pwd, HttpServletRequest request){
		
		System.out.println("cardNum="+cardNum);
		System.out.println("mid="+mid);
		System.out.println("pwd : "+pwd);
		
		Card card = cdao.getCard(cardNum);
		
		if(card==null){
			System.out.println("cardX");
			return "cardX";
		}else if(!card.getMid().equals(mid)){
			System.out.println("midX");
			return "midX";
		}else if(card.getPwd().equals(pwd)){
			System.out.println("success");
			return "success";
		}else{
			System.out.println("pwdX");
			return "cardX";
		}
		
	}

	@RequestMapping(value={"addCard.do"}, method=RequestMethod.GET)
	public String addCard(HttpServletRequest request, Model model, String memberType){
		
		HttpSession session = request.getSession();
		String mid = null;
		if(memberType!=null) {
			
			if(memberType.equals("non")) {
				
				String nmid = (String)session.getAttribute("non");
				mid = nondao.getNonMember(nmid).getName();
			}else {
				mid = (String) session.getAttribute("mid");
				
			}
		}
		
		model.addAttribute("mid",mid);
		
		return "addCard.jsp";
	}
	
	@RequestMapping(value={"addCard.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String addCard(Card card){
		
		if(cdao.getCard(card.getCardNum())!=null){
			System.out.println("cardCKX");
			return "cardCKX";
		}else{
			int af = cdao.addCard(card);
			
			if(af==1){
				System.out.println("addSuccess");
				return "addSuccess";
			}else{
				
				return "addFail";
			}
		}
	}
	
	//����Ʈ ��ȸ
	@RequestMapping("pointDetail.do")
	@ResponseBody
	public String pointDetail(HttpServletRequest request, String mid, Model model) {
		System.out.println("mid : "+mid);
		int point = pdao.getPoint(mid);
		System.out.println("point1 : "+point);
		
		
		String data = null;
		if(point!=0) {
			System.out.println("����Ʈ ��ȸ ����");
			System.out.println("point2 : "+point);
			Gson gson = new Gson();
			data = gson.toJson(point);
			
			System.out.println("data : "+data);
			return data;
		}else {
			System.out.println("����Ʈ ��ȸ ����");
			return "";
		}
	}
	
	//����Ʈ ���
	@RequestMapping("pointUse.do")
	@ResponseBody
	public String pointUse(int point) {
		System.out.println("����� ����Ʈ : "+point);
		/*int pointUse = pdao.getPoint(mid);
		System.out.println("��ȸ�� ����Ʈ : "+pointUse);
		if(pointUse==point) {
			System.out.println("��ȸO");
			return "yes";
		}else {
			System.out.println("��ȸX");
			return "no";
		}*/
		if(point!=0) {
			System.out.println("����Ʈ��밡��");
			return "yes";
		}else {
			System.out.println("����Ʈ��ȸ�ϼ���");
			return "no";
		}
	}
	
}
