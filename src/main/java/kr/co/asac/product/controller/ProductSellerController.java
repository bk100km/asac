package kr.co.asac.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.service.ProductAdminService;
import kr.co.asac.product.service.ProductSellerService;
import kr.co.asac.utils.Search;

@Controller
public class ProductSellerController {

	@Autowired
	private ProductSellerService productSellerService;

	@Autowired
	private ProductAdminService productAdminService;
	
	@RequestMapping("/pr/se/la")
	public String productSellerList(HttpServletRequest request, HttpServletResponse response, Model model, ProductBean product, @RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false, defaultValue = "1") int range, @RequestParam(required = false) String searchType, @RequestParam(required = false) String keyword,
			@ModelAttribute("searchSe") Search search) throws Exception {
		
		model.addAttribute("searchSe", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		String id = (String) request.getSession().getAttribute("sid");
		int listCnt = productSellerService.productSellerCount(request, id, search);
		System.out.println("listCnt??" + listCnt);
		
		search.pageInfo(page, range, listCnt);
		model.addAttribute("productPagingSe", search);
		
		productSellerService.productSellerList(request, response, model, search);
		
		return "product/productSellerList";
	}

	@RequestMapping("/pr/se/if")
	public String productSellerInfo(Model model, @RequestParam String pcode, ProductBean product) {
		ProductBean info = productSellerService.productSellerInfo(product, pcode);
		model.addAttribute("productSellerInfo", info);
		System.out.println("중간관리자 info : " + info);
		return "product/productSellerInfo";
	}
	
	@RequestMapping(value = "pr/se/in", method = RequestMethod.GET)
	public String ProductSellerInsert() {
		System.out.println("인서트 폼으로 감");
		return "product/productSellerInsertForm";		
	}
	
	@RequestMapping(value = "pr/se/in", method = RequestMethod.POST)
	public String ProductSellerInsert(ProductBean product) {
		System.out.println(product);
		productSellerService.productSellerInsert(product);
		System.out.println("인서트 데이터 받아옴");
		return "redirect:/pr/se/la";	
	}

	@RequestMapping(value = "/pr/se/up", method = RequestMethod.GET)
	public String ProductSellerUpdate(@RequestParam String pcode, ProductBean product, Model model) throws Exception{
		ProductBean info = productSellerService.productSellerInfo(product, pcode);
		model.addAttribute("productSellerUpdate", info);
		System.out.println("Update중.22.");
		return "product/productSellerUpdateForm";
	}
	
	@RequestMapping(value ="/pr/se/up", method = RequestMethod.POST)
	public String ProductSellerUpdate(ProductBean product) throws Exception {
		productSellerService.productSellerUpdate(product);
		System.out.println("Update중..");
		return "redirect:/pr/se/la";
	}
	
	@RequestMapping("pr/se/de")
	public String productSellerDelete(@RequestParam String pcode) {
		productSellerService.productSellerDelete(pcode);
		return "redirect:/pr/se/la";
	}
}