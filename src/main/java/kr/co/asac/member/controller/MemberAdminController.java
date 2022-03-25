package kr.co.asac.member.controller;

import java.util.List;

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

import kr.co.asac.member.bean.MemberBean;
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
	public String memberAdminIndex() {
		return "adminIndex";
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
	
	@RequestMapping(value = "/me/ad/li", method = RequestMethod.GET)
	public String memberAdminListTab(Model model) {
		
		memberAdminService.memberAdminClientList(model);
		memberAdminService.memberAdminSellerList(model);
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
	
	@RequestMapping(value = "/me/ad/cS/sC/{memberSearchCategory}", method = RequestMethod.POST)
	@ResponseBody
	public List <MemberBean> memberAdminClientSearch(HttpServletRequest request, Model model, @PathVariable("memberSearchCategory") String searchCategory,
			@RequestParam(value = "memberSearchText", required = false) String searchText) {
	    List <MemberBean> memberList;
		memberList = memberAdminService.memberAdminClientSearch(request, model, searchCategory, searchText);
	    memberAdminService.memberAdminSellerList(model);
	    return memberList;
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
	
	@RequestMapping(value = "/me/ad/sS/sC/{sellerSearchCategory}", method = RequestMethod.POST)
	@ResponseBody
	public List <SellerBean> memberAdminSellerSearch(HttpServletRequest request, Model model, 
			@PathVariable("sellerSearchCategory") String searchCategory, @RequestParam(value = "sellerSearchText", required = false) String searchText) {
		List <SellerBean> sellerList;
	    sellerList = memberAdminService.memberAdminSellerSearch(request, model, searchCategory, searchText);
	    memberAdminService.memberAdminClientList(model);
	    return sellerList;
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
}
