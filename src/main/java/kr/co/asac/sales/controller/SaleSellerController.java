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
	
	@RequestMapping("/sa/se/sd")
	public String getsaleSellerDayList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerDayList(request, response, model);
		saleSellerService.saleSellerDateList(request, response, model);
		saleSellerService.saleSellerWeekList(request, response, model);
		saleSellerService.saleSellerMonthList(request, response, model);
		return "sales/saleSellerDayList";
	}
	
	@RequestMapping("/sa/se/sp")
	public String getsaleSellerProList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerProductCateList(request, response, model);
		saleSellerService.saleSellerProductListBest(request, response, model);
		saleSellerService.saleSellerProductListWorst(request, response, model);
		return "sales/saleSellerProList";
	}
	
	@RequestMapping("/sa/se/is")
	public String getsaleSellerInfo(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerInfo(request, response, order, model);
		return "sales/saleSellerInfo";
	}
}