package kr.co.asac.orders.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.bean.Search;

public interface OrderDAO {
	public List<OrderBean> orderClientList(String id);
	
	public OrderBean orderClientInfo(int ocode);
	
	public OrderBean orderClientUpdate(int ocode);

	public int orderClientDelete(int ocode);

	public List<OrderBean> orderSellerList(@Param("id") String id, @Param("search") Search search);
	
	public OrderBean orderSellerInfo(int ocode);
	
	public void orderSellerUpdate(OrderBean order);
	
	public int orderSellerDelete(int ocode);
	
	public List<OrderBean> orderAdminList(Search search);
	
	public int orderAdminCount(Search search) throws Exception;
	
	public OrderBean orderAdminInfo(int ocode);
	
	public void orderAdminUpdate(OrderBean order);
	
	public int orderAdminDelete(int ocode);
}
