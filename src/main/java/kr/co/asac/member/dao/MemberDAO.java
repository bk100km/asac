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
	public MemberBean memberClientLoginCheck(String mid);
	public void memberJoin(MemberBean member);
	public int memberIdChk(MemberBean member);
	public int memberEmailChk(MemberBean member);
	public MemberBean memberInfo(String mid);
	public MemberBean memberClientInfo(String mid);
	public void memberClientUpdate(MemberBean member);
	public void memberClientDelete(MemberBean vo, @Param("mid") String mid);
	public MemberBean memberClientDelPwC(String mid);
	public void memberClientNaver(MemberBean member);
	public void memberClientKakao(MemberBean member);
	public int updatePw(MemberBean vo) throws Exception;
	public MemberBean findId(MemberBean vo) throws Exception;
	public void orderClientBackupInsert(OrderBean order, @Param("mid") String mid);
	
	// seller
	public SellerBean memberSellerLoginCheck(String sid);
	public void memberSellerJoin(SellerBean seller);
	public int sellerIdChk(SellerBean seller);
	public SellerBean sellerIdOk(String sid);
	public SellerBean memberSellerInfo(String sid);
	public void memberSellerUpdate(SellerBean seller);
	public void memberSellerDelete(SellerBean seller, @Param("sid") String sid);
	public SellerBean memberSellerDelPwc(String sid);
	
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
	
	
	// chartAdmin
	public List<MemberBean> memberAdminDayList(String id);
	public List<MemberBean> memberAdminDayConfirmList(String id);
	public List<MemberBean> memberCountMonth();
	public List<ProductBean> productCountMonth();
	public List<OrderBean> ordersCountMonth();
	public List<OrderBean> ordersSumMonth();
	public List<OrderBean> recentOrder();
	public List<ProductBean> topThreeOrder();
	
	// chartSeller
	public List<SellerBean> sellerCountMonth();
	public List<ProductBean> sellerProductCountMonth(String sid);
	public List<OrderBean> sellerOrdersCountMonth(String sid);
	public List<OrderBean> sellerOrdersSumMonth(String sid);
	public List<OrderBean> sellerRecentOrder(String sid);
	public List<ProductBean> sellerTopThreeOrder(String sid);
}
