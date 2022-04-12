package kr.co.asac.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.asac.member.service.MemberSellerService;

public class Interceptor implements HandlerInterceptor {
	
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);
	static final String[] EXCLUDE_URL_LIST = {
	};
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  Object handler) throws Exception {
		String requestUrl = request.getRequestURL().toString();
		
		// 로그인 체크 제외 리스트
		for (String target : EXCLUDE_URL_LIST) {
			if (requestUrl.indexOf(target) > -1) {
				return true;
			}
		}
		
		HttpSession session = request.getSession();
		String sid = (String)session.getAttribute("sid");
		System.out.println("sid값은 = " + sid);
		if(sid == null || sid.trim().equals("") || !sid.equals("admin")) {
			logger.info(">> interceptor catch!!! sid is not an administrator... ");
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/me/ad/lo");
			return false;
		}
		System.out.println("관리자 로그인 interceptor, 인증결과 = true");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}	
}