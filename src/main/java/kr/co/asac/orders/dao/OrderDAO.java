package kr.co.asac.orders.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.asac.cart.bean.CartBean;
import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.utils.PagingBean;

public interface OrderDAO {
	
	// orderClient
	public int orderClientInsert(OrderBean orderj);

	public List<OrderBean> orderClientList(String mid);
	
	public List<OrderBean> orderClientOcodeList(String mid);
	
	public List<OrderBean> orderClientInfo(String ocode);
	
	public void orderClientUpdate(OrderBean order);

	public int orderClientDelete(String ocode);
	
	public MemberBean memberClientInfo(String mid);
	
	public void orderClientGumaeUpdate(OrderBean order);

	// orderSeller
	
	public List<OrderBean> orderSellerList(@Param("id") String id, @Param("paging") PagingBean paging);
	
	public List<OrderBean> orderSellerListSearch(@Param("id") String id, @Param("searchCategory") String searchCategory, @Param("searchText") String searchText, @Param("paging") PagingBean paging);
	
	public int orderSellerListCount(@Param("id") String id, @Param("searchCategory") String searchCategory, @Param("searchText") String searchText);
		
	public OrderBean orderSellerInfo(@Param("ocode") String ocode, @Param("pname") String pname);
	
	public void orderSellerUpdate(OrderBean order);
	
	public void orderSellerDelete(String ocode);
	
	public void orderDeliveryUpdate(@Param("ocode") String ocode, @Param("odelivery") String odelivery, @Param("pname") String pname);
	
	// orderAdmin
	
	public List<OrderBean> orderAdminList(@Param("paging") PagingBean paging);
	
	public List<OrderBean> orderAdminListSearch( @Param("searchCategory") String searchCategory, @Param("searchText") String searchText, @Param("paging") PagingBean paging);
	
	public int orderAdminListCount(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText);
		
	public OrderBean orderAdminInfo(@Param("ocode") String ocode, @Param("pname") String pname);
	
	public void orderAdminUpdate(OrderBean order);
	
	public void orderAdminDelete(String ocode);
	
	public List<ProductBean> orderProductList();
	
	public List<CartBean> orderFastCartList(String mid);
}