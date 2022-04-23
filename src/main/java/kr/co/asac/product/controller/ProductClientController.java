package kr.co.asac.product.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.asac.product.bean.ProductBean;
import kr.co.asac.product.service.ProductClientService;




@Controller

public class ProductClientController {
	@Autowired
	private ProductClientService productClientService;


	@RequestMapping(value = {

			"/pr/cl/li/{pcate}/{nowPage}",
			"/pr/cl/li/{pcate}/items/{items}/text/{text}/{nowPage}",	
			"/pr/cl/li/ptag/{ptag}/{nowPage}"
			})
	public String proList(HttpServletRequest request, Model model,
			@PathVariable(required = false) String pcate,	@PathVariable(required = false) String text,
			@PathVariable(required = false) String items,    @PathVariable(required = false) String ptag,	
			@PathVariable(required = false) String nowPage,	@PathVariable(required = false) String cntPerPage
			) throws Exception {
		
		model.addAttribute("pcate", pcate);

		productClientService.productClientList(model,pcate,text,items,ptag,nowPage,cntPerPage);
		if (ptag == null || ptag == "") {
		return "/product/productClientList";
	}else {
		return "/product/productTagList";
	}
	
	}
	
	
	
	
	@RequestMapping(value = { "/pr/cl/dt/{pcode}","/pr/cl/dt/{pcode}/{nowPage}","/pr/cl/dt/{pcode}/ptag/{ptag}/{nowPage}","/pr/cl/dt/{pcode}/{nowPage}/{reviewNowPage}",
			                  "/pr/cl/dt/{pcode}/items/{items}/text/{text}/{nowPage}/{reviewNowPage}","/pr/cl/dt/{pcode}/items/{items}/text/{text}/{nowPage}",
			                  "/pr/se/dt/{pcode}","/pr/se/dt/{pcode}/{reviewNowPage}" }

			)
	public String proListDetail(HttpServletRequest request,Model model, 
			@PathVariable(required = false) String pcode,	@PathVariable(required = false) String text,
			@PathVariable(required = false) String items,    @PathVariable(required = false) String ptag,	
			@PathVariable(required = false) String nowPage,  @PathVariable(required = false) String reviewNowPage
			) throws Exception {
		
	
		productClientService.productClientListDetail(request, model, pcode, text, items, ptag, nowPage, reviewNowPage);
		
	
		System.out.println("ptag:"+ptag);
		
		HttpSession session = request.getSession(); 
		String mid = (String)session.getAttribute("mid");
		String sid = (String)session.getAttribute("sid");
		String aid = (String)session.getAttribute("aid");
		
		if(sid != null) {
			return "/product/productSellerDetail";
			}
		else if(aid == "admin") {

			return "/product/productAdminDetail";
			}
		else {
			return "/product/productClientDetail";
		}
	}
	
	//Index TagList
	@RequestMapping(value = "/pr/cl/in", method = RequestMethod.POST)
	@ResponseBody
	public Map <String, Object> productClientIndexTag(Model model, 
			@RequestParam(value = "ptag", required = false, defaultValue="肄�") String ptag) {
	    List <ProductBean> productList = productClientService.productClientIndexTag(model, ptag);
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("productList", productList);
	    return map;
	}
}
