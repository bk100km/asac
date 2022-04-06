package kr.co.asac.review.service;




import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.asac.review.bean.ReviewBean;
import kr.co.asac.review.dao.ReviewDAO;

@Service
public class ReviewClientService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	

	public void reviewInsert(ReviewBean review) {
		ReviewDAO reviewDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		System.out.println(review);
		reviewDAO.reviewInsert(review);
		
	}
	public void reviewUpdate(HttpServletRequest request) {
		ReviewDAO reviewDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
	
	
		
		ReviewBean reviewBean = new ReviewBean();
		

		 int revisenum = Integer.parseInt(request.getParameter("revisenum"));
		reviewBean.setRnum(revisenum);
		 int reviserate = Integer.valueOf(request.getParameter("reviserate"));
			reviewBean.setRrate(reviserate);
		
		reviewBean.setRtitle(request.getParameter("revisetitle"));
		reviewBean.setRcontent(request.getParameter("revisecontent"));
		reviewBean.setRfile(request.getParameter("rfile"));
		
		
		
		

		reviewDAO.reviewUpdate(reviewBean);
	}	
		
		
		
		
		
		
	


	}

