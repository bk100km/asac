package kr.co.asac.orders.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	public List<OrderBean> orderClientList(String mid, OrderBean order) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class); 
		List<OrderBean> list = dao.orderClientList(mid);
		return list;
	}
	
	public OrderBean orderClientinfo(OrderBean order, int ocode){
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		OrderBean info = dao.orderClientInfo(ocode);
		return info;
	}
	
	public void orderClientUpdate(Model model, OrderBean order) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		dao.orderClientUpdate(order);
		model.addAttribute("order", order);
	}
	
	public int orderClientDelete(int ocode){
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		int info = dao.orderClientDelete(ocode);
		return info;
	}
	
	public MemberBean memberClientInfo(String mid, MemberBean member){
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		MemberBean memberinfo = dao.memberClientInfo(mid);
		return memberinfo;
	}
	
	
	public List<CartBean> cartList(String mid, CartBean cart) {
		CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class); 
		List<CartBean> cartlist = dao.cartList(mid);
		System.out.println(cartlist);
		return cartlist;
	}
	
    public int cartInsert(CartBean cart) {
    	CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);
    	int n = dao.cartInsert(cart);
    	return n;
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
    
}
