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
public class ProductAdminController {

	@Autowired
	private ProductSellerService productSellerService;

	@Autowired
	private ProductAdminService productAdminService;
	
	@RequestMapping("/pr/ad/ls")
	public String productSellerList(HttpServletRequest request, HttpServletResponse response, Model model, ProductBean product, @RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false, defaultValue = "1") int range, @RequestParam(required = false) String searchType, @RequestParam(required = false) String keyword,
			@ModelAttribute("searchSe") Search search) throws Exception {
		
		model.addAttribute("searchSe", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		String id = (String) request.getSession().getAttribute("sid");
		int listCnt = productSellerService.productSellerCount(request, id, search);
		
		search.pageInfo(page, range, listCnt);
		model.addAttribute("productPagingSe", search);
		
		productSellerService.productSellerList(request, response, model, search);
		
		return "product/productAdminListMy";
	}
	
	
	@RequestMapping("/pr/ad/la")
	public String productAdminList(HttpServletRequest request, HttpServletResponse response, Model model, ProductBean product, @RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false, defaultValue = "1") int range, @RequestParam(required = false) String searchType, @RequestParam(required = false) String keyword,
			@ModelAttribute("searchSe") Search searchSe, @ModelAttribute("searchAd") Search searchAd) throws Exception {
		model.addAttribute("searchAd", searchAd);
		searchAd.setSearchType(searchType);
		System.out.println("searchType값은 = " + searchType);
		searchAd.setKeyword(keyword);
		System.out.println("keyword값은 = " + keyword);
		int listCntAd = productAdminService.productAdminCount(searchAd);
		System.out.println("listCnt 값은 = " + listCntAd);
		
		searchAd.pageInfo(page, range, listCntAd);
		System.out.println("search값은 =" + searchAd);
		model.addAttribute("productPagingAd", searchAd);
		
		productAdminService.productAdminList(request, response, model, searchAd);
		return "product/productAdminList";
	}

	@RequestMapping("/pr/ad/if")
	public String productAdminInfo(Model model, @RequestParam String pcode, ProductBean product) {
		ProductBean info = productAdminService.productAdminInfo(product, pcode);
		model.addAttribute("productAdminInfo", info);
		System.out.println("최고관리자 info : " + info);
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
		return "redirect:/pr/ad/la";	
	}

	@RequestMapping(value = "/pr/ad/up", method = RequestMethod.GET)
	public String ProductAdminUpdate(@RequestParam String pcode, ProductBean product, Model model) throws Exception{
		ProductBean info = productAdminService.productAdminInfo(product, pcode);
		model.addAttribute("productAdminUpdate", info);
		System.out.println("Update중.22.");
		return "product/productAdminUpdateForm";
	}
	
	@RequestMapping(value ="/pr/ad/up", method = RequestMethod.POST)
	public String ProductAdminUpdate(ProductBean product) throws Exception {
		productAdminService.productAdminUpdate(product);
		System.out.println("Update중..");
		return "redirect:/pr/ad/la";
	}
	
	@RequestMapping("pr/ad/de")
	public String productAdminDelete(@RequestParam String pcode) {
		productAdminService.productAdminDelete(pcode);
		return "redirect:/pr/ad/la";
	}
}