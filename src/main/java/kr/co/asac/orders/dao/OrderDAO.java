package kr.co.asac.orders.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.utils.Search;

public interface OrderDAO {
	
	// orderClient
	
	public List<OrderBean> orderClientList(String mid);
	
	public OrderBean orderClientInfo(int ocode);
	
	public void orderClientUpdate(OrderBean order);

	public int orderClientDelete(int ocode);
	
	public MemberBean memberClientInfo(String mid);

	// orderSeller
	
	public List<OrderBean> orderSellerList(@Param("id") String id, @Param("searchSe") Search search);
	
	public int orderSellerCount(@Param("id") String id, @Param("searchSe") Search search) throws Exception;
	
	public OrderBean orderSellerInfo(int ocode);
	
	public void orderSellerUpdate(OrderBean order);
	
	public int orderSellerDelete(int ocode);
	
	// orderAdmin
	
	public List<OrderBean> orderAdminList(@Param("searchAd") Search search);
	
	public int orderAdminCount(@Param("searchAd") Search search) throws Exception;
	
	public OrderBean orderAdminInfo(int ocode);
	
	public void orderAdminUpdate(OrderBean order);
	
	public int orderAdminDelete(int ocode);
}
