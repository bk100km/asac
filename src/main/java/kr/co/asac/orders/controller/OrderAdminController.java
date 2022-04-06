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
import kr.co.asac.orders.service.OrderAdminService;
import kr.co.asac.orders.service.OrderSellerService;
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
	
//	@RequestMapping("/or/ad/ls")
//	public String getOrderAdminSellerList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order, @RequestParam(required = false, defaultValue = "1") int page
//			,@RequestParam(required = false, defaultValue = "1") int range, @RequestParam(required = false) String searchType, @RequestParam(required = false) String keyword,
//			@ModelAttribute("searchSe") Search search) throws Exception {
//		
//		model.addAttribute("searchSe", search);
//		search.setSearchType(searchType);
//		search.setKeyword(keyword);
//		String id = (String) request.getSession().getAttribute("sid");
//		int listCnt = orderSellerService.orderSellerCount(request, id, search);
//		
//		search.pageInfo(page, range, listCnt);
//		model.addAttribute("orderPagingSe", search);
//		
//		orderSellerService.orderSellerList(request, response, model, search);
//		
//		return "orders/orderSellerAdList";
//	}
	
	@RequestMapping("/or/ad/la")
	public String getOrderAdminList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order, @RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false, defaultValue = "1") int range, @RequestParam(required = false) String searchType, @RequestParam(required = false) String keyword,
			@ModelAttribute("searchSe") Search searchSe, @ModelAttribute("searchAd") Search searchAd) throws Exception {
		model.addAttribute("searchAd", searchAd);
		searchAd.setSearchType(searchType);
		System.out.println("searchType값은 = " + searchType);
		searchAd.setKeyword(keyword);
		System.out.println("keyword값은 = " + keyword);
		int listCntAd = orderAdminService.orderAdminCount(searchAd);
		System.out.println("listCnt 값은 = " + listCntAd);
		
		searchAd.pageInfo(page, range, listCntAd);
		System.out.println("search값은 =" + searchAd);
		model.addAttribute("orderPagingAd", searchAd);
		
		orderAdminService.orderAdminList(request, response, model, searchAd);
		return "orders/orderAdminList";
	}

	@RequestMapping("/or/ad/in")
	public String getOrderAdminInfo(Model model, @RequestParam int ocode, OrderBean order) {
		OrderBean info = orderAdminService.orderAdminInfo(order, ocode);
		model.addAttribute("orderAdminInfo", info);
		System.out.println("최고관리자 info : " + info);
		return "orders/orderAdminInfo";
	}

	@RequestMapping(value = "/or/ad/up", method = RequestMethod.GET)
	public String getOrderAdminUpdateGet(HttpSession session, @RequestParam int ocode, OrderBean order, Model model) throws Exception{
		String id = (String)session.getAttribute("sid");
		System.out.println("중간관리자 sid 값 : " + id);
		OrderBean info = orderAdminService.orderAdminInfo(order, ocode);
		model.addAttribute("orderAdminUpdate", info);
		return "orders/orderAdminUpdate";
	}
	
	@RequestMapping(value ="/or/ad/up", method = RequestMethod.POST)
	public String getOrderAdminUpdatePost(OrderBean order) throws Exception {
		orderAdminService.orderAdminUpdate(order);
		System.out.println("Update중..");
		return "redirect:/or/ad/la";
	}
	
	@RequestMapping("or/ad/de")
	public String orderAdminDelete(@RequestParam int ocode) {
		orderAdminService.orderAdminDelete(ocode);
		return "redirect:/or/ad/la";
	}
}