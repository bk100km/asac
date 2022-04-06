package kr.co.asac.sales.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.sales.dao.SaleDAO;
import kr.co.asac.sales.service.SaleSellerService;

@Controller
public class SaleSellerController {

	@Autowired
	private SaleSellerService saleSellerService;
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping("/sa/se")
	public String getsaleAdminIndex(Model model) {
		return "sellerIndex";
	}
	
	@RequestMapping("/sa/se/sd")
	public String getsaleSellerDayList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerDayList(request, response, model);
		
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);
		
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> weekbook = dao.saleSellerDayList(id);
		String jsonweekbook = new Gson().toJson(weekbook);
		List<OrderBean> list2 = dao.saleSellerDayConfirmList(id);
		String jsonlist2 = new Gson().toJson(list2);
		model.addAttribute("weekbook", jsonweekbook);
		model.addAttribute("list2", jsonlist2);	
		
		return "sales/saleSellerDayList";
	}
	
	@RequestMapping("/sa/se/sm")
	public String getsaleSellerMonthList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerMonthList(request, response, model);
		
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);
		
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> weekbook = dao.saleSellerMonthList(id);
		String jsonweekbook = new Gson().toJson(weekbook);
		List<OrderBean> list2 = dao.saleSellerMonthConfirmList(id);
		String jsonlist2 = new Gson().toJson(list2);
		model.addAttribute("weekbook", jsonweekbook);
		model.addAttribute("list2", jsonlist2);	
		
		return "sales/saleSellerMonthList";
	}
	
	@RequestMapping("/sa/se/sp")
	public String getsaleSellerProList(HttpServletRequest request, HttpServletResponse response, Model model, OrderBean order) throws Exception {
		saleSellerService.saleSellerProductCateList(request, response, model);

		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> weekbook = dao.saleSellerProductList(id);
		String jsonweekbook = new Gson().toJson(weekbook);
		List<OrderBean> list2 = dao.saleSellerProductConfirmList(id);
		String jsonlist2 = new Gson().toJson(list2);
		model.addAttribute("weekbook", jsonweekbook);
		model.addAttribute("list2", jsonlist2);	
		return "sales/saleSellerProList";
	}
	
	@RequestMapping("/sa/se/c")
	public String getc() {
		return "sales/test";
	}
	
	@RequestMapping("/sa/se/ch")
	public String countTurtle(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> weekbook = dao.saleSellerProductList(id);
		String jsonweekbook = new Gson().toJson(weekbook);
		List<OrderBean> list2 = dao.saleSellerProductConfirmList(id);
		String jsonlist2 = new Gson().toJson(list2);
		model.addAttribute("weekbook", jsonweekbook);
		model.addAttribute("list2", jsonlist2);
		return "sales/test3";
	}
}