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
public class ProductSellerService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
//	public void productSellerList(HttpServletRequest request, HttpServletResponse response, Model model, Search search) throws Exception {
//		String id = (String) request.getSession().getAttribute("sid");
//		System.out.println("SellerList Sid�� : " + id);
//		
//		if (id == null) {
//			response.setContentType("text/html;charset=utf-8");
//		   	PrintWriter out = response.getWriter();
//		   	out.println("<script>");
//		   	out.println("alert('�α��� �� �̿����ּ���.')");
//		   	out.println("history.back()");
//		   	out.println("</script>");
//		   	out.flush();
//		}
//		else {
//			ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class);
//			List<ProductBean> productSellerList = dao.productSellerList(id, search);
//			model.addAttribute("productSellerList", productSellerList);
//			System.out.println(productSellerList);
//	    }
//	}

//	public int productSellerCount(HttpServletRequest request, String sid, Search search) throws Exception {
//		String id = (String) request.getSession().getAttribute("sid");
//		ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class);
//		return dao.productSellerCount(id, search);
//	}
	
	public ProductBean productSellerInfo(ProductBean product, String pcode) {
		ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class); 
		ProductBean info = dao.productSellerInfo(pcode);
		return info;
	}
	
	public void productSellerInsert(ProductBean product) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		productDAO.productSellerInsert(product);
		System.out.println(product);
	}
	
	public void productSellerUpdate(ProductBean product) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		try {System.out.println("update" + product);
			productDAO.productSellerUpdate(product);
		} catch (Exception e) {
			System.out.println("update : " + e);
		}
	}
	
//	public int productSellerDelete(String pcode){
//		ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class);
//		int code = dao.productSellerDelete(pcode);
//		return code;
//	}
}