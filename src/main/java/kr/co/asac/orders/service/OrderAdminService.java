package kr.co.asac.orders.service;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
    
    public void cartResetInsert(CartBean cart, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	CartDAO cartDAO = sqlSessionTemplate.getMapper(CartDAO.class);
    	OrderDAO orderDAO = sqlSessionTemplate.getMapper(OrderDAO.class);

    	HttpSession session = request.getSession(); 
		String mid = (String)session.getAttribute("mid");
		
		if (mid == null) {
			response.setContentType("text/html;charset=utf-8");
		   	PrintWriter out = response.getWriter();
		   	out.println("<script>");
		   	out.println("alert('로그인 후 이용해주세요.')");
		   	out.println("location.href='../../me/cl/lo';");
		   	out.println("</script>");
		   	out.flush();
		}
		else {
			orderDAO.orderCartReset(mid);
	    	cartDAO.cartInsert(cart);
		}
    }
    
    public String orderClientInsert(String sid, String mid, String pcode, String ocount, String oname,
			String oaddrz, String oaddr, String oaddrd, String ophone,  String ototal, String omessage) {
		System.out.println("서비스 들어옴");
		OrderBean order = new OrderBean();
			order.setMid(mid);
			order.setOname(oname);
			order.setOaddrz(oaddrz);
			order.setOaddr(oaddr);
			order.setOaddrd(oaddrd);
			order.setOphone(ophone);
			order.setOmessage(omessage);
			
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			String date = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1) 
					 + new DecimalFormat("00").format(cal.get(Calendar.DATE));
			String dateNum = "";
			
			for(int i =1;i <= 6 ; i++) {
				dateNum += (int)(Math.random()*10);
			}
			
			String ocode = date + "_" + dateNum;
			
			order.setOcode(ocode);
			order.setSid(sid);
			order.setPcode(pcode);
			order.setOcount(Integer.parseInt(ocount));
			order.setOtotal(Integer.parseInt(ototal));
				
			OrderDAO dao = sqlSessionTemplate.getMapper(OrderDAO.class);
			dao.orderClientInsert(order);
			
			return ocode;
    }
}