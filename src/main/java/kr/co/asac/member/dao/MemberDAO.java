package kr.co.asac.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.asac.member.bean.MemberBean;
import kr.co.asac.member.bean.SellerBean;

public interface MemberDAO {

	// client
	public String memberClientLoginCheck(MemberBean member);
	public void memberJoin(MemberBean member);
	public int memberIdChk(MemberBean member);
	public MemberBean memberClientInfo(String mid);
	public void memberClientUpdate(MemberBean member);
	public void memberClientDelete(MemberBean vo);
	public int memberClientDelPwC(MemberBean vo);
	
	// seller
	public String memberSellerLoginCheck(SellerBean seller);
	public void memberSellerJoin(SellerBean seller);
	public int meberIdChk(SellerBean seller);
	public SellerBean memberSellerInfo(String sid);
	public void memberSellerUpdate(SellerBean seller);
	public void memberSellerDelete(SellerBean seller);
	
	// admin	
	public List <MemberBean> memberAdminClientList();
	public MemberBean memberAdminClientInfo(String mid);
	public void memberAdminClientUpdate(MemberBean member);
	public void memberAdminClientDelete(String mid);
	public void memberAdminClientInsert(MemberBean member);
	public List <MemberBean> memberAdminClientSearch(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText);
	
	public List <SellerBean> memberAdminSellerList();
	public SellerBean memberAdminSellerInfo(String sid);
	public void memberAdminSellerUpdate(SellerBean seller);
	public void memberAdminSellerDelete(String sid);
	public void memberAdminSellerInsert(SellerBean seller);
	public List <SellerBean> memberAdminSellerSearch(@Param("searchCategory") String searchCategory, @Param("searchText") String searchText);
	public void memberAdminSellerSokCheck(SellerBean seller);
}
