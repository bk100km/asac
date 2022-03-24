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
public class MemberSellerController {
	
	@Autowired
	private MemberSellerService memberSellerService;
	@Autowired
	private MemberAdminService memberAdminService;
	
	// seller
	@RequestMapping("/me/se/in")
	public String memberSellerIndex() {
		return "sellerIndex";
	}
	
	@RequestMapping(value = "/me/se/lo", method = RequestMethod.GET)
	public String memberSellerLoginForm(@ModelAttribute("seller") SellerBean seller) {
		return "/member/memberSellerLoginForm";
	}
	
	@RequestMapping(value = "/me/se/lA", method = RequestMethod.POST)
	public String memberSellerLoginCheck(HttpServletRequest request, HttpServletResponse response, Model model, SellerBean seller) throws Exception {
		
		memberSellerService.memberSellerLoginCheck(request, response, model, seller);		
		return "sellerIndex";
	}
	
	@RequestMapping(value = "/me/se/lO", method = RequestMethod.GET)
	public String memberSellerLogout(HttpSession session) {
		session.invalidate();
		return "redirect:http://localhost:8080/asac/";
	}
	
	@RequestMapping(value = "/me/se/jo", method = RequestMethod.GET)
	public String memberSellerJoin() {
		return "/member/memberSellerjoinFrom";
	}
	@RequestMapping(value = "/me/se/jo", method = RequestMethod.POST)
	@ResponseBody
	public void memberSellerJoin(SellerBean seller) {
		memberSellerService.memberSellerJoin(seller);
	}
	@RequestMapping(value = "/me/se/jA", method = RequestMethod.POST)
	public String memberSellerJoinAction(SellerBean seller) {
		System.out.println("SellerJoinAction함수에서 seller 값 = " + seller);
		memberSellerService.memberSellerJoin(seller);
		return "redirect:/me/se/lo";
	}
	
	@RequestMapping(value="/me/se/iF" , method = RequestMethod.GET)
	public String membersellerInfo(HttpServletRequest request, HttpSession session, Model model) {
		String sid = (String) session.getAttribute("sid");
		memberSellerService.memberSellerInfo(request, session, model, sid);
		return "/member/memberSellerInfo";
	}
	
	@RequestMapping(value="/me/se/up" , method = RequestMethod.GET)
	public String memberSellerUpdate(HttpServletRequest request, HttpSession session, Model model) {
		
		return "/member/memberSellerUpdate";
	}
	
	@RequestMapping(value="/me/se/up" , method = RequestMethod.POST)
	public String memberSellerUpdateAction(HttpServletRequest request, HttpSession session, Model model, SellerBean seller) {
		
		memberSellerService.memberSellerUpdate(request,model, seller);
		String sid = (String) session.getAttribute("sid");
		memberSellerService.memberSellerInfo(request, session, model, sid);
		return "/member/memberSellerInfo";
	}
	@RequestMapping(value="/me/se/de" , method= RequestMethod.POST )
	@ResponseBody
	public void memberSellerDelete(Model model ,SellerBean seller){
		
		System.out.println("AJAX를 통한 seller 보냄 = " + seller);
		memberSellerService.memberSellerDelete(model, seller);
	}
	
	// admin
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
	
	@RequestMapping(value = "/me/ad/cI", method = RequestMethod.POST)
	@ResponseBody
	public MemberBean memberAdminClientInfo(Model model, String mid) {
	    MemberBean member = memberAdminService.memberAdminClientInfo(model, mid);
	    return member;
	}
	
	@RequestMapping(value = "/me/ad/cU", method = RequestMethod.POST)
	public String memberAdminClientUpdate(HttpServletRequest request, HttpServletResponse response, Model model, MemberBean member) throws Exception {
		
		memberAdminService.memberAdminClientUpdate(request, model, response, member);
		memberAdminService.memberAdminClientList(model);
		memberAdminService.memberAdminSellerList(model);
		return "member/memberAdminListTab";
	}	
	
	@RequestMapping(value = "/me/ad/cD/mid/{mid}", method = RequestMethod.GET)
	public String memberAdminClientDelete(HttpServletRequest request, HttpServletResponse response, Model model, @PathVariable("mid") String mid) throws Exception {
		
		memberAdminService.memberAdminClientDelete(request, model, response, mid);
		memberAdminService.memberAdminClientList(model);
		memberAdminService.memberAdminSellerList(model);
		return "member/memberAdminListTab";
	}		
	
	@RequestMapping(value = "/me/ad/ci", method = RequestMethod.GET)
	public String memberAdminClientInsert(Model model) {
		
		memberAdminService.memberAdminClientList(model);
		memberAdminService.memberAdminSellerList(model);
		return "member/memberAdminInsertTab";
	}
	
	@RequestMapping(value = "/me/ad/ci", method = RequestMethod.POST)
	public String memberAdminClientInsertAction(HttpServletRequest request, HttpServletResponse response, Model model, MemberBean member) throws Exception {
		
		System.out.println("MemberSellerController에서 member 값은 = " + member);
		memberAdminService.memberAdminClientInsert(request, model, response, member);
		memberAdminService.memberAdminClientList(model);
		memberAdminService.memberAdminSellerList(model);
		return "member/memberAdminInsertTab";
	}
	
	@RequestMapping(value = "/me/ad/cS/sC/{searchCategory}/sT/{searchText}", method = RequestMethod.POST)
	@ResponseBody
	public List <MemberBean> memberAdminClientSearch(HttpServletRequest request, Model model, @PathVariable("searchCategory") String searchCategory,
			@PathVariable("searchText") String searchText) {
	    List <MemberBean> memberList;
		memberList = memberAdminService.memberAdminClientSearch(request, model, searchCategory, searchText);
	    memberAdminService.memberAdminSellerList(model);
	    return memberList;
	}	
	
	@RequestMapping(value = "/me/ad/cS/sC/{searchCategory}/all", method = RequestMethod.POST)
	@ResponseBody
	public List <MemberBean> memberAdminClientSearchAll(HttpServletRequest request, Model model, @PathVariable("searchCategory") String searchCategory) {
	    String searchText = "";
		List <MemberBean> memberList;
		memberList = memberAdminService.memberAdminClientSearch(request, model, searchCategory, searchText);
	    memberAdminService.memberAdminSellerList(model);
	    return memberList;
	}
	
	@RequestMapping(value = "/me/ad/sI", method = RequestMethod.POST)
	@ResponseBody
	public SellerBean memberAdminSellerInfo(Model model, String sid) {
	    SellerBean seller = memberAdminService.memberAdminSellerInfo(model, sid);
	    return seller;
	}
	
	@RequestMapping(value = "/me/ad/sU", method = RequestMethod.POST)
	public String memberAdminSellerUpdate(HttpServletRequest request, HttpServletResponse response, Model model, SellerBean seller) throws Exception {
		
		memberAdminService.memberAdminSellerUpdate(request, model, response, seller);
		memberAdminService.memberAdminClientList(model);
		memberAdminService.memberAdminSellerList(model);
		return "member/memberAdminListTab";
	}	
	
	@RequestMapping(value = "/me/ad/sD/sid/{sid}", method = RequestMethod.GET)
	public String memberAdminSellerDelete(HttpServletRequest request, HttpServletResponse response, Model model, @PathVariable("sid") String sid) throws Exception {
		
		memberAdminService.memberAdminSellerDelete(request, model, response, sid);
		memberAdminService.memberAdminClientList(model);
		memberAdminService.memberAdminSellerList(model);
		return "member/memberAdminListTab";
	}		
	
	@RequestMapping(value = "/me/ad/si", method = RequestMethod.GET)
	public String memberAdminSellerInsert(Model model) {
		
		memberAdminService.memberAdminClientList(model);
		memberAdminService.memberAdminSellerList(model);
		return "member/memberAdminInsertTab";
	}
	
	@RequestMapping(value = "/me/ad/si", method = RequestMethod.POST)
	public String memberAdminSellerInsertAction(HttpServletRequest request, HttpServletResponse response, Model model, SellerBean seller) throws Exception {
		
		memberAdminService.memberAdminSellerInsert(request, model, response, seller);
		memberAdminService.memberAdminClientList(model);
		memberAdminService.memberAdminSellerList(model);
		return "member/memberAdminInsertTab";
	}
	
	@RequestMapping(value = "/me/ad/sS/sC/{searchCategory}", method = RequestMethod.POST)
	@ResponseBody
	public List <SellerBean> memberAdminSellerSearch(HttpServletRequest request, Model model, 
			@PathVariable("searchCategory") String searchCategory, @RequestParam(value = "sellerSearchText", required = false) String searchText) {
		List <SellerBean> sellerList;
	    sellerList = memberAdminService.memberAdminSellerSearch(request, model, searchCategory, searchText);
	    memberAdminService.memberAdminClientList(model);
	    return sellerList;
	}	
	
	@RequestMapping(value = "/me/ad/sS/sC/{searchCategory}/all", method = RequestMethod.POST)
	@ResponseBody
	public List <SellerBean> memberAdminSellerSearchAll(HttpServletRequest request, Model model, 
			@PathVariable("searchCategory") String searchCategory) {
		String searchText = "";
		List <SellerBean> sellerList;
	    sellerList = memberAdminService.memberAdminSellerSearch(request, model, searchCategory, searchText);
	    memberAdminService.memberAdminClientList(model);
	    return sellerList;
	}	
	
	@RequestMapping(value = "/me/ad/sC", method = RequestMethod.POST)
	@ResponseBody
	public void memberAdminSellerSokCheck(SellerBean seller) throws Exception {
		
		memberAdminService.memberAdminSellerSokCheck(seller);
	}	
}
