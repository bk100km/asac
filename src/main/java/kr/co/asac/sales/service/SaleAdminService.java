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
public class SaleAdminService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void saleAdminDayList(HttpServletRequest request, HttpServletResponse response, Model model)	throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleAdminDayList = dao.saleAdminDayList();
		String jsondayList = new Gson().toJson(saleAdminDayList);
		System.out.println(jsondayList);
		model.addAttribute("addayList", jsondayList);
		model.addAttribute("saleAdminDayList", saleAdminDayList);
	}
	
	public void saleAdminMonthList(HttpServletRequest request, HttpServletResponse response, Model model)	throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleAdminMonthList = dao.saleAdminMonthList();
		
		String jsondateList = new Gson().toJson(saleAdminMonthList);
		
		model.addAttribute("admonthList", jsondateList);
		
		model.addAttribute("saleAdminMonthList", saleAdminMonthList);
	}
	
	public void saleAdminSellerList(HttpServletRequest request, HttpServletResponse response, Model model)	throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleAdminSellerList = dao.saleAdminSellerList();
		
		String jsonsellerList = new Gson().toJson(saleAdminSellerList);
		
		model.addAttribute("adsellerList", jsonsellerList);
		
		model.addAttribute("saleAdminSellerList", saleAdminSellerList);
	}
	
	public void saleAdminCateList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleAdminCateList = dao.saleAdminCateList();
		
		String jsonCateList = new Gson().toJson(saleAdminCateList);
		
		model.addAttribute("adcateList", jsonCateList);
		
		model.addAttribute("saleAdminCateList", saleAdminCateList);
	}
	
	public void saleAdminCateProductList(HttpServletRequest request, HttpServletResponse response, OrderBean order, Model model, String pcate) throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		System.out.println("pcate??"+pcate);
		List<OrderBean> saleAdminCateProductList = dao.saleAdminCateProductList(pcate);
		String jsonCateProductList = new Gson().toJson(saleAdminCateProductList);		
		model.addAttribute("adcateProductList", jsonCateProductList);		
		model.addAttribute("saleAdminCateProductList", saleAdminCateProductList);
	}
}