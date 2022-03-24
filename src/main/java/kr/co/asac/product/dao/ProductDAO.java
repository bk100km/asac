package kr.co.asac.product.dao;

import java.util.List;
import java.util.Map;

import kr.co.asac.product.bean.ProductBean;

public interface ProductDAO {
	public List<ProductBean> productadminlist();

	public ProductBean productadmininfo(String pcode);
	
	public void productadmininsert(ProductBean product);
		
	public int productadminupdate(ProductBean product);
	
	public int productadmindelete(String pcode);
	
	
	
	public List<ProductBean> productsellerlist();

	public ProductBean productsellerinfo(String pcode);
	
	public int productsellerinsert(ProductBean product);
	
	public int productsellerupdate(ProductBean product);
	
	public int productsellerdelete(String pcode);


	public List<ProductBean> productList(Map<String, Object> map);
	
	
	public ProductBean productListDetail(String pcode);
	
	
	public int productListCount(Map<String, Object> map);

}
