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
import kr.co.asac.sales.service.SaleSellerService;

@Controller
public class SaleAdminController {

	@Autowired
	private SaleAdminService saleAdminService;
	
	@Autowired
	private SaleSellerService saleSellerService;
	
	@RequestMapping("/sa/ad")
	public String getsaleAdminIndex(Model model) {
		return "adminIndex";
	}
	
	@RequestMapping("/sa/ad/dy")
	public String saleAdminDayList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminDayList(request, response, model);
		return "sales/saleAdminDayList";
	}

	@RequestMapping("/sa/ad/dt")
	public String saleAdminDateList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminDateList(request, response, model);
		return "sales/saleAdminDateList";
	}
	
	@RequestMapping("/sa/ad/we")
	public String saleAdminWeekList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminWeekList(request, response, model);
		return "sales/saleAdminWeekList";
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
	
	@RequestMapping("/sa/ad/sy")
	public String saleAdminSellerDayList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerDayList(request, response, model);
		return "sales/saleAdminSellerDayList";
	}
	
	@RequestMapping("/sa/ad/st")
	public String saleAdminSellerDateList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerDateList(request, response, model);
		return "sales/saleAdminSellerDateList";
	}
	
	@RequestMapping("/sa/ad/se")
	public String saleAdminSellerWeekList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerWeekList(request, response, model);
		return "sales/saleAdminSellerWeekList";
	}
	
	@RequestMapping("/sa/ad/so")
	public String saleAdminSellerMonthList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerMonthList(request, response, model);
		return "sales/saleAdminSellerMonthList";
	}
	
	@RequestMapping("/sa/ad/at")
	public String saleAdminSellerCateList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleAdminService.saleAdminSellerCateList(request, response, order, model);
		return "sales/saleAdminSellerCateList";
	}
	
	@RequestMapping("/sa/ad/ap/pcate/{pcate}")
	public String saleAdminSellerCateProductList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order, @PathVariable("pcate") String pcate) throws Exception {
		saleAdminService.saleAdminSellerCateProductList(request, response, order, model, pcate);
		return "sales/saleAdminSellerCateProList";
	}
}