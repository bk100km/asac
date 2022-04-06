package kr.co.asac.orders.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.utils.PagingBean;
import kr.co.asac.utils.Search;

public interface OrderDAO {
	
	// orderClient
	public int orderClientInsert(OrderBean orderj);

	public List<OrderBean> orderClientList(String mid);
	
	public List<OrderBean> orderClientOcodeList(String mid);
	
	public List<OrderBean> orderClientInfo(String ocode);
	
	public void orderClientUpdate(OrderBean order);

	public int orderClientDelete(String ocode);
	
	public MemberBean memberClientInfo(String mid);

	// orderSeller
	
	public List<OrderBean> orderSellerList(@Param("id") String id, @Param("paging") PagingBean paging);
	
	public List<OrderBean> orderSellerListSearch(@Param("id") String id, @Param("searchCategory") String searchCategory, @Param("searchText") String searchText, @Param("paging") PagingBean paging);
	
	public int orderSellerListCount(@Param("id") String id, @Param("searchCategory") String searchCategory, @Param("searchText") String searchText);
		
	public OrderBean orderSellerInfo(@Param("ocode") String ocode, @Param("pname") String pname);
	
	public void orderSellerUpdate(OrderBean order);
	
	public void orderSellerDelete(String ocode);
	
	// orderAdmin
	
	public List<OrderBean> orderAdminList(@Param("searchAd") Search search);
	
	public int orderAdminCount(@Param("searchAd") Search search) throws Exception;
	
	public OrderBean orderAdminInfo(int ocode);
	
	public void orderAdminUpdate(OrderBean order);
	
	public int orderAdminDelete(int ocode);
}
