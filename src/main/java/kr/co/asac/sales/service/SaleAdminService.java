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
public class SaleAdminService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void saleAdminDayList(HttpServletRequest request, HttpServletResponse response, Model model)	throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);

		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		List<OrderBean> saleAdminDayList = dao.saleAdminDayList();
		List<OrderBean> saleAdminDayConfirmList = dao.saleAdminDayConfirmList();
		model.addAttribute("saleAdminDayList", saleAdminDayList);
		model.addAttribute("saleAdminDayConfirmList", saleAdminDayConfirmList);
	}

//	public void saleAdminDateList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
//		String id = (String) request.getSession().getAttribute("sid");
//		System.out.println("AdminList Sid값 : " + id);
//		
//		if (id == null) {
//			response.setContentType("text/html;charset=utf-8");
//		   	PrintWriter out = response.getWriter();
//		   	out.println("<script>");
//		   	out.println("alert('로그인 후 이용해주세요.')");
//		   	out.println("history.back()");
//		   	out.println("</script>");
//		   	out.flush();
//		}
//		else {
//			SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
//			List<OrderBean> saleAdminDateList = dao.saleAdminDateList();
//			model.addAttribute("saleAdminDateList", saleAdminDateList);
//			System.out.println(saleAdminDateList);
//	    }
//	}
//	
//	public void saleAdminWeekList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
//		String id = (String) request.getSession().getAttribute("sid");
//		System.out.println("AdminList Sid값 : " + id);
//		
//		if (id == null) {
//			response.setContentType("text/html;charset=utf-8");
//		   	PrintWriter out = response.getWriter();
//		   	out.println("<script>");
//		   	out.println("alert('로그인 후 이용해주세요.')");
//		   	out.println("history.back()");
//		   	out.println("</script>");
//		   	out.flush();
//		}
//		else {
//			SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
//			List<OrderBean> saleAdminWeekList = dao.saleAdminWeekList();
//			model.addAttribute("saleAdminWeekList", saleAdminWeekList);
//			System.out.println(saleAdminWeekList);
//	    }
//	}

	public void saleAdminMonthList(HttpServletRequest request, HttpServletResponse response, Model model)
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
			List<OrderBean> saleAdminMonthList = dao.saleAdminMonthList();
			model.addAttribute("saleAdminMonthList", saleAdminMonthList);
			System.out.println(saleAdminMonthList);
		}
	}

	public void saleAdminSellerList(HttpServletRequest request, HttpServletResponse response, Model model)
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
			List<OrderBean> saleAdminSellerList = dao.saleAdminSellerList();
			model.addAttribute("saleAdminSellerList", saleAdminSellerList);
			System.out.println(saleAdminSellerList);
		}
	}

	public void saleAdminSellerListBest(HttpServletRequest request, HttpServletResponse response, Model model)
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
			List<OrderBean> saleAdminSellerListBest = dao.saleAdminSellerListBest();
			model.addAttribute("saleAdminSellerListBest", saleAdminSellerListBest);
			System.out.println(saleAdminSellerListBest);
		}
	}

//	public void saleAdminSellerListWorst(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws Exception {
//		String id = (String) request.getSession().getAttribute("sid");
//		System.out.println("AdminList Sid값 : " + id);
//
//		if (id == null) {
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('로그인 후 이용해주세요.')");
//			out.println("history.back()");
//			out.println("</script>");
//			out.flush();
//		} else {
//			SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
//			List<OrderBean> saleAdminSellerListWorst = dao.saleAdminSellerListWorst();
//			model.addAttribute("saleAdminSellerListWorst", saleAdminSellerListWorst);
//			System.out.println(saleAdminSellerListWorst);
//		}
//	}

	public void saleAdminProductCateList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);

		
			SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
			List<OrderBean> saleAdminProductCateList = dao.saleAdminProductCateList();
			List<OrderBean> saleAdminProductCateConfirmList = dao.saleAdminProductCateConfirmList();
			model.addAttribute("saleAdminProductCateList", saleAdminProductCateList);
			model.addAttribute("saleAdminProductCateConfirmList", saleAdminProductCateConfirmList);
			System.out.println(saleAdminProductCateList);
		
	}

	public void saleAdminProductListBest(HttpServletRequest request, HttpServletResponse response, Model model)
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
			List<OrderBean> saleAdminProductListBest = dao.saleAdminProductListBest();
			model.addAttribute("saleAdminProductListBest", saleAdminProductListBest);
			System.out.println(saleAdminProductListBest);
		}
	}

//	public void saleAdminProductListWorst(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws Exception {
//		String id = (String) request.getSession().getAttribute("sid");
//		System.out.println("AdminList Sid값 : " + id);
//
//		if (id == null) {
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('로그인 후 이용해주세요.')");
//			out.println("history.back()");
//			out.println("</script>");
//			out.flush();
//		} else {
//			SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
//			List<OrderBean> saleAdminProductListWorst = dao.saleAdminProductListWorst();
//			model.addAttribute("saleAdminProductListWorst", saleAdminProductListWorst);
//			System.out.println(saleAdminProductListWorst);
//		}
//	}

	public void saleSellerAdDayList(HttpServletRequest request, HttpServletResponse response, Model model)
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
			List<OrderBean> saleSellerAdDayList = dao.saleSellerDayList(id);
			model.addAttribute("saleSellerAdDayList", saleSellerAdDayList);
			System.out.println(saleSellerAdDayList);
		}
	}

	public void saleSellerAdDateList(HttpServletRequest request, HttpServletResponse response, Model model)
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
			List<OrderBean> saleSellerAdDateList = dao.saleSellerDateList(id);
			model.addAttribute("saleSellerAdDateList", saleSellerAdDateList);
			System.out.println(saleSellerAdDateList);
		}
	}

	public void saleSellerAdWeekList(HttpServletRequest request, HttpServletResponse response, Model model)
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
			List<OrderBean> saleSellerAdWeekList = dao.saleSellerWeekList(id);
			model.addAttribute("saleSellerAdWeekList", saleSellerAdWeekList);
			System.out.println(saleSellerAdWeekList);
		}
	}

	public void saleSellerAdMonthList(HttpServletRequest request, HttpServletResponse response, Model model)
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
			List<OrderBean> saleSellerAdMonthList = dao.saleSellerMonthList(id);
			model.addAttribute("saleSellerAdMonthList", saleSellerAdMonthList);
			System.out.println(saleSellerAdMonthList);
		}
	}

	public void saleSellerAdProductCateList(HttpServletRequest request, HttpServletResponse response, Model model)
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
			List<OrderBean> saleSellerAdProductList = dao.saleSellerProductList(id);
			model.addAttribute("saleSellerAdProductList", saleSellerAdProductList);
			System.out.println(saleSellerAdProductList);
		}
	}

	public void saleSellerAdProductListBest(HttpServletRequest request, HttpServletResponse response, Model model)
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
			List<OrderBean> saleSellerAdProductListBest = dao.saleSellerProductListBest(id);
			model.addAttribute("saleSellerAdProductListBest", saleSellerAdProductListBest);
			System.out.println(saleSellerAdProductListBest);
		}
	}

	public void saleSellerAdProductListWorst(HttpServletRequest request, HttpServletResponse response, Model model)
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
			List<OrderBean> saleSellerAdProductListWorst = dao.saleSellerProductListWorst(id);
			model.addAttribute("saleSellerAdProductListWorst", saleSellerAdProductListWorst);
			System.out.println(saleSellerAdProductListWorst);
		}
	}

	public void saleAdminInfo(HttpServletRequest request, HttpServletResponse response, OrderBean order, Model model)
			throws Exception {
		String id = (String) request.getSession().getAttribute("sid");
		System.out.println("AdminList Sid값 : " + id);
		SaleDAO dao = sqlSessionTemplate.getMapper(SaleDAO.class);
		String pcate = (String) request.getParameter("pcate");
		System.out.println("pate 값은 " + pcate);
		List<OrderBean> saleAdminInfo = dao.saleAdminInfo(pcate);
		List<OrderBean> saleAdminConfirmInfo = dao.saleAdminConfirmInfo(pcate);
		System.out.println("saleAdminInfo " + saleAdminInfo);
		System.out.println("saleAdminConfirmInfo " + saleAdminConfirmInfo);
		model.addAttribute("saleAdminInfo", saleAdminInfo);
		model.addAttribute("saleAdminConfirmInfo", saleAdminConfirmInfo);
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