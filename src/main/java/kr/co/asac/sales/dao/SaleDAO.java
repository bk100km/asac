package kr.co.asac.sales.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.asac.orders.bean.OrderBean;

public interface SaleDAO {

	public List<OrderBean> saleAdminDayList();
	
	public List<OrderBean> saleAdminDayConfirmList();
	
	public List<OrderBean> saleAdminDateList();
	
	public List<OrderBean> saleAdminWeekList();
	
	public List<OrderBean> saleAdminMonthList();
	
	public List<OrderBean> saleAdminSellerList();
	
	public List<OrderBean> saleAdminSellerListBest();
	
	public List<OrderBean> saleAdminSellerListWorst();
	
	public List<OrderBean> saleAdminProductCateList();
	
	public List<OrderBean> saleAdminProductCateConfirmList();
	
	public List<OrderBean> saleAdminProductListBest();
	
	public List<OrderBean> saleAdminProductListWorst();

	public List<OrderBean> saleSellerDayList(String id);
	
	public List<OrderBean> saleSellerDayConfirmList(String id);
	
	public List<OrderBean> saleSellerDateList(String id);
	
	public List<OrderBean> saleSellerWeekList(String id);
	
	public List<OrderBean> saleSellerMonthList(String id);
	
	public List<OrderBean> saleSellerProductList(String id);
	
	public List<OrderBean> saleSellerProductConfirmList(String id);
	
	public List<OrderBean> saleSellerProductListBest(String id);
	
	public List<OrderBean> saleSellerProductListWorst(String id);
	
	public List<OrderBean> saleAdminInfo(String pcate);
	
	public List<OrderBean> saleAdminConfirmInfo(String pcate);
	
	public List<OrderBean> saleSellerInfo(@Param("id") String id, @Param("pcate") String pcate);

	public List<OrderBean> saleSellerConfirmInfo(@Param("id") String id, @Param("pcate") String pcate);
}
