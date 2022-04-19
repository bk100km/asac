package kr.co.asac.orders.service;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.asac.cart.bean.CartBean;
import kr.co.asac.cart.dao.CartDAO;
import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.dao.OrderDAO;

@Service
public class OrderClientService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	
	public String orderClientInsert(String sidarr, String mid, String pcodearr, String ocountarr, String oname,
			String oaddrz, String oaddr, String oaddrd, String ophone,  String ototalarr, String omessage) {
		System.out.println("서비스 들어옴");
		OrderBean order = new OrderBean();
			order.setMid(mid);
			order.setOname(oname);
			order.setOaddrz(oaddrz);
			order.setOaddr(oaddr);
			order.setOaddrd(oaddrd);
			order.setOphone(ophone);
			order.setOmessage(omessage);
			
			String[] sid = sidarr.split(",");
			String[] pcode = pcodearr.split(",");
			String[] ocount = ocountarr.split(",");
			String[] ototal = ototalarr.split(",");
			
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			String date = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1) 
					 + new DecimalFormat("00").format(cal.get(Calendar.DATE));
			String dateNum = "";
			
			for(int i =1;i <= 6 ; i++) {
				dateNum += (int)(Math.random()*10);
			}
			
			String ocode = date + "_" + dateNum;
			
			order.setOcode(ocode);
			for(int i=0; i< sid.length; i++) {
				order.setSid(sid[i]);
				order.setPcode(pcode[i]);
				order.setOcount(Integer.parseInt(ocount[i]));
				order.setOtotal(Integer.parseInt(ototal[i]));
				
				OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
				dao.orderClientInsert(order);
			}
			System.out.println(order);
			
			return ocode;
    }
	
	public List<OrderBean> orderClientList(String mid, OrderBean order) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class); 
		List<OrderBean> list = dao.orderClientList(mid);
		return list;
	}
	
	public List<OrderBean> orderClientOcodeList(String mid, OrderBean order) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class); 
		List<OrderBean> ocodelist = dao.orderClientOcodeList(mid);
		return ocodelist;
	}
	
	
	public List<OrderBean> orderClientinfo(OrderBean order, String ocode){
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		List<OrderBean> info = dao.orderClientInfo(ocode);
		return info;
	}
	
	public void orderClientUpdate(Model model, OrderBean order) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		dao.orderClientUpdate(order);
		model.addAttribute("order", order);
	}
	
	public int orderClientDelete(String ocode){
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		int info = dao.orderClientDelete(ocode);
		return info;
	}
	
	public MemberBean memberClientInfo(String mid, MemberBean member){
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		MemberBean memberinfo = dao.memberClientInfo(mid);
		return memberinfo;
	}
	
	public void orderClientGumaeUpdate(Model model, OrderBean order) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		dao.orderClientGumaeUpdate(order);
		model.addAttribute("order", order);
	}
	
	public List<CartBean> cartList(String mid, CartBean cart) {
		CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class); 
		List<CartBean> cartlist = dao.cartList(mid);
		System.out.println(cartlist);
		return cartlist;
	}
	
	
    public String cartInsert(CartBean cart,HttpServletResponse response, String mid) throws Exception {
    	CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);
    	System.out.println("서비스"+cart);
    	List<CartBean> pcodelist = dao.cartClientPcode(mid);
		System.out.println("이녀석" + pcodelist);
		String boo;
		String pcode = pcodelist.toString();
		String cartpcode = cart.pcode;
		boolean isContainsPcode = pcode.contains(cartpcode);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (isContainsPcode == true) {
			
		   	boo=null;
		}else {
		System.out.println("참이어야해" + isContainsPcode);
    	dao.cartInsert(cart);
    	
    	boo = "11";
		}
    	return boo;
    }
    
    public void cartUpdate(HttpServletRequest request, Model model, CartBean cart) {
		CartDAO dao =sqlSessionTemplate.getMapper(CartDAO.class);
		dao.cartUpdate(cart);	
		model.addAttribute("cart", cart);
	}
    
    public int cartDeleteAll(String mid){
		CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);
		int info = dao.cartDeleteAll(mid);
		return info;
	}
    
    public int cartDeleteSelect(int ccode){
		CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);
		int info = dao.cartDeleteSelect(ccode);
		return info;
	}
    
    public void delete(String ccode) {
    	CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);
    	dao.delete(ccode);
    }
}
