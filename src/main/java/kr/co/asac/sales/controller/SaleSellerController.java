package kr.co.asac.sales.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.sales.service.SaleSellerService;

@Controller
public class SaleSellerController {

	@Autowired
	private SaleSellerService saleSellerService;

	@RequestMapping("/sa/se")
	public String getsaleAdminIndex(Model model) {
		return "sellerIndex";
	}

	@RequestMapping("/sa/se/dy")
	public String saleSellerDayList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerDayList(request, response, model);
		return "sales/saleSellerDayList";
	}

	@RequestMapping("/sa/se/dt")
	public String saleSellerDateList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerDateList(request, response, model);
		return "sales/saleSellerDateList";
	}
	
	@RequestMapping("/sa/se/we")
	public String saleSellerWeekList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerWeekList(request, response, model);
		return "sales/saleSellerWeekList";
	}
	
	@RequestMapping("/sa/se/mo")
	public String saleSellerMonthList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerMonthList(request, response, model);
		return "sales/saleSellerMonthList";
	}
	
	@RequestMapping("/sa/se/po")
	public String saleSellerProductList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerProductList(request, response, model);
		return "sales/saleSellerProList";
	}
}