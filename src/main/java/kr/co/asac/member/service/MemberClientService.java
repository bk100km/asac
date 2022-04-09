package kr.co.asac.member.service;

import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.dao.MemberDAO;

@Service
public class MemberClientService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	
	public MemberBean readMember(String id) {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		System.out.println("S : readMember()실행");
		MemberBean vo = null;
		
		try {
			vo = memberDAO.memberInfo(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
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
	
	// 비밀번호 찾기 이메일 발송
	public void sendEmail(MemberBean vo, String div) throws Exception {

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "bk100km_@naver.com";
		String fromName = "ASAC 아삭 비건 마켓";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "아삭 비건마켓 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getMid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getMpwd() + "</p></div>";
		}
		
		if(div.equals("findId")) {
			subject = "아삭 비건마켓 아이디 찾기 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getMname() + "님의 아이디는 </h3>";
			msg += "<p>[ " + vo.getMid() + " ] 입니다 </p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getMmail();
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			
			helper.setFrom(fromEmail);
			helper.setTo(mail);
			helper.setSubject(fromName);
			helper.setText(msg, true);

			mailSender.send(message);
			
			
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	public void findPw(HttpServletRequest request, HttpServletResponse response, MemberBean vo, Model model, String mid) throws Exception {
		MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
		response.setContentType("text/html;charset=utf-8");
		MemberBean ck = memberDAO.memberInfo(vo.getMid());
		System.out.println("ck는?" + ck );
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(memberDAO.memberIdChk(vo) == 0) {
			System.out.println(memberDAO.memberIdChk(vo));
			System.out.println(vo.getMid());
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getMmail().equals(ck.getMmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String mpwd = "";
			for (int i = 0; i < 12; i++) {
				mpwd += (char) ((Math.random() * 26) + 97);
			}
			vo.setMpwd(mpwd);
			// 비밀번호 변경
			memberDAO.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

		//아이디 찾기
		public void findId(HttpServletRequest request, HttpServletResponse response, MemberBean vo, Model model, String mname, String mphone, String mmail) throws Exception {
			MemberDAO memberDAO = sqlSessionTemplate.getMapper(MemberDAO.class);
			response.setContentType("text/html;charset=utf-8");
			System.out.println("vo에 들어있는 값" + vo);
			MemberBean ck = memberDAO.findId(vo);
			System.out.println("ck는?" + ck );
			PrintWriter out = response.getWriter();
			// 등록된 이름이 없으면
			if(memberDAO.findId(vo) == null) {
				System.out.println(vo.getMname());
				out.print("일치하는 회원이 없습니다.");
				out.close();
			}else {
				System.out.println("findId()에서 id값은 = " + ck.getMid());
				sendEmail(ck, "findId");
				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				/*
				 * out.println(
				 * "<script>location.href='http://localhost:8080/me/cl/lo';</script>");
				 */
				out.close();
			}
		}


}
