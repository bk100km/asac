package kr.co.asac.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.member.dao.MemberDAO;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.product.bean.ProductBean;

@Service
public class MemberSellerService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	
	public void memberSellerLoginCheck(HttpServletRequest request, HttpServletResponse response, Model model, SellerBean seller) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		String sid = memberDAO.memberSellerLoginCheck(seller);
		
		HttpSession session = request.getSession();
		session.setAttribute("sid", sid);
		model.addAttribute("sid", sid);
		
	    if(sid == null){
   		response.setContentType("text/html;charset=utf-8");
	   	PrintWriter out = response.getWriter();
	   	System.out.println("로그인 실패");
	   	out.println("<script>");
	   	out.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.')");
	   	out.println("history.back()");
	   	out.println("</script>");
	   	out.flush();		
	    }
	}
	public void memberSellerJoin(SellerBean seller) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		memberDAO.memberSellerJoin(seller);
	}
	public int sellerIdChk(SellerBean seller) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		int result =memberDAO.sellerIdChk(seller);
		return result;
	}
	public int sellerProductcount( int count,HttpServletRequest request) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		String sid =(String)request.getSession().getAttribute("sid");
		HttpSession session = request.getSession();
		session.setAttribute("sid", sid);
		System.out.println("sid 설정 전" + request.getSession().getAttribute("sid"));
		return memberDAO.sellerProductcount(count);
	}
	public int sellerOrderscount(int count) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		return memberDAO.sellerOrderscount(count);
	}
	public int sellerReviewcount(int count) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		return memberDAO.sellerReviewcount(count);
	}
	
	public void sellerProduct(HttpServletRequest request,HttpServletResponse response, Model model) {
		
		MemberDAO memberdao = sqlSessionTemplate.getMapper(MemberDAO.class);
		List<OrderBean> sellerProduct = memberdao.sellerProduct();
		model.addAttribute("sellerProduct", sellerProduct);
		
	}
	public void sellermoney(HttpServletRequest request,HttpServletResponse response, Model model,ProductBean pvo) {
		MemberDAO memberdao = sqlSessionTemplate.getMapper(MemberDAO.class);
		List<ProductBean> sellermoney =memberdao.sellermoney();
		model.addAttribute("sellermoney",sellermoney);
	}
	
	public void memberSellerInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, String sid) throws IOException {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		sid=(String) request.getSession().getAttribute("sid");
		SellerBean seller = memberDAO.memberSellerInfo(sid);
		session.setAttribute("seller", seller);
		model.addAttribute("seller",seller);		
		
		if(sid ==null) {
			response.setContentType("text/html;charset=utf-8");
		   	PrintWriter out = response.getWriter();
		   	
		   	out.println("<script>");
		   	out.println("alert('로그인후 이용하세요.')");
		   	out.println("history.back()");
		   	out.println("</script>");
		   	out.flush();	
		}
		
		
	}
	public void memberSellerUpdate(HttpServletRequest request, Model model,SellerBean seller) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		memberDAO.memberSellerUpdate(seller);	
		
		model.addAttribute("seller",seller);
	}
	public void memberSellerDelete(Model model, SellerBean seller)  {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);

		memberDAO.memberSellerDelete(seller);
		
	}
	

}