package kr.co.asac.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.gson.Gson;

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
		
		// 비밀번호 복호화
		SellerBean secureSeller = memberDAO.memberSellerLoginCheck(seller.getSid());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(secureSeller == null || !encoder.matches(seller.getSpwd(), secureSeller.getSpwd())) {
			response.setContentType("text/html;charset=utf-8");
		   	PrintWriter out = response.getWriter();
		   	System.out.println("로그인 실패");
		   	out.println("<script>");
		   	out.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.')");
		   	out.println("history.back()");
		   	out.println("</script>");
		   	out.flush();		
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("sid", secureSeller.getSid());
			model.addAttribute("sid", secureSeller.getSid());
		}
	}
	public void memberSellerJoin(SellerBean seller) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		seller.setSpwd(encoder.encode(seller.getSpwd()));
		
		memberDAO.memberSellerJoin(seller);
	}
	public int sellerIdChk(SellerBean seller) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		int result =memberDAO.sellerIdChk(seller);
		return result;
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
		
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		seller.setSpwd(encoder.encode(seller.getSpwd()));
				
		memberDAO.memberSellerUpdate(seller);	
		model.addAttribute("seller",seller);
	}
	public void memberSellerDelete(SellerBean seller) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		SellerBean secureMember = memberDAO.memberSellerLoginCheck(seller.getSid());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(secureMember !=null && encoder.matches(seller.getSpwd(), secureMember.getSpwd())) {
			memberDAO.memberSellerDelete(seller);
		}
	}
	public int memberSellerDelPwc(SellerBean seller) {
		int result = 0;
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
			
		SellerBean secureMember = memberDAO.memberSellerDelPwc(seller.getSid());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(secureMember !=null && encoder.matches(seller.getSpwd(), secureMember.getSpwd())) {
			result=1;
		}
		
		return result;
		
	}
	
	// chart	
	public void sellerIndexChart(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		MemberDAO dao = sqlSessionTemplate.getMapper(MemberDAO.class);
		
		String sid = (String) request.getSession().getAttribute("sid");
		
		List<SellerBean> sellerCountMonthChart = dao.sellerCountMonth();
		List<ProductBean> productCountMonthChart = dao.sellerProductCountMonth(sid);
		List<OrderBean> ordersCountMonthChart = dao.sellerOrdersCountMonth(sid);
		List<OrderBean> ordersSumMonthChart = dao.sellerOrdersSumMonth(sid);
		
		String listjson = new Gson().toJson(sellerCountMonthChart);
		model.addAttribute("list", listjson);
		String listjson2 = new Gson().toJson(productCountMonthChart);
		model.addAttribute("list2", listjson2);
		String listjson3 = new Gson().toJson(ordersCountMonthChart);
		model.addAttribute("list3", listjson3);
		String listjson4 = new Gson().toJson(ordersSumMonthChart);
		model.addAttribute("list4", listjson4);

		List<OrderBean> recentOrder = dao.recentOrder();
		model.addAttribute("recentOrder", recentOrder);
		List<ProductBean> topThreeOrder = dao.topThreeOrder();
		model.addAttribute("topThreeOrder", topThreeOrder);
	}
	

}