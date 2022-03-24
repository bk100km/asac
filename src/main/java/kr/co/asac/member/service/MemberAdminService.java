package kr.co.asac.member.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.member.dao.MemberDAO;

@Service
public class MemberAdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	
	public void memberAdminClientList(Model model) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		List <MemberBean> memberList = memberDAO.memberAdminClientList();
		model.addAttribute("memberList", memberList);
	}
	
	public void memberAdminSellerList(Model model) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		List <SellerBean> sellerList = memberDAO.memberAdminSellerList();
		model.addAttribute("sellerList", sellerList);
	}	
	
	public MemberBean memberAdminClientInfo(Model model, String mid) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		MemberBean member = memberDAO.memberAdminClientInfo(mid);		
		model.addAttribute("member", member);
		return member;
	}
	
	public void memberAdminClientUpdate(HttpServletRequest request, Model model, HttpServletResponse response, MemberBean member) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		memberDAO.memberAdminClientUpdate(member);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
	    
   		response.setContentType("text/html;charset=utf-8");
	   	PrintWriter out = response.getWriter();
	   	System.out.println("MemberAdminService : 수정완료");
	   	out.println("<script>");
	   	out.println("alert('수정이 완료되었습니다.')");
	   	out.println("</script>");
	   	out.flush();
	}	
	
	public void memberAdminClientDelete(HttpServletRequest request, Model model, HttpServletResponse response, String mid) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		memberDAO.memberAdminClientDelete(mid);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
		
   		response.setContentType("text/html;charset=utf-8");
	   	PrintWriter out = response.getWriter();
	   	System.out.println("MemberAdminService : 삭제완료");
	   	out.println("<script>");
	   	out.println("alert('삭제가 완료되었습니다.')");
	   	out.println("</script>");
	   	out.flush();
	}
	
	public void memberAdminClientInsert(HttpServletRequest request, Model model, HttpServletResponse response, MemberBean member) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		memberDAO.memberAdminClientInsert(member);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
		
   		response.setContentType("text/html;charset=utf-8");
	   	PrintWriter out = response.getWriter();
	   	System.out.println("MemberAdminService : 추가완료");
	   	out.println("<script>");
	   	out.println("alert('회원추가가 완료되었습니다.')");
	   	out.println("</script>");
	   	out.flush();
	}	
	
	public List <MemberBean> memberAdminClientSearch(HttpServletRequest request, Model model, String searchCategory, String searchText) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		List <MemberBean> memberList = memberDAO.memberAdminClientSearch(searchCategory, searchText);
		System.out.println(memberList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
		
		return memberList;
	}
	
	public SellerBean memberAdminSellerInfo(Model model, String sid) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		SellerBean seller = memberDAO.memberAdminSellerInfo(sid);		
		model.addAttribute("seller", seller);
		return seller;
	}
	
	public void memberAdminSellerUpdate(HttpServletRequest request, Model model, HttpServletResponse response, SellerBean seller) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		memberDAO.memberAdminSellerUpdate(seller);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
	    
   		response.setContentType("text/html;charset=utf-8");
	   	PrintWriter out = response.getWriter();
	   	System.out.println("MemberAdminService : 수정완료");
	   	out.println("<script>");
	   	out.println("alert('수정이 완료되었습니다.')");
	   	out.println("</script>");
	   	out.flush();
	}	
	
	public void memberAdminSellerDelete(HttpServletRequest request, Model model, HttpServletResponse response, String sid) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		memberDAO.memberAdminSellerDelete(sid);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
		
   		response.setContentType("text/html;charset=utf-8");
	   	PrintWriter out = response.getWriter();
	   	System.out.println("MemberAdminService : 삭제완료");
	   	out.println("<script>");
	   	out.println("alert('삭제가 완료되었습니다.')");
	   	out.println("</script>");
	   	out.flush();
	}
	
	public void memberAdminSellerInsert(HttpServletRequest request, Model model, HttpServletResponse response, SellerBean seller) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		memberDAO.memberAdminSellerInsert(seller);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
		
   		response.setContentType("text/html;charset=utf-8");
	   	PrintWriter out = response.getWriter();
	   	System.out.println("MemberAdminService : 추가완료");
	   	out.println("<script>");
	   	out.println("alert('회원추가가 완료되었습니다.')");
	   	out.println("</script>");
	   	out.flush();
	}	
	
	public List <SellerBean> memberAdminSellerSearch(HttpServletRequest request, Model model, String searchCategory, String searchText) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		System.out.println("searchText값 = " + searchText);
		List <SellerBean> sellerList = memberDAO.memberAdminSellerSearch(searchCategory, searchText);
		System.out.println("MemberAdminService : 검색완료");
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
		
		return sellerList;
	}
	
	public void memberAdminSellerSokCheck(SellerBean seller) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		System.out.println("MemberAdminService : 수정완료");
		memberDAO.memberAdminSellerSokCheck(seller);
	}	
}