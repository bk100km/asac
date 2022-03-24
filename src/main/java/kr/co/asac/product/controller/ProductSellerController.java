package kr.co.asac.product.controller;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.dao.ProductDAO;
import kr.co.asac.product.service.ProductSellerService;

@Controller
public class ProductSellerController {
	
	@Autowired
	private ProductSellerService productSellerService;
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
		
	@RequestMapping("/pr/se/li")
	public String getProducsellertList(Model model) {
		ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class);
		List<ProductBean> producsellerlist = dao.productadminlist();
		model.addAttribute("productList", producsellerlist);
		return "product/productSellerList";
	}
		
	@RequestMapping(value = "/pr/se/in", method = RequestMethod.POST)
	public String productsellerInsert(ProductBean product) {
		ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class);
		int n = dao.productsellerinsert(product);
		return "redirect:/product/productSellerList";
	}
	
	@RequestMapping("/pr/se/up")
	public String productSellerUpdate(Model model, ProductBean product) {
		ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class);
		int n = dao.productsellerupdate(product);
		model.addAttribute("pcode", product.getPcode());
		return "redirect:/product/productSellerInfo";
	}

	@RequestMapping("/pr/se/de")
	public String productSellerDelete(@RequestParam String pcode) {
		ProductDAO dao = sqlSessionTemplate.getMapper(ProductDAO.class);
		int n = dao.productsellerdelete(pcode);
		return "redirect:/product/productSellerList";
	}
}
