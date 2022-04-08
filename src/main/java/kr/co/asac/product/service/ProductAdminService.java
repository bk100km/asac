package kr.co.asac.product.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.asac.member.bean.PagingBean;
import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.dao.ProductDAO;

@Service
public class ProductAdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void productAdminList(Model model, PagingBean paging) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		List <ProductBean> productList = productDAO.productAdminList(paging);
		model.addAttribute("productList", productList);
	}
	
	public ProductBean productAdminInfo(Model model, String pcode) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		ProductBean product = productDAO.productAdminInfo(pcode);		
		model.addAttribute("product", product);
		return product;
	}
	
	public void productAdminUpdate(HttpServletRequest request, Model model, HttpServletResponse response, ProductBean product) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		productDAO.productAdminUpdate(product);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
	}	
	
	public void productAdminDelete(HttpServletRequest request, Model model, HttpServletResponse response, String pcode) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		productDAO.productAdminDelete(pcode);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
	}
	
	public void productAdminInsert(HttpServletRequest request, Model model, HttpServletResponse response, ProductBean product) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		productDAO.productAdminInsert(product);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
	}	
	
	public int productAdminCount(String searchCategory, String searchText) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		int listCnt = productDAO.productAdminCount(searchCategory, searchText);
		System.out.println("productAdminService : productCount ���� " + listCnt);
		return listCnt;
	}
	
	public List <ProductBean> productAdminSearch(HttpServletRequest request, Model model, String searchCategory, String searchText, PagingBean paging) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		List <ProductBean> productList = productDAO.productAdminSearch(searchCategory, searchText, paging);
		model.addAttribute("productList", productList);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
		
		return productList;
	}

	
	//admin My
	
	public void productAdminMyList(Model model, PagingBean paging) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		List <ProductBean> productList = productDAO.productAdminMyList(paging);
		model.addAttribute("productList", productList);
	}
	
	public ProductBean productAdminMyInfo(Model model, String pcode) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		ProductBean product = productDAO.productAdminMyInfo(pcode);		
		model.addAttribute("product", product);
		return product;
	}
	
	public void productAdminMyUpdate(HttpServletRequest request, Model model, HttpServletResponse response, ProductBean product) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		productDAO.productAdminMyUpdate(product);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
	}	
	
	public void productAdminMyDelete(HttpServletRequest request, Model model, HttpServletResponse response, String pcode) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		productDAO.productAdminMyDelete(pcode);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
	}
	
	public void productAdminMyInsert(HttpServletRequest request, Model model, HttpServletResponse response, ProductBean product) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		productDAO.productAdminMyInsert(product);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
	}	
	
	public int productAdminMyCount(String searchCategory, String searchText) throws Exception {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		int listCnt = productDAO.productAdminMyCount(searchCategory, searchText);
		System.out.println("productAdminService : productCount ���� " + listCnt);
		return listCnt;
	}
	
	public List <ProductBean> productAdminMySearch(HttpServletRequest request, Model model, String productMySearchCategory, String productMySearchText, PagingBean paging) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		List <ProductBean> productList = productDAO.productAdminSearch(productMySearchCategory, productMySearchText, paging);
		model.addAttribute("productList", productList);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
		
		return productList;
	}
}