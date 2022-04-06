package kr.co.asac.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.member.dao.MemberDAO;
import kr.co.asac.member.service.MemberSellerService;
import kr.co.asac.product.bean.ProductBean;

@Controller
public class MemberSellerController {
	
	@Autowired
	private MemberSellerService memberSellerService;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// seller
	@RequestMapping("/me/se/in")
	public String memberSellerIndex(Model model ,HttpServletRequest request,SellerBean seller) {
		
		memberSellerService.sellerProduct(request, model);
		MemberDAO memberdao = sqlSessionTemplate.getMapper(MemberDAO.class);
		List<ProductBean> myAreaChart =memberdao.sellerProduct();
		model.addAttribute("myAreaChart", myAreaChart);
		
		String listjson = new Gson().toJson(myAreaChart);
		model.addAttribute("list", listjson);
		
		int pcount =0;
		int ocount =0;
		int rcount =0;
		
		System.out.println("컨트롤러에서 sid 값은 = " + request.getSession().getAttribute("sid"));
		pcount =memberSellerService.sellerProductcount(pcount, request);
		ocount =memberSellerService.sellerOrderscount(ocount);
		rcount =memberSellerService.sellerReviewcount(rcount);
		
		System.out.println(pcount);
		System.out.println(ocount);
		System.out.println(rcount);
		
		model.addAttribute("pcount", pcount);
		model.addAttribute("ocount",ocount);
		model.addAttribute("rcount",rcount);
		
		
		
		
		
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
	@RequestMapping(value="/me/se/de" , method= RequestMethod.POST )
	@ResponseBody
	public void memberSellerDelete(Model model ,SellerBean seller){
		
		System.out.println("AJAX를 통한 seller 보냄 = " + seller);
		memberSellerService.memberSellerDelete(model, seller);
	}
}