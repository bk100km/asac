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
import kr.co.asac.orders.service.OrderSellerService;
import kr.co.asac.utils.PagingBean;
import kr.co.asac.utils.Search;

@Controller
public class OrderSellerController {

	@Autowired
	private OrderSellerService orderSellerService;
	
	@RequestMapping("/or/se")
	public String getOrderSellerIndex(Model model) {
		return "sellerIndex";
	}
	
	@RequestMapping(value = "/or/se/li", method = RequestMethod.GET)
	public String orderSellerList(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value="orderSearchCategory", required = false, defaultValue = "pname") String orderSearchCategory,
			@RequestParam(value="orderSearchText", required = false, defaultValue = "") String orderSearchText,
			@ModelAttribute(value = "orderPaging") PagingBean orderPaging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int orderListCnt = orderSellerService.orderSellerListCount(request, orderSearchCategory, orderSearchText);
		orderPaging.pageInfo(page, range, orderListCnt);
		
		orderSellerService.orderSellerList(request, response, model, orderPaging);
		
		return "orders/orderSellerPage";
	}
	
	@RequestMapping(value = "/or/se/ls", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/or/se/in", method = RequestMethod.POST)
	@ResponseBody
	public OrderBean orderSellerInfo(Model model, @RequestParam("ocode") String ocode, @RequestParam("pname") String pname) {
		OrderBean order = orderSellerService.orderSellerInfo(model, ocode, pname);
		return order;
	}
	
	@RequestMapping(value = "/or/se/up", method = RequestMethod.POST)
	@ResponseBody
	public void orderSellerUpdate(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order, Search search) throws Exception {
		orderSellerService.orderSellerUpdate(request, model, response, order);
	}
	
	@RequestMapping(value = "or/se/de/ocode/{ocode}", method = RequestMethod.POST)
	@ResponseBody
	public void orderSellerDelete(HttpServletRequest request, HttpServletResponse response, Model model, @PathVariable("ocode") String ocode) throws Exception {
		orderSellerService.orderSellerDelete(request, model, response, ocode);
	}
}