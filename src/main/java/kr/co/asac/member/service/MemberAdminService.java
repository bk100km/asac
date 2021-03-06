package kr.co.asac.member.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.gson.Gson;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.bean.PagingBean;
import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.member.dao.MemberDAO;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.product.bean.ProductBean;

@Service
public class MemberAdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	
	public void memberAdminClientList(Model model, PagingBean paging) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		List <MemberBean> memberList = memberDAO.memberAdminClientList(paging);
		model.addAttribute("memberList", memberList);
	}
	
	public void memberAdminSellerList(Model model, PagingBean paging) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		List <SellerBean> sellerList = memberDAO.memberAdminSellerList(paging);
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
	}	
	
	public void memberAdminClientDelete(HttpServletRequest request, Model model, HttpServletResponse response, String mid) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		memberDAO.memberAdminClientDelete(mid);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
	}
	
	public void memberAdminClientInsert(HttpServletRequest request, Model model, HttpServletResponse response, MemberBean member) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		member.setMpwd(encoder.encode("123123"));
		
		memberDAO.memberAdminClientInsert(member);
		model.addAttribute("fromURI", request.getServletPath());
		request.setAttribute("fromURI", request.getServletPath());
	}	
	
	public int memberAdminClientCount(String searchCategory, String searchText) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		int listCnt = memberDAO.memberAdminClientCount(searchCategory, searchText);
		System.out.println("MemberAdminService : memberCount 값은 " + listCnt);
		return listCnt;
	}
	
	public List <MemberBean> memberAdminClientSearch(HttpServletRequest request, Model model, String searchCategory, String searchText, PagingBean paging) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		List <MemberBean> memberList = memberDAO.memberAdminClientSearch(searchCategory, searchText, paging);
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
	
	public int memberAdminSellerCount(String searchCategory, String searchText) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		int listCnt = memberDAO.memberAdminSellerCount(searchCategory, searchText);
		System.out.println("MemberAdminService : sellerCount 값은 " + listCnt);
		return listCnt;
	}	
	
	public List <SellerBean> memberAdminSellerSearch(HttpServletRequest request, Model model, String searchCategory, String searchText, PagingBean paging) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		List <SellerBean> sellerList = memberDAO.memberAdminSellerSearch(searchCategory, searchText, paging);
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
	
	// chart
	public void adminIndexChart(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		List<MemberBean> myAreaChart = dao.memberCountMonth();
		List<ProductBean> myAreaChart2 = dao.productCountMonth();
		List<OrderBean> myAreaChart3 = dao.ordersCountMonth();
		List<OrderBean> myAreaChart4 = dao.ordersSumMonth();
		
		String listjson = new Gson().toJson(myAreaChart);
		model.addAttribute("list", listjson);
		String listjson2 = new Gson().toJson(myAreaChart2);
		model.addAttribute("list2", listjson2);
		String listjson3 = new Gson().toJson(myAreaChart3);
		model.addAttribute("list3", listjson3);
		String listjson4 = new Gson().toJson(myAreaChart4);
		model.addAttribute("list4", listjson4);
		
		List<OrderBean> recentOrder = dao.recentOrder();
		model.addAttribute("recentOrder", recentOrder);
		List<ProductBean> topThreeOrder = dao.topThreeOrder();
		model.addAttribute("topThreeOrder", topThreeOrder);
	}
}