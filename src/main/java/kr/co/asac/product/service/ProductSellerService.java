package kr.co.asac.product.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.dao.ProductDAO;

@Service
public class ProductSellerService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProductBean> productSellerList(ProductBean product) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		return productDAO.productsellerlist();
	}

	public int insert(ProductBean product) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		return productDAO.productsellerinsert(product);
	}
	
	public int update(ProductBean product) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		return productDAO.productsellerupdate(product);
	}
	
	public int delete(String pcode) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		return productDAO.productsellerdelete(pcode);
	}
}
