package kr.co.asac.sales.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.gson.Gson;

import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.sales.dao.SaleDAO;

@Service
public class SaleSellerService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void saleSellerDayList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleSellerDayList = dao.saleSellerDayList(id);
		List<OrderBean> saleSellerDayConfirmList = dao.saleSellerDayConfirmList(id);
		
		String jsondayList = new Gson().toJson(saleSellerDayList);
		String jsondayConfirmList = new Gson().toJson(saleSellerDayConfirmList);
		
		model.addAttribute("seldayList", jsondayList);
		model.addAttribute("seldayConfirmList", jsondayConfirmList);
		
		model.addAttribute("saleSellerDayList", saleSellerDayList);
		model.addAttribute("saleSellerDayConfirmList", saleSellerDayConfirmList);
	}
	
	public void saleSellerDateList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleSellerDateList = dao.saleSellerDateList(id);
		List<OrderBean> saleSellerDateConfirmList = dao.saleSellerDateConfirmList(id);
		
		String jsondateList = new Gson().toJson(saleSellerDateList);
		String jsondateConfirmList = new Gson().toJson(saleSellerDateConfirmList);
		
		model.addAttribute("seldateList", jsondateList);
		model.addAttribute("seldateConfirmList", jsondateConfirmList);
		
		model.addAttribute("saleSellerDateList", saleSellerDateList);
		model.addAttribute("saleSellerDateConfirmList", saleSellerDateConfirmList);
	}
	
	public void saleSellerWeekList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleSellerWeekList = dao.saleSellerWeekList(id);
		List<OrderBean> saleSellerWeekConfirmList = dao.saleSellerWeekConfirmList(id);
		
		String jsonweekList = new Gson().toJson(saleSellerWeekList);
		String jsonweekConfirmList = new Gson().toJson(saleSellerWeekConfirmList);
		
		model.addAttribute("selweekList", jsonweekList);
		model.addAttribute("selweekConfirmList", jsonweekConfirmList);
		
		model.addAttribute("saleSellerWeekList", saleSellerWeekList);
		model.addAttribute("saleSellerWeekConfirmList", saleSellerWeekConfirmList);
	}
	
	public void saleSellerMonthList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleSellerMonthList = dao.saleSellerMonthList(id);
		List<OrderBean> saleSellerMonthConfirmList = dao.saleSellerMonthConfirmList(id);
		
		String jsonmonList = new Gson().toJson(saleSellerMonthList);
		String jsonmonConfirmList = new Gson().toJson(saleSellerMonthConfirmList);
		
		model.addAttribute("selmonList", jsonmonList);
		model.addAttribute("selmonConfirmList", jsonmonConfirmList);
		
		model.addAttribute("saleSellerMonthList", saleSellerMonthList);
		model.addAttribute("saleSellerMonthConfirmList", saleSellerMonthConfirmList);
	}
	
	public void saleSellerProductList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleSellerProductList = dao.saleSellerProductList(id);
		List<OrderBean> saleSellerProductConfirmList = dao.saleSellerProductConfirmList(id);
		
		String jsonproList = new Gson().toJson(saleSellerProductList);
		String jsonproConfirmList = new Gson().toJson(saleSellerProductConfirmList);
		
		model.addAttribute("selproList", jsonproList);
		model.addAttribute("selproConfirmList", jsonproConfirmList);
		
		model.addAttribute("saleSellerProductList", saleSellerProductList);
		model.addAttribute("saleSellerProductConfirmList", saleSellerProductConfirmList);
	}
}