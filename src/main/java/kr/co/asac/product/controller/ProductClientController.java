package kr.co.asac.product.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입

	@RequestMapping(value = {
			//카테고리 선택
			"/pr/cl/li/{pcate}/{nowPage}",
			//검색했을때
			
			//검색하고 페이지 이동
			"/pr/cl/li/{pcate}/items/{items}/text/{text}/{nowPage}",	
			//카테고리에서 페이지 이동

			//ptag리스트
			"/pr/cl/li/ptag/{ptag}/{nowPage}"
			//ptag리스트 페이지 이동
			
			//4
			
			//=--------여기서부터는 상세페이지
			//검색하지 않고 들어와서 상세페이지 볼때 
			
			//검색하고 들어와서 상세피이지 볼떼
			
			//검색하고 페이지번호누르고 상세페이지
			
			//페이지 번호 누르고 상세페이지 볼때 
			
			//X3   12 
			
			//asac/pr/cl/dt?pcode=${param.pcode}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}&reviewNowPage=${p}&cntPerPage=${paging.cntPerPage}&aid=${aid}
			})
	public String proList(HttpServletRequest request, Model model,
			@PathVariable(required = false) String pcate,	@PathVariable(required = false) String text,
			@PathVariable(required = false) String items,    @PathVariable(required = false) String ptag,	
			@PathVariable(required = false) String nowPage,	@PathVariable(required = false) String cntPerPage
			) throws Exception {
		
		model.addAttribute("pcate", pcate);
		System.out.println("컨트롤러에서 값 = " + text);
		productClientService.productClientList(model,pcate,text,items,ptag,nowPage,cntPerPage);
		if (ptag == null || ptag == "") {
		return "/product/productClientList";
	}else {
		return "/product/productTagList";
	}
	
	}
	
	
	
	
	@RequestMapping(value = { "/pr/cl/dt/{pcode}/{nowPage}","/pr/cl/dt/{pcode}/ptag/{ptag}/{nowPage}","/pr/cl/dt/{pcode}/{nowPage}/{reviewNowPage}",
			                  "/pr/cl/dt/{pcode}/items/{items}/text/{text}/{nowPage}/{reviewNowPage}","/pr/cl/dt/{pcode}/items/{items}/text/{text}/{nowPage}" }

			)
	public String proListDetail(HttpServletRequest request,Model model, 
			@PathVariable(required = false) String pcode,	@PathVariable(required = false) String text,
			@PathVariable(required = false) String items,    @PathVariable(required = false) String ptag,	
			@PathVariable(required = false) String nowPage,  @PathVariable(required = false) String reviewNowPage
			) throws Exception {
		
		
		productClientService.productClientListDetail(request, model, pcode, text, items, ptag, nowPage, reviewNowPage);
		
	
		System.out.println("ptag:"+ptag);
		
		
	
		return "/product/productClientDetail";
	}
	
	//Index TagList
	@RequestMapping(value = "/pr/cl/in", method = RequestMethod.POST)
	@ResponseBody
	public Map <String, Object> productClientIndexTag(Model model, 
			@RequestParam(value = "ptag", required = false, defaultValue="콩") String ptag) {
	    List <ProductBean> productList = productClientService.productClientIndexTag(model, ptag);
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("productList", productList);
	    return map;
	}
}
