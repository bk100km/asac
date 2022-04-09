package kr.co.asac.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.asac.product.bean.PagingBean;
import kr.co.asac.product.bean.ProductBean;

public interface ProductDAO {

	// <client>
	public List<ProductBean> productList(Map<String, Object> map);

	public ProductBean productListDetail(String pcode);

	public int productListCount(Map<String, Object> map);
	
	// productSeller
	
	public List<ProductBean> productSellerList(@Param("id") String id, @Param("paging") PagingBean paging);
	public List<ProductBean> productSellerListSearch(@Param("id") String id, @Param("searchCategory") String searchCategory, @Param("searchText") String searchText, @Param("paging") PagingBean paging);
	public int productSellerListCount(@Param("id") String id, @Param("searchCategory") String searchCategory, @Param("searchText") String searchText);
	public ProductBean productSellerInfo(@Param("pcode") String pcode);
	public void productSellerInsert(ProductBean product);
	public void productSellerUpdate(ProductBean product);
	public void productSellerDelete(String pcode);
	public void productSellerDeliveryUpdate(ProductBean product);

	// productAdmin

	public List<ProductBean> productAdminList(@Param("paging") PagingBean paging);
	public List<ProductBean> productAdminListSearch( @Param("searchCategory") String searchCategory, @Param("searchText") String searchText, @Param("paging") PagingBean paging);
	public int productAdminListCount(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText);
	public ProductBean productAdminInfo(@Param("pcode") String pcode);
	public void productAdminInsert(ProductBean product);
	public void productAdminUpdate(ProductBean product);
	public void productAdminDelete(String pcode);
	public void productAdminDeliveryUpdate(ProductBean product);
}