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
		List<OrderBean> saleAdminDayConfirmList = dao.saleAdminDayConfirmList();
		
		String jsondayList = new Gson().toJson(saleAdminDayList);
		String jsondayConfirmList = new Gson().toJson(saleAdminDayConfirmList);
		
		model.addAttribute("addayList", jsondayList);
		model.addAttribute("addayConfirmList", jsondayConfirmList);
	
		model.addAttribute("saleAdminDayList", saleAdminDayList);
		model.addAttribute("saleAdminDayConfirmList", saleAdminDayConfirmList);
	}
	
	public void saleAdminDateList(HttpServletRequest request, HttpServletResponse response, Model model)	throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleAdminDateList = dao.saleAdminDateList();
		List<OrderBean> saleAdminDateConfirmList = dao.saleAdminDateConfirmList();
		
		String jsondateList = new Gson().toJson(saleAdminDateList);
		String jsondateConfirmList = new Gson().toJson(saleAdminDateConfirmList);
		
		model.addAttribute("addateList", jsondateList);
		model.addAttribute("addateConfirmList", jsondateConfirmList);
		
		model.addAttribute("saleAdminDateList", saleAdminDateList);
		model.addAttribute("saleAdminDateConfirmList", saleAdminDateConfirmList);
	}
	
	public void saleAdminWeekList(HttpServletRequest request, HttpServletResponse response, Model model)	throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleAdminWeekList = dao.saleAdminWeekList();
		List<OrderBean> saleAdminWeekConfirmList = dao.saleAdminWeekConfirmList();
		
		String jsonweekList = new Gson().toJson(saleAdminWeekList);
		String jsonweekConfirmList = new Gson().toJson(saleAdminWeekConfirmList);
		
		model.addAttribute("adweekList", jsonweekList);
		model.addAttribute("adweekConfirmList", jsonweekConfirmList);
		
		model.addAttribute("saleAdminWeekList", saleAdminWeekList);
		model.addAttribute("saleAdminWeekConfirmList", saleAdminWeekConfirmList);
	}
	
	public void saleAdminMonthList(HttpServletRequest request, HttpServletResponse response, Model model)	throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleAdminMonthList = dao.saleAdminMonthList();
		List<OrderBean> saleAdminMonthConfirmList = dao.saleAdminMonthConfirmList();
		
		String jsondateList = new Gson().toJson(saleAdminMonthList);
		String jsondateConfirmList = new Gson().toJson(saleAdminMonthConfirmList);
		
		model.addAttribute("admonthList", jsondateList);
		model.addAttribute("admonthConfirmList", jsondateConfirmList);
		
		model.addAttribute("saleAdminMonthList", saleAdminMonthList);
		model.addAttribute("saleAdminMonthConfirmList", saleAdminMonthConfirmList);
	}
	
	//여기부터 해야함
	public void saleAdminSellerList(HttpServletRequest request, HttpServletResponse response, Model model)	throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleAdminSellerList = dao.saleAdminSellerList();
		List<OrderBean> saleAdminSellerConfirmList = dao.saleAdminSellerConfirmList();
		
		String jsonsellerList = new Gson().toJson(saleAdminSellerList);
		String jsonsellerConfirmList = new Gson().toJson(saleAdminSellerConfirmList);
		
		model.addAttribute("adsellerList", jsonsellerList);
		model.addAttribute("adsellerConfirmList", jsonsellerConfirmList);
		
		model.addAttribute("saleAdminSellerList", saleAdminSellerList);
		model.addAttribute("saleAdminSellerConfirmList", saleAdminSellerConfirmList);
	}
	
	public void saleAdminCateList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		List<OrderBean> saleAdminCateList = dao.saleAdminCateList();
		List<OrderBean> saleAdminCateConfirmList = dao.saleAdminCateConfirmList();
		
		String jsonCateList = new Gson().toJson(saleAdminCateList);
		String jsonCateConfirmList = new Gson().toJson(saleAdminCateConfirmList);
		
		model.addAttribute("adcateList", jsonCateList);
		model.addAttribute("adcateConfirmList", jsonCateConfirmList);
		
		model.addAttribute("saleAdminCateList", saleAdminCateList);
		model.addAttribute("saleAdminCateConfirmList", saleAdminCateConfirmList);
	}
	
	public void saleAdminCateProductList(HttpServletRequest request, HttpServletResponse response, OrderBean order, Model model, String pcate) throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		System.out.println("pcate??"+pcate);
		
		List<OrderBean> saleAdminCateProductList = dao.saleAdminCateProductList(pcate);
		List<OrderBean> saleAdminCateProductConfirmList = dao.saleAdminCateProductConfirmList(pcate);
		
		String jsonCateProductList = new Gson().toJson(saleAdminCateProductList);
		String jsonCateProductConfirmList = new Gson().toJson(saleAdminCateProductConfirmList);
		
		model.addAttribute("adcateProductList", jsonCateProductList);
		model.addAttribute("adcateProductConfirmList", jsonCateProductConfirmList);
		
		model.addAttribute("saleAdminCateProductList", saleAdminCateProductList);
		model.addAttribute("saleAdminCateProductConfirmList", saleAdminCateProductConfirmList);
	}

	public void saleAdminSellerCateList(HttpServletRequest request, HttpServletResponse response, OrderBean order, Model model) throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		String id = (String) request.getSession().getAttribute("sid");
		String pcate = (String) request.getParameter("pcate");		
		
		List<OrderBean> saleAdminSellerCateList = dao.saleAdminSellerCateList(id, pcate);
		List<OrderBean> saleAdminSellerCateConfirmList = dao.saleAdminSellerCateConfirmList(id, pcate);
		
		String jsonSellerCateList = new Gson().toJson(saleAdminSellerCateList);
		String jsonSellerCateConfirmList = new Gson().toJson(saleAdminSellerCateConfirmList);
		
		model.addAttribute("adSellerCateList", jsonSellerCateList);
		model.addAttribute("adSellerCateConfirmList", jsonSellerCateConfirmList);
		
		model.addAttribute("saleAdminSellerCateList", saleAdminSellerCateList);
		model.addAttribute("saleAdminCateProductConfirmList", saleAdminSellerCateConfirmList);
	}

	public void saleAdminSellerCateProductList(HttpServletRequest request, HttpServletResponse response, OrderBean order, Model model, String pcate) throws Exception {
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("pcate??"+pcate);
		
		List<OrderBean> saleAdminSellerCateProductList = dao.saleAdminSellerCateProductList(id, pcate);
		List<OrderBean> saleAdminSellerCateProductConfirmList = dao.saleAdminSellerCateProductConfirmList(id, pcate);
		
		String jsonSellerCateProductList = new Gson().toJson(saleAdminSellerCateProductList);
		String jsonSellerCateProductConfirmList = new Gson().toJson(saleAdminSellerCateProductConfirmList);
		
		model.addAttribute("adcateProductList", jsonSellerCateProductList);
		model.addAttribute("adcateProductConfirmList", jsonSellerCateProductConfirmList);
		
		model.addAttribute("saleAdminSellerCateProductList", saleAdminSellerCateProductList);
		model.addAttribute("saleAdminSellerCateProductConfirmList", saleAdminSellerCateProductConfirmList);
	}
}