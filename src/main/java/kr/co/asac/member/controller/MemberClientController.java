package kr.co.asac.member.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.service.MemberClientService;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.orders.service.OrderClientService;

@Controller
public class MemberClientController {
	
	@Autowired
	private OrderClientService orderClientService;
	
	@Autowired
	private MemberClientService memberClientService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberClientController.class);
	
	@Autowired
    private JavaMailSender mailSender;
	
	// common mapping
	@RequestMapping("/")
	public String memberClientIndex() {
		return "index";
	}
	
	@RequestMapping("/2")
	public String memberClientIndex2() {
		return "index2";
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
	public String memberClientMypage(HttpServletRequest request, HttpSession session, Model model, OrderBean order) {
		String mid=(String) session.getAttribute("mid");
		List<OrderBean> list = orderClientService.orderClientList(mid, order);
		model.addAttribute("orderClientList",list);
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
	
	/* 이메일 인증 */
    @RequestMapping(value="/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
    	System.out.println("들어오니?");
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 " + checkNum);
        
        String setFrom = "bk100km_@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 [" + checkNum + "]입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
    }

}
