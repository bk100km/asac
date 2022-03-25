package kr.co.asac.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.member.service.MemberAdminService;
import kr.co.asac.member.service.MemberSellerService;

@Controller
public class MemberSellerController {
	
	@Autowired
	private MemberSellerService memberSellerService;
	
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
}
