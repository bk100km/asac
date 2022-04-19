package kr.co.asac.sales.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping("/sa/ad/dy")
	public String saleAdminDayList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminDayList(request, response, model);
		return "sales/saleAdminDayList";
	}
	
	@RequestMapping("/sa/ad/mo")
	public String saleAdminMonthList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminMonthList(request, response, model);
		return "sales/saleAdminMonthList";
	}
	
	@RequestMapping("/sa/ad/sl")
	public String saleAdminSellerList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminSellerList(request, response, model);
		return "sales/saleAdminSellerList";
	}
	
	@RequestMapping("/sa/ad/ct")
	public String saleAdminCateList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminCateList(request, response, model);
		return "sales/saleAdminCateList";
	}
	
	@RequestMapping("/sa/ad/cp/pcate/{pcate}")
	public String saleAdminCateProductList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order, @PathVariable("pcate") String pcate) throws Exception {
		saleAdminService.saleAdminCateProductList(request, response, order, model, pcate);
		return "sales/saleAdminCateProList";
	}
}