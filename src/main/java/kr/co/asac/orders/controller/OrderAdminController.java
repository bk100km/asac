package kr.co.asac.orders.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.asac.cart.bean.CartBean;
import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.service.OrderAdminService;
import kr.co.asac.orders.service.OrderClientService;
import kr.co.asac.utils.PagingBean;
import kr.co.asac.utils.Search;

@Controller
public class OrderAdminController {

	@Autowired
	private OrderAdminService orderAdminService;
	
	@Autowired
	private OrderClientService orderClientService;
	
	@RequestMapping("/or/ad")
	public String getOrderAdminIndex(Model model) {
		return "adminIndex";
	}
	
	@RequestMapping(value = "/or/ad/li", method = RequestMethod.GET)
	public String orderAdminList(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value="searchCategory", required = false, defaultValue = "pname") String searchCategory,
			@RequestParam(value="searchText", required = false, defaultValue = "") String searchText,
			@ModelAttribute(value = "orderPaging") PagingBean orderPaging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int orderListCnt = orderAdminService.orderAdminListCount(request, searchCategory, searchText);
		orderPaging.pageInfo(page, range, orderListCnt);
		
		orderAdminService.orderAdminList(request, response, model, orderPaging);
		return "orders/orderAdminPage";
	}
	
	@RequestMapping(value = "/or/ad/ls", method = RequestMethod.POST)
	@ResponseBody
	public Map <String, Object> orderAdminListSearch(HttpServletRequest request, Model model, 
			@RequestParam(value = "searchCategory", required = false, defaultValue="pname") String searchCategory,
			@RequestParam(value = "searchText", required = false, defaultValue="") String searchText,
			@ModelAttribute(value = "paging") PagingBean paging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int listCnt = orderAdminService.orderAdminListCount(request, searchCategory, searchText);
		paging.pageInfo(page, range, listCnt);
		
		List <OrderBean> orderList = orderAdminService.orderAdminListSearch(request, model, searchCategory, searchText, paging);
		
	    Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("paging", paging);
		map.put("orderList", orderList);
	    return map;
	}

	@RequestMapping(value = "/or/ad/in", method = RequestMethod.POST)
	@ResponseBody
	public OrderBean orderAdminInfo(Model model, @RequestParam("ocode") String ocode, @RequestParam("pname") String pname) {
		OrderBean order = orderAdminService.orderAdminInfo(model, ocode, pname);
		return order;
	}
	
	@RequestMapping(value = "/or/ad/up", method = RequestMethod.POST)
	@ResponseBody
	public void orderAdminUpdate(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order, Search search) throws Exception {
		orderAdminService.orderAdminUpdate(request, model, response, order);
	}
	
	@RequestMapping(value = "or/ad/de/ocode/{ocode}", method = RequestMethod.POST)
	@ResponseBody
	public void orderAdminDelete(HttpServletRequest request, HttpServletResponse response, Model model, @PathVariable("ocode") String ocode) throws Exception {
		orderAdminService.orderAdminDelete(request, model, response, ocode);
	}
	
	@RequestMapping("/ca/cl/fl")
	public String orderFast(HttpServletRequest request, HttpServletResponse response, Model model, CartBean cart, MemberBean member) throws Exception {
		orderAdminService.orderFast(cart, request, response);
		
    	HttpSession session = request.getSession(); 
		String mid = (String)session.getAttribute("mid");
		
		model.addAttribute("cart", cart);
		List<CartBean> cartlist = orderAdminService.FastList(mid, cart, model);
		model.addAttribute("cartList",cartlist);
		MemberBean memberinfo = orderClientService.memberClientInfo(mid, member);
		model.addAttribute("memberInfo",memberinfo);
		return "orders/orderFast";
	}
	
	@ResponseBody
	@RequestMapping(value="/ca/cl/fi", method = RequestMethod.POST)
	public String orderClientInsert(HttpServletRequest request, Model model, 
			@RequestParam(value="sid", required = false) String sid, 
			@RequestParam(value="pcode", required = false) String pcode, @RequestParam(value="ocount", required = false) String ocount, 
			@RequestParam(value="oname", required = false) String oname, @RequestParam(value="oaddrz", required = false) String oaddrz, 
			@RequestParam(value="oaddr", required = false) String oaddr, @RequestParam(value="oaddrd", required = false) String oaddrd, 
			@RequestParam(value="ophone", required = false) String ophone,  @RequestParam(value="ototal", required = false) String ototal,
			@RequestParam(value="omessage", required = false) String omessage ) throws Exception {
		
		HttpSession session = request.getSession(); 
		String mid = (String)session.getAttribute("mid");
		String ocode = orderAdminService.orderClientInsert(sid, mid, pcode, ocount, oname, oaddrz, oaddr, oaddrd,ophone,ototal, omessage);
		return ocode;
	}
	
	@RequestMapping(value="/ca/cl/fu", method = RequestMethod.POST)
	public String CartUpdate(HttpServletRequest request, HttpSession session, Model model, CartBean cart, MemberBean member) {
		orderClientService.cartUpdate(request, model, cart);
		String mid=(String) session.getAttribute("mid");
		List<CartBean> cartlist = orderAdminService.FastList(mid, cart, model);
		model.addAttribute("cartList",cartlist);
		MemberBean memberinfo = orderClientService.memberClientInfo(mid, member);
		model.addAttribute("memberInfo",memberinfo);
		return "orders/orderFast";
	}
}