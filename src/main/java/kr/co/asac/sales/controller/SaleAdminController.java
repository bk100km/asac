package kr.co.asac.sales.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.sales.service.SaleAdminService;

@Controller
public class SaleAdminController {

	@Autowired
	private SaleAdminService saleAdminService;
	
	@RequestMapping("/sa/ad")
	public String getsaleAdminIndex(Model model) {
		return "adminIndex";
	}
	
	@RequestMapping("/sa/ad/ad")
	public String getsaleAdminDayList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminDayList(request, response, model);
		saleAdminService.saleAdminMonthList(request, response, model);
		return "sales/saleAdminDayList";
	}
	
	@RequestMapping("/sa/ad/as")
	public String getsaleAdminSelList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminSellerList(request, response, model);
		saleAdminService.saleAdminSellerListBest(request, response, model);
		return "sales/saleAdminSelList";
	}
	
	@RequestMapping("/sa/ad/ap")
	public String getsaleAdminProList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminProductCateList(request, response, model);
		saleAdminService.saleAdminProductListBest(request, response, model);
		return "sales/saleAdminProList";
	}
	
	@RequestMapping("/sa/ad/sd")
	public String getsaleSellerAdDayList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleSellerAdDayList(request, response, model);
		saleAdminService.saleSellerAdDateList(request, response, model);
		saleAdminService.saleSellerAdWeekList(request, response, model);
		saleAdminService.saleSellerAdMonthList(request, response, model);
		return "sales/saleSellerAdDayList";
	}
	
	@RequestMapping("/sa/ad/sp")
	public String getsaleSellerAdProList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleSellerAdProductCateList(request, response, model);
		saleAdminService.saleSellerAdProductListBest(request, response, model);
		return "sales/saleSellerAdProList";
	}
	
	@RequestMapping("/sa/ad/ia")
	public String getsaleAdminInfo(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminInfo(request, response, order, model);
		return "sales/saleAdminInfo";
	}
	
	@RequestMapping("/sa/ad/is")
	public String getsaleSellerInfo(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleSellerInfo(request, response, order, model);
		return "sales/saleSellerAdInfo";
	}
}