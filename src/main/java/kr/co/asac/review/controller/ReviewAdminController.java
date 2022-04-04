package kr.co.asac.review.controller;



import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.service.ProductClientService;
import kr.co.asac.review.bean.ReviewBean;
import kr.co.asac.review.service.ReviewClientService;




@Controller

public class ReviewAdminController {
	@Autowired
	private ReviewClientService reviewClientService;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입

	@RequestMapping(value = "/re/ad/wr",  method = RequestMethod.POST)
	public String ReviewUpdate (HttpServletRequest request,ReviewBean review, Model model) throws Exception {
	
	
		System.out.println("안나와?");
		
		reviewClientService.reviewInsert(review); 
		

		
		HttpSession session = request.getSession(); 
		String mid = (String)session.getAttribute("mid");
		String pcode =request.getParameter("pcode");
		String pcate =request.getParameter("pcate");
		
		model.addAttribute("pcate", pcate);
		model.addAttribute("pcode", pcode);
		model.addAttribute("mid", mid);
	
		return "redirect:/pr/cl/dt?";
	}

	
	
}		

	

