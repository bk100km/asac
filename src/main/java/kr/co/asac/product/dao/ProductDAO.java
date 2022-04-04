package kr.co.asac.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.utils.Search;

public interface ProductDAO {

	// <client>
	public List<ProductBean> productList(Map<String, Object> map);

	public ProductBean productListDetail(String pcode);

	public int productListCount(Map<String, Object> map);
	
	// <seller>
	public List<ProductBean> productSellerList(@Param("id") String id, @Param("searchSe") Search search);
	public int productSellerCount(@Param("id") String id, @Param("searchSe") Search search) throws Exception;
	public ProductBean productSellerInfo(String pcode);
	public void productSellerInsert(ProductBean product);
	public int productSellerUpdate(ProductBean product);
	public int productSellerDelete(String pcode);

	
	// <admin>
	public List<ProductBean> productAdminList(@Param("searchAd") Search search);	
	public int productAdminCount(@Param("searchAd") Search search) throws Exception;	
	public ProductBean productAdminInfo(String pcode);
	public void productAdminInsert(ProductBean product);
	public int productAdminUpdate(ProductBean product);
	public int productAdminDelete(String pcode);

}
