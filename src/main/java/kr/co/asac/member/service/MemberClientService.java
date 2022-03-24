package kr.co.asac.member.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.dao.MemberDAO;

@Service
public class MemberClientService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	
	public void memberClientLoginCheck(HttpServletRequest request, HttpServletResponse response, Model model, MemberBean member) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		String mid = memberDAO.memberClientLoginCheck(member);
		
		HttpSession session = request.getSession();
		session.setAttribute("mid", mid);
		model.addAttribute("mid", mid);
		
	    if(mid == null){
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

	public void memberClientJoin(MemberBean member) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		memberDAO.memberJoin(member);
		System.out.println(member);
	}
	
	public int memberIdChk(MemberBean member) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		int result = memberDAO.memberIdChk(member);
		System.out.println(result);
		return result;
	}
	
	public void memberClientInfo(HttpServletRequest request, HttpSession session, Model model, String mid) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		MemberBean member = memberDAO.memberClientInfo(mid);
		System.out.println(member);
		session.setAttribute("member", member);
		model.addAttribute("member", member);
	}
	
	public void memberClientUpdate(HttpServletRequest request, Model model, MemberBean member) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		System.out.println("DAO에 member를 보냈다" + member);
		memberDAO.memberClientUpdate(member);	
		model.addAttribute("member", member);
	}
	
	public void memberClientDelete(MemberBean vo) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		memberDAO.memberClientDelete(vo);
	}
	
	public int memberClientDelPwC(MemberBean vo) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		int result = memberDAO.memberClientDelPwC(vo);
		return result;
	}


}
