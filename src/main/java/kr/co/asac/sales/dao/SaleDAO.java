package kr.co.asac.sales.dao;

import java.util.List;

import kr.co.asac.orders.bean.OrderBean;

public interface SaleDAO {

	// saleSeller
	
	public List<OrderBean> saleSellerDayList(String id);
	
	public List<OrderBean> saleSellerDayConfirmList(String id);
	
	public List<OrderBean> saleSellerMonthList(String id);
	
	public List<OrderBean> saleSellerMonthConfirmList(String id);
	
	public List<OrderBean> saleSellerProductList(String id);
	
	public List<OrderBean> saleSellerProductConfirmList(String id);
	
	// saleAdmin
	
	public List<OrderBean> saleAdminDayList();
	
	public List<OrderBean> saleAdminDayConfirmList();
	
	public List<OrderBean> saleAdminMonthList();
	
	public List<OrderBean> saleAdminMonthConfirmList();
	
	public List<OrderBean> saleAdminSellerList();
	
	public List<OrderBean> saleAdminSellerConfirmList();
	
	public List<OrderBean> saleAdminCateList();
	
	public List<OrderBean> saleAdminCateConfirmList();

	public List<OrderBean> saleAdminCateProductList(String pcate);
	
	public List<OrderBean> saleAdminCateProductConfirmList(String pcate);

}
