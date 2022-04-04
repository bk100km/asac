package kr.co.asac.orders.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.service.OrderSellerService;
import kr.co.asac.utils.Search;

@Controller
public class OrderSellerController {

	@Autowired
	private OrderSellerService orderSellerService;

	@RequestMapping("/or/se")
	public String getOrderSellerIndex(Model model) {
		return "sellerIndex";
	}
	
	@RequestMapping("/or/se/li")
	public String getOrderSellerList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order, @RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false, defaultValue = "1") int range, @RequestParam(required = false) String searchType, @RequestParam(required = false) String keyword,
			@ModelAttribute("searchSe") Search search) throws Exception {
		
		model.addAttribute("searchSe", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		String id = (String) request.getSession().getAttribute("sid");
		int listCnt = orderSellerService.orderSellerCount(request, id, search);
		
		search.pageInfo(page, range, listCnt);
		model.addAttribute("orderPagingSe", search);
		
		orderSellerService.orderSellerList(request, response, model, search);
		
		return "orders/orderSellerList";
	}
	
	@RequestMapping("/or/se/in")
	public String getOrderSellerInfo(Model model, @RequestParam int ocode, OrderBean order) {
		OrderBean info = orderSellerService.orderSellerInfo(order, ocode);
		model.addAttribute("orderSellerInfo", info);
		System.out.println("중간관리자 info : " + info);
		return "orders/orderSellerInfo";
	}
	
	@RequestMapping(value = "/or/se/up", method = RequestMethod.GET)
	public String getOrderSellerUpdateGet(HttpSession session, @RequestParam int ocode, OrderBean order, Model model) throws Exception{
		String id = (String)session.getAttribute("sid");
		System.out.println("중간관리자 sid 값 : " + id);
		OrderBean info = orderSellerService.orderSellerInfo(order, ocode);
		model.addAttribute("orderSellerUpdate", info);
		return "orders/orderSellerUpdate";
	}
	
	@RequestMapping(value ="/or/se/up", method = RequestMethod.POST)
	public String getOrderSellerUpdatePost(OrderBean order) throws Exception {
		orderSellerService.orderSellerUpdate(order);
		System.out.println("Update중..");
		return "redirect:/or/se/li";
	}
	
	@RequestMapping("or/se/de")
	public String orderSellerDelete(@RequestParam int ocode) {
		orderSellerService.orderSellerDelete(ocode);
		return "redirect:/or/se/li";
	}
}