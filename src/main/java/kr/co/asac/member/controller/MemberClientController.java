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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.service.MemberClientService;

@Controller
public class MemberClientController {
	
	@Autowired
	private MemberClientService memberClientService;
	
	// common mapping
	@RequestMapping("/")
	public String memberClientIndex() {
		return "index";
	}
	
	//	member mapping
	@RequestMapping(value = "/me/cl/lo", method = RequestMethod.GET)
	public String memberClientLoginForm(@ModelAttribute("member") MemberBean member) {
		return "/member/memberClientLoginForm";
	}
	
	@RequestMapping(value = "/me/cl/lA", method = RequestMethod.POST)
	public String memberClientLoginCheck(HttpServletRequest request, HttpServletResponse response, Model model, MemberBean member) throws Exception {
		memberClientService.memberClientLoginCheck(request, response, model, member);
		System.out.println(member);
		return "index";
	}
	
	@RequestMapping(value = "/me/cl/lO", method = RequestMethod.GET)
	public String memberClientLogout(HttpSession session) {
		session.invalidate();
		return "redirect:http://localhost:8080/asac/";
	}
	
	@RequestMapping(value = "/me/cl/jo", method = RequestMethod.GET)
	public String memberClientJoin() {
		return "/member/memberClientJoinForm";
	}
	 
	@RequestMapping(value = "/me/cl/jo", method = RequestMethod.POST)
	@ResponseBody
	public void memberClientJoin(MemberBean member) {
		System.out.println(member);
		memberClientService.memberClientJoin(member);
	}
	
	@RequestMapping(value = "/me/cl/jA", method = RequestMethod.POST)
	public String memberClientJoinAction(MemberBean member) {
		System.out.println(member);
		memberClientService.memberClientJoin(member);
		return "redirect:/me/cl/lo";
	}
	
	@RequestMapping(value="/me/cl/iC", method = RequestMethod.POST)
	@ResponseBody
	public int memberIdChk(MemberBean member) {
		System.out.println("들어왔니");
		int result = memberClientService.memberIdChk(member);
		System.out.println(result + "는?");
		return result;
	}

	@RequestMapping(value = "/me/cl/my", method = RequestMethod.GET)
	public String memberClientMypage(HttpServletRequest request, HttpSession session, Model model) {
		String mid=(String) session.getAttribute("mid");
		memberClientService.memberClientInfo(request, session, model, mid);
		return "/member/memberClientMypage";
	}
	
	@RequestMapping(value="/me/cl/up", method = RequestMethod.POST)
	public String memberClientInfo(HttpServletRequest request, HttpSession session, Model model, MemberBean member) {
		memberClientService.memberClientUpdate(request, model, member);
		String mid=(String) session.getAttribute("mid");
		memberClientService.memberClientInfo(request, session, model, mid);
		return "/member/memberClientMypage";
	}
	
	@RequestMapping(value="/me/cl/de", method = RequestMethod.GET)
	public String memberDeleteView() {
		return "/member/memberClientDelete";
	}
	
	@RequestMapping(value="/me/cl/dC", method = RequestMethod.POST)
	public String memberClientDelete(MemberBean vo, HttpSession session, RedirectAttributes rttr) {
		memberClientService.memberClientDelete(vo);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/me/cl/dP", method=RequestMethod.POST)
	@ResponseBody
	public int memberClientDelPwC(MemberBean vo) {
		int result = memberClientService.memberClientDelPwC(vo);
		System.out.println(result);
		return result;
	}

}
