package kr.co.asac.review.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.review.bean.ReviewBean;

public interface ReviewDAO {
	

	public List<ReviewBean> reviewList(Map<String, Object> map);
	
	public ReviewBean reviewListDetail(String rcode);
	
	public List<ReviewBean> reivewAdminList(String pcate);
	
	public int reviewInsert(ReviewBean review);
	
	
	public int reviewAdmininsert(ReviewBean review);
	
	public int reivewAdminupdate(ReviewBean review);
	
	public int reivewAdmindelete(String rcode);
	
	public int reviewListCount(String pcode);

	
	
	public ArrayList<String> reviewAdminCheck();
}
