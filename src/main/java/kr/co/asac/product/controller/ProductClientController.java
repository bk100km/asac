package kr.co.asac.product.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.asac.product.service.ProductClientService;




@Controller

public class ProductClientController {
	@Autowired
	private ProductClientService productClientService;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입

	@RequestMapping(value = "/pr/cl/li",  method = RequestMethod.GET)
	public String proList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
	
		
		
		productClientService.productClientList(request, response, model);
	
		return "/product/productClientList";
	}
	
	
	@RequestMapping(value = "/pr/cl/dt",  method = RequestMethod.GET)
	public String proListDetail(HttpServletRequest request, HttpServletResponse response, Model model, String pcode) throws Exception {
		
		
		productClientService.productClientListDetail(request, response, model, pcode);
		
	
		return "/product/productClientDetail";
	}
	
	

	
	
	
}
