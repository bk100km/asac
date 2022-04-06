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


import kr.co.asac.review.bean.ReviewBean;
import kr.co.asac.review.service.ReviewClientService;




@Controller

public class ReviewClientController {
	@Autowired
	private ReviewClientService reviewClientService;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입

	@RequestMapping(value = "/re/cl/wr",  method = RequestMethod.POST)
	public String ReviewInsert (HttpServletRequest request,ReviewBean review, Model model) throws Exception {
	
	
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

	@RequestMapping(value = "/re/cl/sF", method = RequestMethod.POST)
	@ResponseBody
	public String memberAdminSellerFileUpload(HttpServletRequest request, Model model, 
			MultipartFile rfile) throws IOException {

		System.out.println("멀티파일 = " + rfile);
		 System.out.println("어서오세요");
			System.out.println("패스" + request.getSession().getServletContext().getRealPath("product"));
			String filePath = request.getSession().getServletContext().getRealPath("product");
			String fileName = rfile.getOriginalFilename();
			 System.out.println(fileName);
	        try {
	        	rfile.transferTo(new File("C:\\swork\\asac5\\src\\main\\webapp\\resources\\image\\product\\" + fileName));
	        } catch(Exception e) {
	            System.out.println("업로드 오류");
	        }
	        System.out.println("업로드 완료");
	        System.out.println("업로드 파일경로 : " + filePath);
			System.out.println("업로드 파일이름 : " + fileName);
			System.out.println("업로드 파일크기 : " + rfile.getSize());
			
			return fileName;
		}	
	@RequestMapping(value = "/re/cl/up",  method = RequestMethod.POST)
	public String ReviewUpdate (HttpServletRequest request, Model model) throws Exception {
	
	
		
		reviewClientService.reviewUpdate(request); 
		

		
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

	

