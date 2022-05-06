package kr.co.asac.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.member.service.MemberSellerService;

@Controller
public class MemberSellerController {
	
	@Autowired
	private MemberSellerService memberSellerService;
	
	// seller
	@RequestMapping("/me/se/in")
	public String memberSellerIndex(HttpServletRequest request, HttpServletResponse response, Model model, MemberBean member) throws Exception {
		
		//sellerChart
		memberSellerService.sellerIndexChart(request, response, model);		
		return "sellerIndex";
	}

	@RequestMapping(value = "/me/se/lo", method = RequestMethod.GET)
	public String memberSellerLoginForm(@ModelAttribute("seller") SellerBean seller) {
		return "/member/memberSellerLoginForm";
	}
	
	@RequestMapping(value = "/me/se/lA", method = RequestMethod.POST)
	public String memberSellerLoginCheck(HttpServletRequest request, HttpServletResponse response, Model model, SellerBean seller) throws Exception {
		
		memberSellerService.memberSellerLoginCheck(request, response, model, seller);
		return "redirect:/me/se/in";
	}
	
	@RequestMapping(value ="/me/se/so", method=RequestMethod.POST)
	@ResponseBody
	public SellerBean sellerIdOk(@RequestParam(value="sid") String sid,
			Model model,HttpServletRequest request, HttpServletResponse response) {		
		SellerBean seller = memberSellerService.sellerIdOk(sid,model, request, response);
		return seller;
	}
	
	@RequestMapping(value = "/me/se/lO", method = RequestMethod.GET)
	public String memberSellerLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/me/se/lo";
	}
	
	@RequestMapping(value = "/me/se/jo", method = RequestMethod.GET)
	public String memberSellerJoin() {
		return "/member/memberSellerjoinForm";
	}
	
	@RequestMapping(value = "/me/se/jo", method = RequestMethod.POST)
	
	public void memberSellerJoin(SellerBean seller) {
		memberSellerService.memberSellerJoin(seller);
	}
	
	@RequestMapping(value = "/me/se/sF", method = RequestMethod.POST,produces="application/text;charset=utf-8")
	@ResponseBody
	public String memberSellerFileUpload(HttpServletRequest request, 
			Model model ,MultipartFile sfileUpload) throws IOException {
		System.out.println("패스" + request.getSession().getServletContext().getRealPath("upload"));
		String filepath =request.getSession().getServletContext().getRealPath("upload");
		String filename = sfileUpload.getOriginalFilename();
		
		try {
			sfileUpload.transferTo(new File(filepath + filename));
		}catch(Exception e){
			System.out.println("업로드 오류");
		}
		System.out.println("업로드 완료");
        System.out.println("업로드 파일경로 : " + filepath);
		System.out.println("업로드 파일이름 : " + filename);
	
		return filename;
	}
	@RequestMapping(value = "/me/se/jA", method = RequestMethod.POST)
	public String memberSellerJoinAction(SellerBean seller,Model model)  {
		System.out.println("SellerJoinAction함수에서 seller 값 = " + seller);
	
		memberSellerService.memberSellerJoin(seller);
		return "redirect:/me/se/lo";
	}
	@RequestMapping(value = "/me/se/iC", method = RequestMethod.POST)
	@ResponseBody
	public int memberIdChk(SellerBean seller) {
		int result =memberSellerService.sellerIdChk(seller);
		return result;
	}
	@RequestMapping(value="/me/se/iF" , method = RequestMethod.GET)
	public String membersellerInfo(HttpServletRequest request,HttpServletResponse response, HttpSession session, Model model) throws IOException {
		String sid = (String) session.getAttribute("sid");
		memberSellerService.memberSellerInfo(request,response, session, model, sid);
		return "/member/memberSellerInfo";
	}
	
	@RequestMapping(value="/me/se/up" , method = RequestMethod.GET)
	public String memberSellerUpdate(HttpServletRequest request, HttpSession session, Model model) {
		
		return "/member/memberSellerUpdate";
	}
	
	@RequestMapping(value="/me/se/up" , method = RequestMethod.POST)
	public String memberSellerUpdateAction(HttpServletRequest request,HttpServletResponse response, HttpSession session, Model model, SellerBean seller) throws IOException {
		
		memberSellerService.memberSellerUpdate(request,model, seller);
		String sid = (String) session.getAttribute("sid");
		System.out.println("SellerUpdateAction함수에서 seller 값 = " + seller);
		memberSellerService.memberSellerInfo(request, response, session, model, sid);
		return "/member/memberSellerInfo";
	}
	
	@RequestMapping(value="/me/se/de" , method= RequestMethod.GET)
	public String memberSellerDeleteView(){
		
		return "/member/memberSellerDelete";
	}
	@RequestMapping(value="/me/se/dC" , method = RequestMethod.POST)
	public String memberSellerDelete(SellerBean seller , HttpSession session) {
		memberSellerService.memberSellerDelete(session,seller);
		session.invalidate();
		return "redirect:/me/se/lo";
	}
	
	@RequestMapping(value="/me/se/dP" , method = RequestMethod.POST)
	@ResponseBody
	public int memberSellerDelPwc(SellerBean seller) {
		int result =memberSellerService.memberSellerDelPwc(seller);
		System.out.println(result);
		return result;
	}
}