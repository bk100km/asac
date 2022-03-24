package kr.co.asac.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		
		String text = request.getParameter("text");
		String items = request.getParameter("items");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pcate",pcate);
		map.put("text",text);
		map.put("items",items);
		

		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		
		int total = productDAO.productListCount(map);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
	
		map.put("vo",vo);
		
	
		
		
		
		List<ProductBean> list = productDAO.productList(map);
		System.out.println(map);
		model.addAttribute("list", list);

		
		
		
		
		
	    }	
	public void productClientListDetail(HttpServletRequest request, HttpServletResponse response, Model model, String pcode) throws Exception {
		
		
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");
		
		String reviewNowPage = request.getParameter("reviewNowPage");
	
		
		
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		ProductBean proDetail = productDAO.productListDetail(pcode);
		
		ReviewDAO reviewDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		
		
		

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
		
		System.out.println(vo);
	
		System.out.println("테스트중");
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("proDetail", proDetail);
		
	    }	
	}



