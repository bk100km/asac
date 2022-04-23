package kr.co.asac.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.bean.PagingBean;
import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.member.service.MemberAdminService;
import kr.co.asac.member.service.MemberSellerService;

@Controller
public class MemberAdminController {
	
	@Autowired
	private MemberSellerService memberSellerService;
	@Autowired
	private MemberAdminService memberAdminService;
	
	@RequestMapping("/me/ad/in")
	public String memberAdminIndex(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		memberAdminService.adminIndexChart(request, response, model);
		return "adminIndex";
	}
	
	@RequestMapping(value = "me/ad/lo", method = RequestMethod.GET)
	public String memberAdminLoginForm(@ModelAttribute("seller") SellerBean seller) {
		return "/member/memberAdminLoginForm";
	}
	
	@RequestMapping(value = "/me/ad/lA", method = RequestMethod.POST)
	public String memberAdminLoginCheck(HttpServletRequest request, HttpServletResponse response, Model model, SellerBean seller) throws Exception {
		
		memberSellerService.memberSellerLoginCheck(request, response, model, seller);
		memberAdminService.adminIndexChart(request, response, model);
		return "/adminIndex";
	}
	
	@RequestMapping(value = "/me/ad/lO", method = RequestMethod.GET)
	public String memberAdminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/me/ad/lo";
	}
	
	@RequestMapping(value = "/me/ad/lC", method = RequestMethod.GET)
	public String memberAdminClientList(Model model,
			@RequestParam(value="MemberSearchCategory", required = false, defaultValue = "mid") String memberSearchCategory,
			@RequestParam(value="MemberSearchText", required = false, defaultValue = "") String memberSearchText,
			@ModelAttribute(value = "memberPaging") PagingBean memberPaging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int memberListCnt = memberAdminService.memberAdminClientCount(memberSearchCategory, memberSearchText);
		memberPaging.pageInfo(page, range, memberListCnt);
		System.out.println("컨트롤러에서 memberPaging 값은 = " + memberPaging);
		
		memberAdminService.memberAdminClientList(model, memberPaging);
		return "member/memberAdminClientList";
	}
	
	@RequestMapping(value = "/me/ad/lS", method = RequestMethod.GET)
	public String memberAdminSellerList(Model model,
			@RequestParam(value="sellerSearchCategory", required = false, defaultValue = "sid") String sellerSearchCategory, 
			@RequestParam(value = "sellerSearchText", required = false, defaultValue = "") String sellerSearchText,
			@ModelAttribute(value = "sellerPaging") PagingBean sellerPaging,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "range", required = false, defaultValue = "1") int range) throws Exception {
		
		int sellerListCnt = memberAdminService.memberAdminSellerCount(sellerSearchCategory, sellerSearchText);
		sellerPaging.pageInfo(page, range, sellerListCnt);
		System.out.println("컨트롤러에서 sellerPaging 값은 = " + sellerPaging);
		
		memberAdminService.memberAdminSellerList(model, sellerPaging);
		return "member/memberAdminSellerList";
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
		
	    List <MemberBean> memberList;
		memberList = memberAdminService.memberAdminClientSearch(request, model, searchCategory, searchText, paging);
	    memberAdminService.memberAdminSellerList(model, paging);
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("paging", paging);
	    map.put("memberList", memberList);
		System.out.println("컨트롤러에서 memberPaging 값은 = " + paging);
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
        	sfileUpload.transferTo(new File(request.getSession().getServletContext().getRealPath("/resources/memberUpload") + "/" +  fileName));
        } catch(Exception e) {
            System.out.println("업로드 오류");
        }
        System.out.println("업로드 완료");
        System.out.println("업로드 파일경로 : " + request.getSession().getServletContext().getRealPath("/resources/memberUpload"));
		System.out.println("업로드 파일이름 : " + fileName);
		System.out.println("업로드 파일크기 : " + sfileUpload.getSize());
		
		return fileName;
	}	
}
