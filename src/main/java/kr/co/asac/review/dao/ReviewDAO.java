package kr.co.asac.review.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.review.bean.ReviewBean;

public interface ReviewDAO {
	

	public List<ReviewBean> reviewList(Map<String, Object> map);
	
	public List<ReviewBean> reviewAll(Map<String, Object> map);
	
	public ReviewBean reviewListDetail(String rcode);
	
	public List<ReviewBean> reivewAdminList(String pcate);
	
	public int reviewInsert(ReviewBean review);
	
	public int reviewUpdate(ReviewBean review);
	
	
	
	public int reviewAdminInsert(ReviewBean review);
	
	public int reivewAdminupdate(ReviewBean review);
	
	public int reviewListCount(String pcode);

	public int reviewAdminDelete(String rnum);
	
	
	public ArrayList<String> reviewAdminCheck();
}
