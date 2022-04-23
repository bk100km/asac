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

import kr.co.asac.product.bean.PagingBean;
import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.service.ProductSellerService;
import kr.co.asac.utils.Search;

@Controller
public class ProductSellerController {

	@Autowired
	private ProductSellerService productSellerService;
		
	@RequestMapping(value = "/pr/se/li", method = RequestMethod.GET)
	public String productSellerList(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value="productSearchCategory", required = false, defaultValue = "pcode") String productSearchCategory,
			@RequestParam(value="productSearchText", required = false, defaultValue = "") String productSearchText,
			@ModelAttribute(value = "productPaging") PagingBean productPaging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int productListCnt = productSellerService.productSellerListCount(request, productSearchCategory, productSearchText);
		productPaging.pageInfo(page, range, productListCnt);
		
		productSellerService.productSellerList(request, response, model, productPaging);
		
		return "product/productSellerPage";
	}
	
	@RequestMapping(value = "/pr/se/sl", method = RequestMethod.POST)
	@ResponseBody
	public Map <String, Object> productSellerListSearch(HttpServletRequest request, Model model, 
			@RequestParam(value = "productSearchCategory", required = false, defaultValue="pcode") String productSearchCategory,
			@RequestParam(value = "productSearchText", required = false, defaultValue="") String productSearchText,
			@ModelAttribute(value = "paging") PagingBean paging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int listCnt = productSellerService.productSellerListCount(request, productSearchCategory, productSearchText);

		paging.pageInfo(page, range, listCnt);
		
		List <ProductBean> productList = productSellerService.productSellerListSearch(request, model, productSearchCategory, productSearchText, paging);
		
	    Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("paging", paging);
		map.put("productList", productList);
	    return map;
	}
	
	@RequestMapping(value = "/pr/se/if", method = RequestMethod.POST)
	@ResponseBody
	public ProductBean productSellerInfo(Model model, @RequestParam("pcode") String pcode) {
		ProductBean product = productSellerService.productSellerInfo(model, pcode);
		return product;
	}
	
	@RequestMapping(value = "/pr/se/in", method = RequestMethod.POST)
	@ResponseBody
	public void productSellerInsert(HttpServletRequest request, HttpServletResponse response, Model model, 
			ProductBean product) throws Exception {
		
		productSellerService.productSellerInsert(request, model, response, product);
	}
	
	@RequestMapping(value = "/pr/se/up", method = RequestMethod.POST)
	@ResponseBody
	public void productSellerUpdate(HttpServletRequest request, HttpServletResponse response, Model model, ProductBean product, Search productSearch) throws Exception {
		productSellerService.productSellerUpdate(request, model, response, product);
	}
		
	@RequestMapping(value = "pr/se/de/pcode/{pcode}", method = RequestMethod.POST)
	@ResponseBody
	public void productSellerDelete(HttpServletRequest request, HttpServletResponse response, Model model, @PathVariable("pcode") String pcode) throws Exception {
		productSellerService.productSellerDelete(request, model, response, pcode);
	}

	@RequestMapping(value = "/pr/se/fu", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String productSellerFileUpload(HttpServletRequest request, Model model, 
			MultipartFile pfileUpload) throws IOException {
		
//		String filePath = request.getSession().getServletContext().getRealPath("upload");
		String fileName = pfileUpload.getOriginalFilename();
	
        try {
        	pfileUpload.transferTo(new File("C:\\asac\\asac\\src\\main\\webapp\\resources\\productUpload\\" + fileName));
        } catch(Exception e) {

        }
		
		return fileName;
	}
	
}