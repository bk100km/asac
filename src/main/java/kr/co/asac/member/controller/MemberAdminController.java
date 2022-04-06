package kr.co.asac.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
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

import com.google.gson.Gson;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.bean.PagingBean;
import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.member.dao.MemberDAO;
import kr.co.asac.member.service.MemberAdminService;
import kr.co.asac.member.service.MemberSellerService;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.product.bean.ProductBean;

@Controller
public class MemberAdminController {
	
	@Autowired
	private MemberSellerService memberSellerService;
	@Autowired
	private MemberAdminService memberAdminService;
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping("/me/ad/in")
	public String memberAdminIndex() {
		return "adminIndex";
	}
	
	@RequestMapping("/me/ad/in2")
	public String memberAdminIndex2(HttpServletRequest request, HttpServletResponse response, Model model, MemberBean member) throws Exception {
		memberAdminService.memberCountMonth(request, response, model);
		
		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		List<MemberBean> myAreaChart = dao.memberCountMonth();
		model.addAttribute("myAreaChart", myAreaChart);
		
		List<ProductBean> myAreaChart2 = dao.productCountMonth();
		model.addAttribute("myAreaChart2", myAreaChart2);
		
		List<OrderBean> myAreaChart3 = dao.ordersCountMonth();
		model.addAttribute("myAreaChart3", myAreaChart3);
		
		List<OrderBean> myAreaChart4 = dao.ordersSumMonth();
		model.addAttribute("myAreaChart4", myAreaChart4);
		
		String listjson = new Gson().toJson(myAreaChart);
		model.addAttribute("list", listjson);
		
		String listjson2 = new Gson().toJson(myAreaChart2);
		model.addAttribute("list2", listjson2);
		
		String listjson3 = new Gson().toJson(myAreaChart3);
		model.addAttribute("list3", listjson3);
		
		String listjson4 = new Gson().toJson(myAreaChart4);
		model.addAttribute("list4", listjson4);
		
		return "/member/memberAdminIndex";
	}
	
	@RequestMapping(value = "me/ad/lo", method = RequestMethod.GET)
	public String memberAdminLoginForm(@ModelAttribute("seller") SellerBean seller) {
		return "/member/memberAdminLoginForm";
	}
	
	@RequestMapping(value = "/me/ad/lA", method = RequestMethod.POST)
	public String memberAdminLoginCheck(HttpServletRequest request, HttpServletResponse response, Model model, SellerBean seller) throws Exception {
		
		memberSellerService.memberSellerLoginCheck(request, response, model, seller);		
		return "adminIndex";
	}
	
	@RequestMapping(value = "/me/ad/lO", method = RequestMethod.GET)
	public String memberAdminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:http://localhost:8080/asac/";
	}
	
	@RequestMapping(value = "/me/ad/if", method = RequestMethod.GET)
	public String memberAdminInfo(HttpServletRequest request,HttpServletResponse response, HttpSession session, Model model) throws IOException {
		String sid = (String) session.getAttribute("sid");
		memberSellerService.memberSellerInfo(request,response, session, model, sid);
		return "member/memberAdminInfo";
	}	
	
	@RequestMapping(value = "/me/ad/li", method = RequestMethod.GET)
	public String memberAdminListTab(Model model,
			@RequestParam(value="MemberSearchCategory", required = false, defaultValue = "mid") String memberSearchCategory,
			@RequestParam(value="MemberSearchText", required = false, defaultValue = "") String memberSearchText,
			@ModelAttribute(value = "memberPaging") PagingBean memberPaging,
			@RequestParam(value="sellerSearchCategory", required = false, defaultValue = "sid") String sellerSearchCategory, 
			@RequestParam(value = "sellerSearchText", required = false, defaultValue = "") String sellerSearchText,
			@ModelAttribute(value = "sellerPaging") PagingBean sellerPaging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int memberListCnt = memberAdminService.memberAdminClientCount(memberSearchCategory, memberSearchText);
		int sellerListCnt = memberAdminService.memberAdminSellerCount(sellerSearchCategory, sellerSearchText);
		memberPaging.pageInfo(page, range, memberListCnt);
		sellerPaging.pageInfo(page, range, sellerListCnt);
		System.out.println("컨트롤러에서 memberPaging 값은 = " + memberPaging);
		System.out.println("컨트롤러에서 sellerPaging 값은 = " + sellerPaging);
		
		memberAdminService.memberAdminClientList(model, memberPaging);
		memberAdminService.memberAdminSellerList(model, sellerPaging);
		return "member/memberAdminListTab";
	}
	
	// adminClient
	@RequestMapping(value = "/me/ad/cI", method = RequestMethod.POST)
	@ResponseBody
	public MemberBean memberAdminClientInfo(Model model, String mid) {
	    MemberBean member = memberAdminService.memberAdminClientInfo(model, mid);
	    return member;
	}
	
	@RequestMapping(value = "/me/ad/cU", method = RequestMethod.POST)
	@ResponseBody
	public void memberAdminClientUpdate(HttpServletRequest request, HttpServletResponse response, Model model,
			MemberBean member) throws Exception {
		
		memberAdminService.memberAdminClientUpdate(request, model, response, member);
	}	
	
	@RequestMapping(value = "/me/ad/cD/mid/{mid}", method = RequestMethod.POST)
	@ResponseBody
	public void memberAdminClientDelete(HttpServletRequest request, HttpServletResponse response, Model model, 
			@PathVariable("mid") String mid) throws Exception {

		memberAdminService.memberAdminClientDelete(request, model, response, mid);
	}		
	
	@RequestMapping(value = "/me/ad/ci", method = RequestMethod.POST)
	@ResponseBody
	public void memberAdminClientInsertAction(HttpServletRequest request, HttpServletResponse response, Model model, 
			MemberBean member) throws Exception {
		
		memberAdminService.memberAdminClientInsert(request, model, response, member);
	}
	
	@RequestMapping(value = "/me/ad/cS", method = RequestMethod.POST)
	@ResponseBody
	public Map <String, Object> memberAdminClientSearch(HttpServletRequest request, Model model, 
			@RequestParam(value = "memberSearchCategory", required = false, defaultValue="mid") String searchCategory,
			@RequestParam(value = "memberSearchText", required = false, defaultValue="") String searchText,
			@ModelAttribute(value = "paging") PagingBean paging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int listCnt = memberAdminService.memberAdminClientCount(searchCategory, searchText);
		paging.pageInfo(page, range, listCnt);
		System.out.println("컨트롤러에서 paging 값은 = " + paging);
		
	    List <MemberBean> memberList;
		memberList = memberAdminService.memberAdminClientSearch(request, model, searchCategory, searchText, paging);
	    memberAdminService.memberAdminSellerList(model, paging);
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("paging", paging);
	    map.put("memberList", memberList);
	    return map;
	}	
	
	@RequestMapping(value = "/me/ad/cC", method = RequestMethod.POST)
	@ResponseBody
	public MemberBean memberAdminClientIdCheck(HttpServletRequest request, HttpServletResponse response, Model model, 
			@RequestParam("mid") String mid) throws Exception {

		MemberBean member = memberAdminService.memberAdminClientInfo(model, mid);
	    return member;
	}		
	
	// adminSeller
	@RequestMapping(value = "/me/ad/sI", method = RequestMethod.POST)
	@ResponseBody
	public SellerBean memberAdminSellerInfo(Model model, String sid) {
	    SellerBean seller = memberAdminService.memberAdminSellerInfo(model, sid);
	    return seller;
	}
	
	@RequestMapping(value = "/me/ad/sU", method = RequestMethod.POST)
	@ResponseBody
	public void memberAdminSellerUpdate(HttpServletRequest request, HttpServletResponse response, Model model, 
			SellerBean seller) throws Exception {
		
		memberAdminService.memberAdminSellerUpdate(request, model, response, seller);
	}	
	
	@RequestMapping(value = "/me/ad/sD/sid/{sid}", method = RequestMethod.POST)
	@ResponseBody
	public void memberAdminSellerDelete(HttpServletRequest request, HttpServletResponse response, Model model, 
			@PathVariable("sid") String sid) throws Exception {
		
		memberAdminService.memberAdminSellerDelete(request, model, response, sid);
	}		
	
	@RequestMapping(value = "/me/ad/si", method = RequestMethod.POST)
	@ResponseBody
	public void memberAdminSellerInsertAction(HttpServletRequest request, HttpServletResponse response, Model model, 
			SellerBean seller) throws Exception {
		
		memberAdminService.memberAdminSellerInsert(request, model, response, seller);
	}
	
	@RequestMapping(value = "/me/ad/sS", method = RequestMethod.POST)
	@ResponseBody
	public Map <String, Object> memberAdminSellerSearch(HttpServletRequest request, Model model, 
			@RequestParam(value="sellerSearchCategory") String searchCategory, 
			@RequestParam(value = "sellerSearchText", required = false) String searchText,
			@ModelAttribute(value = "paging") PagingBean paging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		int listCnt = memberAdminService.memberAdminSellerCount(searchCategory, searchText);
		paging.pageInfo(page, range, listCnt);
		System.out.println("컨트롤러에서 paging 값은 = " + paging);
		
		List <SellerBean> sellerList;
	    sellerList = memberAdminService.memberAdminSellerSearch(request, model, searchCategory, searchText, paging);
	    memberAdminService.memberAdminClientList(model, paging);
	    
	    Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("sellerList", sellerList);
	    return map;
	}	
	
	@RequestMapping(value = "/me/ad/sc", method = RequestMethod.POST)
	@ResponseBody
	public void memberAdminSellerSokCheck(SellerBean seller) throws Exception {
		
		memberAdminService.memberAdminSellerSokCheck(seller);
	}	
	
	@RequestMapping(value = "/me/ad/sC", method = RequestMethod.POST)
	@ResponseBody
	public SellerBean memberAdminSellerIdCheck(HttpServletRequest request, HttpServletResponse response, Model model, 
			@RequestParam("sid") String sid) throws Exception {

		SellerBean seller = memberAdminService.memberAdminSellerInfo(model, sid);
	    return seller;
	}	
	
	@RequestMapping(value = "/me/ad/sF", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String memberAdminSellerFileUpload(HttpServletRequest request, Model model, 
			MultipartFile sfileUpload) throws IOException {
		
//		String filePath = request.getSession().getServletContext().getRealPath("upload");
		String fileName = sfileUpload.getOriginalFilename();
		System.out.println("fileName값은 = " + fileName);
		
        try {
        	sfileUpload.transferTo(new File("C:\\asac\\asac\\src\\main\\webapp\\resources\\upload\\" + fileName));
        } catch(Exception e) {
            System.out.println("업로드 오류");
        }
        System.out.println("업로드 완료");
        System.out.println("업로드 파일경로 : " + "C:\\asac\\asac\\src\\main\\webapp\\resources\\upload\\");
		System.out.println("업로드 파일이름 : " + fileName);
		System.out.println("업로드 파일크기 : " + sfileUpload.getSize());
		
		return fileName;
	}	
	
	// chart
	@RequestMapping("/me/ad/mc")
	@ResponseBody
	public List<MemberBean> memberCountMonth(HttpServletRequest request, HttpServletResponse response, Model model, MemberBean vo) throws Exception {
		memberAdminService.memberCountMonth(request, response, model);
				
		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		List<MemberBean> myAreaChart = dao.memberCountMonth();
		model.addAttribute("myAreaChart", myAreaChart);
		
		String jsondata = new Gson().toJson(myAreaChart);
		model.addAttribute("jsondata", jsondata);
		
		
		return myAreaChart;
	}	
}
