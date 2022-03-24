package kr.co.asac.orders.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.asac.cart.bean.CartBean;
import kr.co.asac.cart.dao.CartDAO;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.dao.OrderDAO;

@Service
public class OrderClientService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	
	public List<OrderBean> orderClientList(String id, OrderBean order) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class); 
		List<OrderBean> list = dao.orderClientList(id);
		return list;
	}
	
	public OrderBean orderClientinfo(OrderBean order, int ocode){
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		OrderBean info = dao.orderClientInfo(ocode);
		return info;
	}
	
	public OrderBean orderClientUpdate(int ocode) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		OrderBean update = dao.orderClientUpdate(ocode);
		return update;
	}
	
	public int orderClientDelete(int ocode){
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		int info = dao.orderClientDelete(ocode);
		return info;
	}
	
	public List<CartBean> cartList(String id, CartBean cart) {
		CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class); 
		List<CartBean> cartlist = dao.cartList(id);
		return cartlist;
	}
	
    public int cartInsert(CartBean cart) {
    	CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);
    	int n = dao.cartInsert(cart);
    	return n;
    }
    
    
	
}
