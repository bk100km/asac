package kr.co.asac.review.service;




import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.asac.review.bean.ReviewBean;
import kr.co.asac.review.dao.ReviewDAO;

@Service
public class ReviewAdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	

	public void reviewUpdate(ReviewBean review) {
		ReviewDAO reviewDAO = sqlSessionTemplate.getMapper(ReviewDAO.class);
		System.out.println(review);
		reviewDAO.reviewInsert(review);
		
		
		
		
		
		
		
		
		
	


	}

}
