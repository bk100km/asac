package kr.co.asac.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.bean.PagingBean;
import kr.co.asac.member.bean.SellerBean;
import kr.co.asac.orders.bean.OrderBean;
import kr.co.asac.product.bean.ProductBean;

public interface MemberDAO {

	// client
	public String memberClientLoginCheck(MemberBean member);
	public void memberJoin(MemberBean member);
	public int memberIdChk(MemberBean member);
	public MemberBean memberClientInfo(String mid);
	public void memberClientUpdate(MemberBean member);
	public void memberClientDelete(MemberBean vo);
	public int memberClientDelPwC(MemberBean vo);
	public void memberClientNaver(MemberBean member);
	public void memberClientKakao(MemberBean member);
	
	// seller
	public String memberSellerLoginCheck(SellerBean seller);
	public void memberSellerJoin(SellerBean seller);
	public int sellerIdChk(SellerBean seller);
	public SellerBean memberSellerInfo(String sid);
	public void memberSellerUpdate(SellerBean seller);
	public void memberSellerDelete(SellerBean seller);
	public int sellerProductcount(int count);
	public int sellerOrderscount(int count);
	public int sellerReviewcount(int count);
	public List<OrderBean> sellerProduct();
	public List<ProductBean> sellermoney();
	
	// admin	
	public int memberAdminClientCount(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText);
	public List <MemberBean> memberAdminClientList(@Param("paging") PagingBean paging);
	public MemberBean memberAdminClientInfo(String mid);
	public void memberAdminClientUpdate(MemberBean member);
	public void memberAdminClientDelete(String mid);
	public void memberAdminClientInsert(MemberBean member);
	public List <MemberBean> memberAdminClientSearch(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText, @Param("paging") PagingBean paging);
	
	public int memberAdminSellerCount(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText);
	public List <SellerBean> memberAdminSellerList(@Param("paging") PagingBean paging);
	public SellerBean memberAdminSellerInfo(String sid);
	public void memberAdminSellerUpdate(SellerBean seller);
	public void memberAdminSellerDelete(String sid);
	public void memberAdminSellerInsert(SellerBean seller);
	public List <SellerBean> memberAdminSellerSearch(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText, @Param("paging") PagingBean paging);
	public void memberAdminSellerSokCheck(SellerBean seller);
	
	// chart
	public List<MemberBean> memberAdminDayList(String id);
	public List<MemberBean> memberAdminDayConfirmList(String id);
	public List<MemberBean> memberCountMonth();
	public List<ProductBean> productCountMonth();
	public List<OrderBean> ordersCountMonth();
	public List<OrderBean> ordersSumMonth();
}
