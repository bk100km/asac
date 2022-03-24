package kr.co.asac.product.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.dao.ProductDAO;
import kr.co.asac.product.service.ProductAdminService;

@Controller
public class ProductAdminController {
	
	@Autowired
	private ProductAdminService productAdminService;
	
//	@Autowired
//	private ProductSellerService productSellerService;
//	
//	@Autowired
//	private SqlSessionTemplate sqlSessionTemplate;
	
	// admin
	
	@RequestMapping(value = "/pr/ad/li", method = RequestMethod.GET)
	public String productAdminList(Model model) {
		productAdminService.productAdminList(model);
		return "product/productAdminList";
	}
		
	@RequestMapping(value = "/pr/ad/if", method = RequestMethod.GET)
	public String productAdminInfo(Model model, String pcode) throws Exception {		
		productAdminService.productAdminInfo(model, pcode);
		return "product/productAdminInfo";
	}		
	
	@RequestMapping(value = "pr/ad/in", method = RequestMethod.GET)
	public String ProductAdminInsert() {
		System.out.println("인서트 폼으로 감");
		return "product/productAdminInsertForm";		
	}
	
	@RequestMapping(value = "pr/ad/in", method = RequestMethod.POST)
	public String ProductAdminInsert(ProductBean product) {
		System.out.println(product);
		productAdminService.productAdminInsert(product);
		System.out.println("인서트 데이터 받아옴");
		return "product/productAdminList";		
	}

	@RequestMapping(value = "/pr/ad/up", method = RequestMethod.GET)
	public String ProductAdminUpdate(@RequestParam String pcode, ProductBean product, Model model) throws Exception{
		ProductBean info = productAdminService.productAdminInfo(model, pcode);
		model.addAttribute("productAdminUpdate", info);
		return "product/productAdminUpdateForm";
	}
	
	@RequestMapping(value ="/pr/ad/up", method = RequestMethod.POST)
	public String ProductAdminUpdate(ProductBean product) throws Exception {
		productAdminService.productAdminUpdate(product);
		System.out.println("Update중..");
		return "redirect:/pr/ad/li";
	}
	
	@RequestMapping("pr/ad/de")
	public String ProductAdminDelete(@RequestParam String pcode) {
		productAdminService.productAdminDelete(pcode);
		return "redirect:/pr/ad/li";
	}
		
}	
