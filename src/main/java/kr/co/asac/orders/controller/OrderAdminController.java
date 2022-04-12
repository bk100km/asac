package kr.co.asac.orders.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.service.OrderAdminService;
import kr.co.asac.orders.service.OrderSellerService;
import kr.co.asac.utils.PagingBean;
import kr.co.asac.utils.Search;

@Controller
public class OrderAdminController {

	@Autowired
	private OrderSellerService orderSellerService;

	@Autowired
	private OrderAdminService orderAdminService;
	
	@RequestMapping("/or/ad")
	public String getOrderAdminIndex(Model model) {
		return "adminIndex";
	}
	
	@RequestMapping(value = "/or/ad/al", method = RequestMethod.GET)
	public String orderAdminList(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value="orderSearchCategory", required = false, defaultValue = "pname") String orderSearchCategory,
			@RequestParam(value="orderSearchText", required = false, defaultValue = "") String orderSearchText,
			@ModelAttribute(value = "orderPaging") PagingBean orderPaging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int orderListCnt = orderAdminService.orderAdminListCount(request, orderSearchCategory, orderSearchText);
		orderPaging.pageInfo(page, range, orderListCnt);
		
		orderAdminService.orderAdminList(request, response, model, orderPaging);
		return "orders/orderAdminPage";
	}
	
	@RequestMapping(value = "/or/ad/as", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/or/ad/sl", method = RequestMethod.GET)
	public String orderAdSellerList(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value="orderSearchCategory", required = false, defaultValue = "pname") String orderSearchCategory,
			@RequestParam(value="orderSearchText", required = false, defaultValue = "") String orderSearchText,
			@ModelAttribute(value = "orderPaging") PagingBean orderPaging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int orderListCnt = orderSellerService.orderSellerListCount(request, orderSearchCategory, orderSearchText);
		orderPaging.pageInfo(page, range, orderListCnt);
		orderSellerService.orderSellerList(request, response, model, orderPaging);
		return "orders/orderAdminSellerPage";
	}
	
	@RequestMapping(value = "/or/ad/ss", method = RequestMethod.POST)
	@ResponseBody
	public Map <String, Object> orderSellerSearchList(HttpServletRequest request, Model model, 
			@RequestParam(value = "searchCategory", required = false, defaultValue="pname") String searchCategory,
			@RequestParam(value = "searchText", required = false, defaultValue="") String searchText,
			@ModelAttribute(value = "paging") PagingBean paging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int listCnt = orderSellerService.orderSellerListCount(request, searchCategory, searchText);
		paging.pageInfo(page, range, listCnt);
		List <OrderBean> orderList = orderSellerService.orderSellerListSearch(request, model, searchCategory, searchText, paging);
		
	    Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("paging", paging);
		map.put("orderList", orderList);
	    return map;
	}

	@RequestMapping(value = "/or/ad/in", method = RequestMethod.POST)
	@ResponseBody
	public OrderBean orderAdminInfo(Model model, @RequestParam("ocode") String ocode, @RequestParam("pname") String pname) {
		System.out.println("info" + ocode);
		System.out.println("info1" + pname);
		OrderBean order = orderAdminService.orderAdminInfo(model, ocode, pname);
		return order;
	}
	
	@RequestMapping(value = "/or/ad/up", method = RequestMethod.POST)
	@ResponseBody
	public void orderAdminUpdate(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order, Search search) throws Exception {
		System.out.println("update" + order);
		orderAdminService.orderAdminUpdate(request, model, response, order);
	}
	
	@RequestMapping(value = "/or/ad/du", method = RequestMethod.POST)
	@ResponseBody
	public void orderDeliveryUpdate(HttpServletRequest request, @RequestParam(value = "ocode") String ocode,
			@RequestParam(value = "odelivery") String odelivery, @RequestParam(value = "pname") String pname) throws Exception {
		System.out.println("주문번호" + ocode);
		System.out.println("배송상태" + odelivery);
		System.out.println("상품명" + pname);
		orderSellerService.orderDeliveryUpdate(ocode, odelivery, pname);
	}
	
	@RequestMapping(value = "or/ad/de/ocode/{ocode}", method = RequestMethod.POST)
	@ResponseBody
	public void orderAdminDelete(HttpServletRequest request, HttpServletResponse response, Model model, @PathVariable("ocode") String ocode) throws Exception {
		orderAdminService.orderAdminDelete(request, model, response, ocode);
	}
}