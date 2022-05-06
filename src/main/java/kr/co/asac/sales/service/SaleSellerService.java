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
		
		String jsondayList = new Gson().toJson(saleSellerDayList);
		
		model.addAttribute("seldayList", jsondayList);
		
		model.addAttribute("saleSellerDayList", saleSellerDayList);
	}
	
	public void saleSellerMonthList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleSellerMonthList = dao.saleSellerMonthList(id);
		
		String jsonmonList = new Gson().toJson(saleSellerMonthList);
		
		model.addAttribute("selmonList", jsonmonList);
		
		model.addAttribute("saleSellerMonthList", saleSellerMonthList);
	}
	
	public void saleSellerProductList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleSellerProductList = dao.saleSellerProductList(id);
		
		String jsonproList = new Gson().toJson(saleSellerProductList);
		
		model.addAttribute("selproList", jsonproList);
		
		model.addAttribute("saleSellerProductList", saleSellerProductList);
	}
}