package kr.co.asac.utils;


import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//@ControllerAdvice
//public class ErrorController {
//
//	private Logger logger = LoggerFactory.getLogger(ErrorController.class);
//	
//	@ExceptionHandler(Exception.class)
//	public String handleException(Exception ex, Model model) {
//		logger.error("Exception 발생 : {}", ex.getMessage());
//		model.addAttribute("msg", "잠시 후 다시 시도해주세요");
//		return "error/error";
//	}
//}