package kr.co.asac.cart.dao;

import java.util.List;

import kr.co.asac.cart.bean.CartBean;

public interface CartDAO {
	
	public int cartInsert(CartBean cart); //장바구니 추가
	
	public List<CartBean> cartList(String mid); 
	
	public List<CartBean> cartClientPcode(String mid);
	
	public void cartUpdate(CartBean cart);
	
	public int cartDeleteAll(String mid);
	
	public int cartDeleteSelect(int ccode);
	
	public void delete(String ccode);

}
