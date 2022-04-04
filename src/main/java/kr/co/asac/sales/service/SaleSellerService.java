package kr.co.asac.sales.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.sales.dao.SaleDAO;

@Service
public class SaleSellerService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void saleSellerDayList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		List<OrderBean> saleSellerDayList = dao.saleSellerDayList(id);
		List<OrderBean> saleSellerDayConfirmList = dao.saleSellerDayConfirmList(id);
		model.addAttribute("saleSellerDayList", saleSellerDayList);
		model.addAttribute("saleSellerDayConfirmList", saleSellerDayConfirmList);

	}

	public void saleSellerDateList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		List<OrderBean> saleSellerDateList = dao.saleSellerDateList(id);
		model.addAttribute("saleSellerDateList", saleSellerDateList);
		System.out.println(saleSellerDateList);

	}

	public void saleSellerWeekList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		List<OrderBean> saleSellerWeekList = dao.saleSellerWeekList(id);
		model.addAttribute("saleSellerWeekList", saleSellerWeekList);
		System.out.println(saleSellerWeekList);

	}

	public void saleSellerMonthList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);

		if (id == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용해주세요.')");
			out.println("history.back()");
			out.println("</script>");
			out.flush();
		} else {
			SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
			List<OrderBean> saleSellerMonthList = dao.saleSellerMonthList(id);
			model.addAttribute("saleSellerMonthList", saleSellerMonthList);
			System.out.println(saleSellerMonthList);
		}
	}

	public void saleSellerProductCateList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);

		if (id == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용해주세요.')");
			out.println("history.back()");
			out.println("</script>");
			out.flush();
		} else {
			SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
			List<OrderBean> saleSellerProductList = dao.saleSellerProductList(id);
			List<OrderBean> saleSellerProductConfirmList = dao.saleSellerProductConfirmList(id);
			model.addAttribute("saleSellerProductList", saleSellerProductList);
			model.addAttribute("saleSellerProductConfirmList", saleSellerProductConfirmList);
		}
	}

	public void saleSellerProductListBest(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);

		if (id == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용해주세요.')");
			out.println("history.back()");
			out.println("</script>");
			out.flush();
		} else {
			SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
			List<OrderBean> saleSellerProductListBest = dao.saleSellerProductListBest(id);
			model.addAttribute("saleSellerProductListBest", saleSellerProductListBest);
			System.out.println(saleSellerProductListBest);
		}
	}

	public void saleSellerProductListWorst(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);

		if (id == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용해주세요.')");
			out.println("history.back()");
			out.println("</script>");
			out.flush();
		} else {
			SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
			List<OrderBean> saleSellerProductListWorst = dao.saleSellerProductListWorst(id);
			model.addAttribute("saleSellerProductListWorst", saleSellerProductListWorst);
			System.out.println(saleSellerProductListWorst);
		}
	}

	public void saleSellerInfo(HttpServletRequest request, HttpServletResponse response, OrderBean order, Model model)
			throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		String pcate = (String) request.getParameter("pcate");
		System.out.println("pate 값은 " + pcate);
		List<OrderBean> saleSellerInfo = dao.saleSellerInfo(id, pcate);
		List<OrderBean> saleSellerConfirmInfo = dao.saleSellerConfirmInfo(id, pcate);
		System.out.println("saleSellerInfo " + saleSellerInfo);
		System.out.println("saleSellerConfirmInfo" + saleSellerConfirmInfo);
		model.addAttribute("saleSellerInfo", saleSellerInfo);
		model.addAttribute("saleSellerConfirmInfo", saleSellerConfirmInfo);
	}
}