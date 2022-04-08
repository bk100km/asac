package kr.co.asac.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.dao.ProductDAO;
import kr.co.asac.review.bean.ReviewBean;
import kr.co.asac.review.dao.ReviewDAO;
import kr.co.asac.utils.PagingVO;
import kr.co.asac.utils.ReviewPagingVO;

@Service
public class ProductClientService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	
	public void productClientList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		String pcate = request.getParameter("pcate");
		String ptag = request.getParameter("ptag");
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		
		String text = request.getParameter("text");
		String items = request.getParameter("items");
		
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pcate",pcate);
		map.put("text",text);
		map.put("items",items);
		map.put("ptag",ptag);

		ProductDAO productDAO= sqlSessionTemplate.getMapper(ProductDAO.class);
		
		
		int total = productDAO.productListCount(map);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "6";
		}
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
	
		map.put("vo",vo);
		
		List<ProductBean> list = productDAO.productList(map);
		
		
		
		if (ptag == null || ptag == "") {
		
		
		model.addAttribute("proClientListlist", list);
		}else {
		model.addAttribute("proClientListlist",list);
		}
		
		
		
		
		
	    }	
	public void productClientListDetail(HttpServletRequest request, HttpServletResponse response, Model model, String pcode) throws Exception {
		
		
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		String reviewNowPage = request.getParameter("reviewNowPage");
		HttpSession session = request.getSession(); 
		
		
		String mid = (String)session.getAttribute("mid");

		System.out.println(mid);
		
		if(mid == null) {
			mid = request.getParameter("aid");
			System.out.println(mid);
			
		}
		
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		ProductBean proDetail = productDAO.productListDetail(pcode);
		
		ReviewDAO reviewDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);

		
		
		ArrayList<String> adminIdList = reviewDAO.reviewAdminCheck();
		
		boolean aid = adminIdList.contains(mid);
		
			if(aid) {
				
		    model.addAttribute("aid", mid);
		    System.out.print("aid는:"+aid);
		
		}
			
		
		int total = reviewDAO.reviewListCount(pcode);
		
		if (reviewNowPage == null && cntPerPage == null) {
			reviewNowPage = "1";
			cntPerPage = "5";
		} else if (reviewNowPage == null) {
			reviewNowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		ReviewPagingVO vo = new ReviewPagingVO(total, Integer.parseInt(reviewNowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pcode",pcode);
		map.put("vo",vo);
		
		
		List<ReviewBean> reviewList = reviewDAO.reviewList(map);
		
		List<ReviewBean> reviewAll = reviewDAO.reviewAll(map);
		
		double ratesum = 0;
		
		for (int i = 0; i < reviewAll.size(); i++) {
			
			
			ReviewBean colums =  reviewAll.get(i);
			System.out.println("colums"+colums);
			int colum = colums.getRrate();
			ratesum += colum;
	
			}
	
	
	    double average = ratesum / total;
	    String raverage = String.format("%.1f", average);
	     
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("proDetail", proDetail);
		model.addAttribute("mid", mid);
		model.addAttribute("totalreview", total);
		model.addAttribute("average", raverage);
	    }	
	
	// indexList
//	public void productClientIndexList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
//		
//		String pcate = request.getParameter("pcate");
//		String ptag = request.getParameter("ptag");
//		String nowPage = "1";
//		String cntPerPage = "6";
//		String text = request.getParameter("text");
//		String items = request.getParameter("items");
//		int total = 8;
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		model.addAttribute("paging", vo);
//		map.put("vo",vo);
//		
//		map.put("pcate",pcate);
//		map.put("text",text);
//		map.put("items",items);
//		map.put("ptag",ptag);
//
//		ProductDAO productDAO= sqlSessionTemplate.getMapper(ProductDAO.class);
//		List<ProductBean> list = productDAO.productList(map);
//		model.addAttribute("proClientListlist", list);
//	}
	}



