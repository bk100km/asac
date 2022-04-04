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
public class OrderSellerService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void orderSellerList(HttpServletRequest request, HttpServletResponse response, Model model, Search search) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("SellerList Sid값 : " + id);
		
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
			List<OrderBean> orderSellerList = dao.orderSellerList(id, search);
			model.addAttribute("orderSellerList", orderSellerList);
			System.out.println(orderSellerList);
	    }
	}
	
	public int orderSellerCount(HttpServletRequest request, String id,Search search) throws Exception {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		return dao.orderAdminCount(search);
	}
	
	public OrderBean orderSellerInfo(OrderBean order, int ocode) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class); 
		OrderBean info = dao.orderSellerInfo(ocode);
		return info;
	}
	
	public void orderSellerUpdate(OrderBean order) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		try {
			 dao.orderSellerUpdate(order);
		} catch (Exception e) {
			System.out.println("update : " + e);
		}
	}
	
	public int orderSellerDelete(int ocode){
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		int code = dao.orderSellerDelete(ocode);
		return code;
	}
}