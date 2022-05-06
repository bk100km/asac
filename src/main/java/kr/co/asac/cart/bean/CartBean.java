package kr.co.asac.cart.bean;

import java.util.Date;

public class CartBean {
	private int ccode;
	private String mid;
	private String pcode;
	private String pname;
	private int pprice;
	private int pcount;
	private String pfile;
	private String sid;
	private Date cregdate;

	
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getPfile() {
		return pfile;
	}
	public void setPfile(String pfile) {
		this.pfile = pfile;
	}
	
	
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	
	
	public Date getCregdate() {
		return cregdate;
	}
	public void setCregdate(Date cregdate) {
		this.cregdate = cregdate;
	}
	@Override
	public String toString() {
		return "CartBean [ccode=" + ccode + ", mid=" + mid + ", pcode=" + pcode + ", pname=" + pname + ", pprice="
				+ pprice + ", pcount=" + pcount + ", pfile=" + pfile + "]";
	}
	
	
	
	

	
}
