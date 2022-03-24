package kr.co.asac.cart.dao;

import java.util.List;

import kr.co.asac.cart.bean.CartBean;

public interface CartDAO {
	
	public int cartInsert(CartBean cart); //장바구니 추가
	
	public List<CartBean> cartList(String id); 
	

}
