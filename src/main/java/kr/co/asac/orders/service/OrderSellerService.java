package kr.co.asac.orders.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.dao.OrderDAO;
import kr.co.asac.utils.PagingBean;

@Service
public class OrderSellerService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void orderSellerList(HttpServletRequest request, HttpServletResponse response, Model model, PagingBean paging) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("SellerList Sid값 : " + id);
		
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		List<OrderBean> orderSellerList = dao.orderSellerList(id, paging);
		model.addAttribute("orderSellerList", orderSellerList);
		System.out.println(orderSellerList);
	}
	
	
	public int orderSellerListCount(HttpServletRequest request, String searchCategory, String searchText) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		int listCnt = dao.orderSellerListCount(id, searchCategory, searchText);
		System.out.println("count값" + listCnt);
		return listCnt;
	}
	
	public OrderBean orderSellerInfo(Model model, String ocode, String pname) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class); 
		OrderBean order = dao.orderSellerInfo(ocode, pname);
		return order;
	}
	
	public List<OrderBean> orderSellerListSearch(HttpServletRequest request, Model model, @RequestParam("searchCategory") String searchCategory, @RequestParam("searchText") String searchText, @RequestParam("paging") PagingBean paging) {
		String id = (String) request.getSession().getAttribute("sid");
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class); 
		List<OrderBean> orderSellerListSearch = dao.orderSellerListSearch(id, searchCategory, searchText, paging);
		model.addAttribute("orderSellerListSearch", orderSellerListSearch);
		return orderSellerListSearch;
	}
	
	public void orderSellerUpdate(HttpServletRequest request, Model model, HttpServletResponse response, OrderBean order) throws Exception {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		dao.orderSellerUpdate(order);
	}
	
	public void orderDeliveryUpdate(String ocode, String odelivery, String pname) throws Exception {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		dao.orderDeliveryUpdate(ocode, odelivery, pname);
	}
	
	public void orderSellerDelete(HttpServletRequest request, Model model, HttpServletResponse response, String ocode) throws Exception {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		dao.orderSellerDelete(ocode);
	}
}