package kr.co.asac.product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.asac.product.bean.PagingBean;
import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.dao.ProductDAO;

@Service
public class ProductAdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void productAdminList(HttpServletRequest request, HttpServletResponse response, Model model, PagingBean paging) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		List<ProductBean> productAdminList = productDAO.productAdminList(paging);
		model.addAttribute("productAdminList", productAdminList);
		System.out.println(productAdminList);
	}
	
	
	public int productAdminListCount(HttpServletRequest request, String productSearchCategory, String productSearchText) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		int listCnt = productDAO.productAdminListCount(productSearchCategory, productSearchText);
		return listCnt;
	}
	
	public ProductBean productAdminInfo(Model model, String pcode) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		ProductBean product = productDAO.productAdminInfo(pcode);
		return product;
	}
	
	public List<ProductBean> productAdminListSearch(HttpServletRequest request, Model model, @RequestParam("productSearchCategory") String productSearchCategory, @RequestParam("productSearchText") String productSearchText, @RequestParam("paging") PagingBean paging) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		List<ProductBean> productAdminListSearch = productDAO.productAdminListSearch(productSearchCategory, productSearchText, paging);
		model.addAttribute("productAdminListSearch", productAdminListSearch);
		return productAdminListSearch;
	}
	
	public void productAdminInsert(HttpServletRequest request, Model model, HttpServletResponse response, ProductBean product) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);	
		productDAO.productAdminInsert(product);
	}
	
	public void productAdminUpdate(HttpServletRequest request, Model model, HttpServletResponse response, ProductBean product) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		productDAO.productAdminUpdate(product);
	}
			
	public void productAdminDelete(HttpServletRequest request, Model model, HttpServletResponse response, String pcode) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		productDAO.productAdminDelete(pcode);
	}
}