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
public class OrderAdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void orderAdminList(HttpServletRequest request, HttpServletResponse response, Model model, PagingBean paging) throws Exception {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		List<OrderBean> orderAdminList = dao.orderAdminList(paging);
		model.addAttribute("orderAdminList", orderAdminList);
		System.out.println(orderAdminList);
	}
	
	
	public int orderAdminListCount(HttpServletRequest request, String searchCategory, String searchText) throws Exception {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		int listCnt = dao.orderAdminListCount(searchCategory, searchText);
		return listCnt;
	}
	
	public OrderBean orderAdminInfo(Model model, String ocode, String pname) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class); 
		OrderBean order = dao.orderAdminInfo(ocode, pname);
		return order;
	}
	
	public List<OrderBean> orderAdminListSearch(HttpServletRequest request, Model model, @RequestParam("searchCategory") String searchCategory, @RequestParam("searchText") String searchText, @RequestParam("paging") PagingBean paging) {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class); 
		List<OrderBean> orderAdminListSearch = dao.orderAdminListSearch(searchCategory, searchText, paging);
		model.addAttribute("orderAdminListSearch", orderAdminListSearch);
		return orderAdminListSearch;
	}
	
	public void orderAdminUpdate(HttpServletRequest request, Model model, HttpServletResponse response, OrderBean order) throws Exception {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		dao.orderAdminUpdate(order);
	}
	
	public void orderAdminDelete(HttpServletRequest request, Model model, HttpServletResponse response, String ocode) throws Exception {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		dao.orderAdminDelete(ocode);
	}
}