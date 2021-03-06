package kr.co.asac.review.controller;



import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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

	@RequestMapping(value = { "/re/cl/wr/{nowcode}/items/{items}/text/{text}/{nowPage}/{reviewNowPage}","/re/cl/wr/{nowcode}/{nowPage}/{reviewNowPage}"},  method = RequestMethod.POST)
	public String ReviewInsert (HttpServletRequest request,ReviewBean review, Model model,
			@PathVariable(required = false) String nowcode,	@PathVariable(required = false) String text,
			@PathVariable(required = false) String items,  @PathVariable(required = false) String nowPage,
			@PathVariable(required = false) String reviewNowPage) throws Exception {
	
		
		reviewClientService.reviewInsert(review); 
		

		
		
	
		

	
		if (text == null || text == "") {

		return	"redirect:/pr/cl/dt/"+ nowcode +"/"+nowPage +"/"+reviewNowPage;
		}else {	
		text = URLEncoder.encode(text, "UTF-8");
		return "redirect:/pr/cl/dt/"+ nowcode +"/items/"+items+"/text/"+text+"/"+nowPage+"/"+reviewNowPage;
	}
		
	}
	

	@RequestMapping(value = "/re/cl/sF", method = RequestMethod.POST)
	@ResponseBody
	public String memberAdminSellerFileUpload(HttpServletRequest request, Model model, 
			MultipartFile rfile) throws IOException {

		System.out.println("멀티파일 = " + rfile);
			System.out.println("패스" + request.getSession().getServletContext().getRealPath("product"));
			String fileName = rfile.getOriginalFilename();
			 System.out.println(fileName);
	        try {
	        	rfile.transferTo(new File(request.getSession().getServletContext().getRealPath("/resources/reviewUpload") + "/" +  fileName));
	        	
	        } catch(Exception e) {
	            System.out.println("업로드 오류");
	        }
	        System.out.println("업로드 완료");
	        System.out.println("업로드 파일경로 : " + request.getSession().getServletContext().getRealPath("/resources/reviewUpload"));
			System.out.println("업로드 파일이름 : " + fileName);
			System.out.println("업로드 파일크기 : " + rfile.getSize());
			
			return fileName;
		}	
	@RequestMapping(value = { "/re/cl/up/{nowcode}/items/{items}/text/{text}/{nowPage}/{reviewNowPage}","/re/cl/up/{nowcode}/{nowPage}/{reviewNowPage}"},  method = RequestMethod.POST)
	public String ReviewUpdate (HttpServletRequest request,ReviewBean review, Model model,
			@PathVariable(required = false) String nowcode,	@PathVariable(required = false) String text,
			@PathVariable(required = false) String items,  @PathVariable(required = false) String nowPage,
			@PathVariable(required = false) String reviewNowPage) throws Exception {
	
	
		
		reviewClientService.reviewUpdate(request, model, nowcode); 

		if (text == null || text == "") {
			System.out.println("여기야?1");
		return	"redirect:/pr/cl/dt/"+ nowcode +"/"+nowPage+"/"+reviewNowPage;
		}else {	
		return "redirect:/pr/cl/dt/"+ nowcode +"/items/"+items+"/text/"+text+"/"+nowPage+"/"+reviewNowPage;
	}
	}
	
	
	
	
	
}		

	

