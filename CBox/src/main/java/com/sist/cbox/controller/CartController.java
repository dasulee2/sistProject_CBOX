package com.sist.cbox.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sist.cbox.dao.GiftyconDAO;
import com.sist.cbox.dao.MemberDAO;
import com.sist.cbox.dao.PointAccountDAO;
import com.sist.cbox.vo.Giftycon;
import com.sist.cbox.vo.Member;

@Controller
@RequestMapping("/cart/*")
public class CartController {

	private GiftyconDAO gdao;
	@Autowired
	public void setGdao(GiftyconDAO gdao) {
		this.gdao = gdao;
	}
	
	private MemberDAO mdao;
	@Autowired
	public void setMdao(MemberDAO mdao) {
		this.mdao = mdao;
	}
	
	private PointAccountDAO pdao;
	@Autowired
	public void setPdao(PointAccountDAO pdao) {
		this.pdao = pdao;
	}
	
	@RequestMapping(value={"addCart.do"},method=RequestMethod.GET)
	@ResponseBody
	public String addCart(HttpServletRequest request, String giftyconCode, Model model){
		
		System.out.println(giftyconCode);
		
		HttpSession session = request.getSession();
		Giftycon giftycon = gdao.getGiftycon(giftyconCode);
		System.out.println(giftycon.toString());
		
		ArrayList<Giftycon> cartList = (ArrayList<Giftycon>) session.getAttribute("cartList");
		if(cartList==null){
			cartList = new ArrayList<Giftycon>();
			System.out.println("īƮ������ֵ�");
			session.setAttribute("cartList", cartList);
			cartList.add(giftycon);
			model.addAttribute("cartList",cartList);
			
			return "cartSuccess";
		}else{
			for(Giftycon g : cartList){
				System.out.println("cartList.length : "+cartList.size());
				System.out.println("sesscionCode : "+g.getGiftyconCode()+"  selectCode : "+giftyconCode);
				System.out.println("īƮ����������ʾƼ� for���� ������");
				
				if(g.getGiftyconCode().equals(giftyconCode)){
					System.out.println("������ǰ���̽�!");
					model.addAttribute("cartList",cartList);
					return "cartFail";
				}
			}
			cartList.add(giftycon);
			System.out.println("īƮ����������ʾƼ� �߰��ص�");
			model.addAttribute("cartList",cartList);
			return "cartSuccess";
		}
	}

	@RequestMapping(value={"cartList.do"},method=RequestMethod.GET)
	public String cartList(HttpServletRequest request, Model model){
		
		HttpSession session = request.getSession();
		ArrayList<Giftycon> cartList = (ArrayList<Giftycon>) session.getAttribute("cartList");
		model.addAttribute("cartList",cartList);
		
		return "cartList.jsp";
	}
	
	@RequestMapping(value={"cartGiftyconBuy.do"},method=RequestMethod.POST)
	public String cartGfityconBuy(HttpServletRequest request, Model model, String[] giftyconCode) {
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		
		System.out.println("�α��μ��� : " + mid);
		
		if(mid==null) {
			session.setAttribute("url", "redirect:../cart/cartList.do");
			return "redirect:../joinus/login.do";
		}
		ArrayList<Giftycon> gList = new ArrayList<Giftycon>();
		
		int price=0;
		
		for(int i=0; i<giftyconCode.length; i++) {
			Giftycon giftycon = gdao.getGiftycon(giftyconCode[i]);
			price = price+ giftycon.getPrice();
			gList.add(giftycon);
		}
		
		Member m = mdao.getMember(mid);
		
		model.addAttribute("price", price);
		model.addAttribute("gList", gList);
		model.addAttribute("m", m);
		
		return "cartGiftyconBuy.jsp";
	}

	@RequestMapping(value={"cartDel.do"})
	public String cartDel(HttpServletRequest request, String[] giftyconCode) {
		
		HttpSession session = request.getSession();
		
		ArrayList<Giftycon> cartList = (ArrayList<Giftycon>) session.getAttribute("cartList");
		
		for(int i=0; i<cartList.size(); i++) {
			for(int j=0; j<giftyconCode.length; j++) {
				if(cartList.get(i).getGiftyconCode().equals(giftyconCode[j])) {
					cartList.remove(i);
				}
			}
		}
		
		return "redirect:../cart/cartList.do";
	}
	
	//����Ʈ ��ȸ
	@RequestMapping("pointDetail.do")
	@ResponseBody
	public String pointDetail(HttpServletRequest request, String mid, Model model) {
		System.out.println("mid : "+mid);
		int point = pdao.getPoint(mid);
		System.out.println("point1 : "+point);
		
		/*if(point!=null) {
			System.out.println("����Ʈ��ȸ ����");
			model.addAttribute("point", point);
			return "yes";
		}else {
			System.out.println("����Ʈ��ȸ ����");
			return "no";
		}*/
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
