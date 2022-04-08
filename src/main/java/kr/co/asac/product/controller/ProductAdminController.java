package kr.co.asac.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.asac.member.bean.PagingBean;
import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.service.ProductAdminService;
import kr.co.asac.product.service.ProductSellerService;

@Controller
public class ProductAdminController {
	
	@Autowired
	private ProductSellerService productSellerService;
	@Autowired
	private ProductAdminService productAdminService;
	
	@RequestMapping(value = "/pr/ad/if", method = RequestMethod.POST)
	@ResponseBody
	public ProductBean productAdminInfo(Model model, String pcode) {
	    ProductBean product = productAdminService.productAdminInfo(model, pcode);
	    return product;
	}
	
	@RequestMapping(value = "/pr/ad/li", method = RequestMethod.GET)
	public String productAdminList(Model model,
			@RequestParam(value="productSearchCategory", required = false, defaultValue = "pcode") String productSearchCategory,
			@RequestParam(value="productSearchText", required = false, defaultValue = "") String productSearchText,
			@ModelAttribute(value = "productPaging") PagingBean productPaging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int productListCnt = productAdminService.productAdminCount(productSearchCategory, productSearchText);
		productPaging.pageInfo(page, range, productListCnt);
		System.out.println("컨트롤러에서 productPaging 값은 = " + productPaging);
		productAdminService.productAdminList(model, productPaging);
		return "product/productAdminListTab";
	}
	
	@RequestMapping(value = "/pr/ad/up", method = RequestMethod.POST)
	@ResponseBody
	public void productAdminUpdate(HttpServletRequest request, HttpServletResponse response, Model model, 
			ProductBean product) throws Exception {
		
		productAdminService.productAdminUpdate(request, model, response, product);
	}	
	
	@RequestMapping(value = "/pr/ad/de/pcode/{pcode}", method = RequestMethod.POST)
	@ResponseBody
	public void productAdminDelete(HttpServletRequest request, HttpServletResponse response, Model model, 
			@PathVariable("pcode") String pcode) throws Exception {
		
		productAdminService.productAdminDelete(request, model, response, pcode);
	}		
	
	@RequestMapping(value = "/pr/ad/in", method = RequestMethod.POST)
	@ResponseBody
	public void productAdminInsert(HttpServletRequest request, HttpServletResponse response, Model model, 
			ProductBean product) throws Exception {
		
		productAdminService.productAdminInsert(request, model, response, product);
	}
	
	@RequestMapping(value = "/pr/ad/se", method = RequestMethod.POST)
	@ResponseBody
	public Map <String, Object> productAdminSearch(HttpServletRequest request, Model model, 
			@RequestParam(value="productSearchCategory") String searchCategory, 
			@RequestParam(value = "productSearchText", required = false) String searchText,
			@ModelAttribute(value = "paging") PagingBean paging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		int listCnt = productAdminService.productAdminCount(searchCategory, searchText);
		paging.pageInfo(page, range, listCnt);
		System.out.println("컨트롤러에서 paging 값은 = " + paging);
		
		List <ProductBean> productList;
	    productList = productAdminService.productAdminSearch(request, model, searchCategory, searchText, paging);
	    productAdminService.productAdminList(model, paging);
	    
	    Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("productList", productList);
	    return map;
	}
	
		
	@RequestMapping(value = "/pr/ad/fu", method = RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String productAdminFileUpload(HttpServletRequest request, Model model, 
			MultipartFile pfileUpload) throws IOException {
		String fileName = new String(pfileUpload.getOriginalFilename().getBytes("utf-8"), "utf-8");
		try {
			pfileUpload.transferTo(new File("C:\\asac\\asac\\src\\main\\webapp\\resources\\image\\product\\" + fileName));
        } catch(Exception e) {
        }
		return fileName;
	}
	
//adminMy
	
	@RequestMapping(value = "/pr/ad/aif", method = RequestMethod.POST)
	@ResponseBody
	public ProductBean productAdminMyInfo(Model model, String pcode) {
	    ProductBean product = productAdminService.productAdminMyInfo(model, pcode);
	    return product;
	}
	
	@RequestMapping(value = "/pr/ad/ali", method = RequestMethod.GET)
	public String productAdminMyList(Model model,
			@RequestParam(value="productMySearchCategory", required = false, defaultValue = "pcode") String productMySearchCategory,
			@RequestParam(value="productMySearchText", required = false, defaultValue = "") String productMySearchText,
			@ModelAttribute(value = "productMyPaging") PagingBean productMyPaging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int productMyListCnt = productAdminService.productAdminMyCount(productMySearchCategory, productMySearchText);
		productMyPaging.pageInfo(page, range, productMyListCnt);
		System.out.println("컨트롤러에서 productPaging 값은 = " + productMyPaging);
		productAdminService.productAdminMyList(model, productMyPaging);
		return "product/productAdminListTab";
	}
	
	@RequestMapping(value = "/pr/ad/aup", method = RequestMethod.POST)
	@ResponseBody
	public void productAdminMyUpdate(HttpServletRequest request, HttpServletResponse response, Model model, 
			ProductBean product) throws Exception {
		
		productAdminService.productAdminMyUpdate(request, model, response, product);
	}	
	
	@RequestMapping(value = "/pr/ad/ade/pcode/{pcode}", method = RequestMethod.POST)
	@ResponseBody
	public void productAdminMyDelete(HttpServletRequest request, HttpServletResponse response, Model model, 
			@PathVariable("pcode") String pcode) throws Exception {
		
		productAdminService.productAdminMyDelete(request, model, response, pcode);
	}		
	
	@RequestMapping(value = "/pr/ad/ain", method = RequestMethod.POST)
	@ResponseBody
	public void productAdminMyInsert(HttpServletRequest request, HttpServletResponse response, Model model, 
			ProductBean product) throws Exception {
		
		productAdminService.productAdminMyInsert(request, model, response, product);
	}
	
	@RequestMapping(value = "/pr/ad/ase", method = RequestMethod.POST)
	@ResponseBody
	public Map <String, Object> productAdminMySearch(HttpServletRequest request, Model model, 
			@RequestParam(value="productMySearchCategory") String productMySearchCategory, 
			@RequestParam(value = "productMySearchText", required = false) String productMySearchText,
			@ModelAttribute(value = "paging") PagingBean paging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		int listCnt = productAdminService.productAdminMyCount(productMySearchCategory, productMySearchText);
		paging.pageInfo(page, range, listCnt);
		System.out.println("컨트롤러에서 paging 값은 = " + paging);
		
		List <ProductBean> productMyList;
	    productMyList = productAdminService.productAdminMySearch(request, model, productMySearchCategory, productMySearchText, paging);
	    productAdminService.productAdminMyList(model, paging);
	    
	    Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("productMyList", productMyList);
	    return map;
	}
	
		
	@RequestMapping(value = "/pr/ad/afu", method = RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String productAdminMyFileUpload(HttpServletRequest request, Model model, 
			MultipartFile pfileUpload) throws IOException {
		String fileName = new String(pfileUpload.getOriginalFilename().getBytes("utf-8"), "utf-8");
		try {
			pfileUpload.transferTo(new File("C:\\asac\\asac\\src\\main\\webapp\\resources\\image\\product\\" + fileName));
        } catch(Exception e) {
        }
		return fileName;
	}
}
