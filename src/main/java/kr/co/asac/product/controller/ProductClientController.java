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
	// �꽕�젙�뙆�씪�뿉 鍮덉쑝濡� �벑濡앸릺�뿀湲� �븣臾몄뿉 �깮�꽦�옄�굹 Setter �뾾�씠 �옄�룞�쑝濡� 二쇱엯

	@RequestMapping(value = {
			//移댄뀒怨좊━ �꽑�깮
			"/pr/cl/li/{pcate}/{nowPage}",
			//寃��깋�뻽�쓣�븣
			
			//寃��깋�븯怨� �럹�씠吏� �씠�룞
			"/pr/cl/li/{pcate}/items/{items}/text/{text}/{nowPage}",	
			//移댄뀒怨좊━�뿉�꽌 �럹�씠吏� �씠�룞

			//ptag由ъ뒪�듃
			"/pr/cl/li/ptag/{ptag}/{nowPage}"
			//ptag由ъ뒪�듃 �럹�씠吏� �씠�룞
			
			//4
			
			//=--------�뿬湲곗꽌遺��꽣�뒗 �긽�꽭�럹�씠吏�
			//寃��깋�븯吏� �븡怨� �뱾�뼱���꽌 �긽�꽭�럹�씠吏� 蹂쇰븣 
			
			//寃��깋�븯怨� �뱾�뼱���꽌 �긽�꽭�뵾�씠吏� 蹂쇰뼹
			
			//寃��깋�븯怨� �럹�씠吏�踰덊샇�늻瑜닿퀬 �긽�꽭�럹�씠吏�
			
			//�럹�씠吏� 踰덊샇 �늻瑜닿퀬 �긽�꽭�럹�씠吏� 蹂쇰븣 
			
			//X3   12 
			
			//asac/pr/cl/dt?pcode=${param.pcode}&items=${param.items}&text=${param.text}&nowPage=${param.nowPage}&reviewNowPage=${p}&cntPerPage=${paging.cntPerPage}&aid=${aid}
			})
	public String proList(HttpServletRequest request, Model model,
			@PathVariable(required = false) String pcate,	@PathVariable(required = false) String text,
			@PathVariable(required = false) String items,    @PathVariable(required = false) String ptag,	
			@PathVariable(required = false) String nowPage,	@PathVariable(required = false) String cntPerPage
			) throws Exception {
		
		model.addAttribute("pcate", pcate);
		System.out.println("而⑦듃濡ㅻ윭�뿉�꽌 媛� = " + text);
		productClientService.productClientList(model,pcate,text,items,ptag,nowPage,cntPerPage);
		if (ptag == null || ptag == "") {
		return "/product/productClientList";
	}else {
		return "/product/productTagList";
	}
	
	}
	
	
	
	
	@RequestMapping(value = { "/pr/cl/dt/{pcode}","/pr/cl/dt/{pcode}/{nowPage}","/pr/cl/dt/{pcode}/ptag/{ptag}/{nowPage}","/pr/cl/dt/{pcode}/{nowPage}/{reviewNowPage}",
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
			@RequestParam(value = "ptag", required = false, defaultValue="肄�") String ptag) {
	    List <ProductBean> productList = productClientService.productClientIndexTag(model, ptag);
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("productList", productList);
	    return map;
	}
}
