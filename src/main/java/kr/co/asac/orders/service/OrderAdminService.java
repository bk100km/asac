package kr.co.asac.orders.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.asac.cart.bean.CartBean;
import kr.co.asac.cart.dao.CartDAO;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.dao.OrderDAO;
import kr.co.asac.product.bean.ProductBean;
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
	
	public void orderProductList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
		List<ProductBean> orderProductList = dao.orderProductList();
		model.addAttribute("orderProductList", orderProductList);
		System.out.println(orderProductList);
	}
	
    public void cartInsert(CartBean cart, HttpServletResponse response, String mid) throws Exception {
    	CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);
    	List<CartBean> pcodelist = dao.cartClientPcode(mid);
		String pcode = pcodelist.toString();
		String cartpcode = cart.pcode;
		boolean isContainsPcode = pcode.contains(cartpcode);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (isContainsPcode == true) {
			out.println("<script>");
		   	out.println("alert('장바구니에 담겨져있는 상품입니다!')");
		   	out.println("</script>");
		   	out.flush();
		}else {
		System.out.println("참이어야해" + isContainsPcode);
    	dao.cartInsert(cart);
    	out.println("<script>");
	   	out.println("alert('상품이 장바구니에 담겼습니다!')");
	   	out.println("</script>");
	   	out.flush();
		}
    }
}