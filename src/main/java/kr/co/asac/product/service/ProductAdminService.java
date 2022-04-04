package kr.co.asac.product.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.dao.ProductDAO;
import kr.co.asac.utils.Search;

@Service
public class ProductAdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void productAdminList(HttpServletRequest request, HttpServletResponse response, Model model, Search search) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);
		
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
		
		if (id == null) {
			response.setContentType("text/html;charset=utf-8");
		   	PrintWriter out = response.getWriter();
		   	out.println("<script>");
		   	out.println("alert('로그인 후 이용해주세요.')");
		   	out.println("history.back()");
		   	out.println("</script>");
		   	out.flush();
		}
		else {
			ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class);
			List<ProductBean> productAdminList = dao.productAdminList(search);
			model.addAttribute("productAdminList", productAdminList);
			System.out.println(productAdminList);
	    }
	}

	public int productAdminCount(Search search) throws Exception {
		ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class);
		return dao.productAdminCount(search);
	}
	
	public ProductBean productAdminInfo(ProductBean product, String pcode) {
		ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class); 
		ProductBean info = dao.productAdminInfo(pcode);
		return info;
	}
	
	public void productAdminInsert(ProductBean product) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		productDAO.productAdminInsert(product);
		System.out.println(product);
	}
	
	public void productAdminUpdate(ProductBean product) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		try {System.out.println("서비스에서 찍힌 update" + product);
			productDAO.productAdminUpdate(product);
		} catch (Exception e) {
			System.out.println("update : " + e);
		}
	}
	
	public int productAdminDelete(String pcode){
		ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class);
		int code = dao.productAdminDelete(pcode);
		return code;
	}
}