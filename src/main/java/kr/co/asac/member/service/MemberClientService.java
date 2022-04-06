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
		System.out.println("서비스에서 birth값 = " + member.getMbirth());
		String gender = member.getMbirth().substring(7,8);
		System.out.println("서비스에서 birth값 = " + member.getMbirth().substring(7,8));
		String yy = member.getMbirth();
		String yyyy = null;
		if(gender.equals("1") || gender.equals("2")) {
			yyyy = "19"+yy;
		}else if(gender.equals("3") || gender.equals("4")){
			yyyy = "20"+yy;
		}else if(gender.equals("8") || gender.equals("9")) {
			yyyy = "18"+yy;
		}
		member.setMbirth(yyyy);
		System.out.println(member);
		memberDAO.memberJoin(member);
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
		System.out.println("clientInfo 서비스");
		if (!member.getMphone().equals("")) {
			member.setMphone(member.getMphone().substring(0, 3) + "-" + member.getMphone().substring(3, 7) + "-" + member.getMphone().substring(7, 11));
		}
		if (!member.getMbirth().equals("")) {
			member.setMbirth(member.getMbirth().substring(0, 8) + "-" + member.getMbirth().substring(8) + "******");
		}
		System.out.println(member);
		session.setAttribute("member", member);
		System.out.println("mypage에 보여지는 member"+member);
		model.addAttribute("member", member);
	}
	
	public void memberClientUpdate(HttpServletRequest request, Model model, MemberBean member) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		System.out.println("DAO에 member를 보냈다" + member);
		String gender = member.getMbirth().substring(7,8);
		String yy = member.getMbirth();
		String yyyy = null;
		if(gender.equals("1") || gender.equals("2")) {
			yyyy = "19"+yy;
		}else if(gender.equals("3") || gender.equals("4")){
			yyyy = "20"+yy;
		}else if(gender.equals("8") || gender.equals("9")) {
			yyyy = "18"+yy;
		}
		member.setMbirth(yyyy);
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
	
	public void memberClientNaver(MemberBean member) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		memberDAO.memberClientNaver(member);
	}
	
	public void memberClientKakao(MemberBean member) {
		MemberDAO memberDAO =sqlSessionTemplate.getMapper(MemberDAO.class);
		memberDAO.memberClientKakao(member);
	}


}
