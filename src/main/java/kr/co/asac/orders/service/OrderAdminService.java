package kr.co.asac.orders.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.dao.OrderDAO;
import kr.co.asac.utils.Search;

@Service
public class OrderAdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void orderAdminList(HttpServletRequest request, HttpServletResponse response, Model model, Search search) throws Exception {
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
			OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
			List<OrderBean> orderAdminList = dao.orderAdminList(search);
			model.addAttribute("orderAdminList", orderAdminList);
			System.out.println(orderAdminList);
	    }
	}

	public int orderAdminCount(Search search) throws Exception {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		return dao.orderAdminCount(search);
	}
	
	public OrderBean orderAdminInfo(OrderBean order, int ocode) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class); 
		OrderBean info = dao.orderAdminInfo(ocode);
		return info;
	}
	
	public void orderAdminUpdate(OrderBean order) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		try {
			 dao.orderSellerUpdate(order);
		} catch (Exception e) {
			System.out.println("update : " + e);
		}
	}
	
	public int orderAdminDelete(int ocode){
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		int code = dao.orderAdminDelete(ocode);
		return code;
	}
}