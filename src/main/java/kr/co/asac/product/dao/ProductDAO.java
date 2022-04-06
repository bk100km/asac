package kr.co.asac.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.asac.member.bean.PagingBean;
import kr.co.asac.product.bean.ProductBean;

public interface ProductDAO {

	// <client>
	public List<ProductBean> productList(Map<String, Object> map);

	public ProductBean productListDetail(String pcode);

	public int productListCount(Map<String, Object> map);
	
	// admin	
	public int productAdminCount(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText);
	public List <ProductBean> productAdminList(@Param("paging") PagingBean paging);
	public ProductBean productAdminInfo(String pcode);
	public void productAdminUpdate(ProductBean product);
	public void productAdminDelete(String pcode);
	public void productAdminInsert(ProductBean product);
	public List <ProductBean> productAdminSearch(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText, @Param("paging") PagingBean paging);
	
	// seller
	public int productSellerCount(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText);
	public List <ProductBean> productSellerList(@Param("paging") PagingBean paging);
	public ProductBean productSellerInfo(String pcode);
	public void productSellerUpdate(ProductBean seller);
	public void productSellerDelete(String sid);
	public void productSellerInsert(ProductBean seller);
	public List <ProductBean> productSellerSearch(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText, @Param("paging") PagingBean paging);
}
