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
public class ProductSellerService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void productSellerList(HttpServletRequest request, HttpServletResponse response, Model model, PagingBean paging) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("ProductList Sid°ª : " + id);
		
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		List<ProductBean> productSellerList = productDAO.productSellerList(id, paging);
		model.addAttribute("productSellerList", productSellerList);
		System.out.println(productSellerList);
	}
	
	
	public int productSellerListCount(HttpServletRequest request, String searchCategory, String searchText) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		int listCnt = productDAO.productSellerListCount(id, searchCategory, searchText);
		System.out.println("count°ª" + listCnt);
		return listCnt;
	}
	
	public ProductBean productSellerInfo(Model model, String pcode) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		ProductBean product = productDAO.productSellerInfo(pcode);
		return product;
	}
	
	public List<ProductBean> productSellerListSearch(HttpServletRequest request, Model model, @RequestParam("searchCategory") String searchCategory, @RequestParam("searchText") String searchText, @RequestParam("paging") PagingBean paging) {
		String id = (String) request.getSession().getAttribute("sid");
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		List<ProductBean> productSellerListSearch = productDAO.productSellerListSearch(id, searchCategory, searchText, paging);
		model.addAttribute("productSellerListSearch", productSellerListSearch);
		return productSellerListSearch;
	}
	
	public void productSellerInsert(HttpServletRequest request, Model model, HttpServletResponse response, ProductBean product) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);	
		productDAO.productSellerInsert(product);
	}
	
	public void productSellerUpdate(HttpServletRequest request, Model model, HttpServletResponse response, ProductBean product) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		productDAO.productSellerUpdate(product);
	}
		
	public void productSellerDelete(HttpServletRequest request, Model model, HttpServletResponse response, String pcode) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		productDAO.productSellerDelete(pcode);
	}
}