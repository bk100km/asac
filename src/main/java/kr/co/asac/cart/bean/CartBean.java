package kr.co.asac.cart.bean;

public class CartBean {
	public int cno;
	public String mid;
	public String pcode;
	public String pname;
	public int pprice;
	public int pcount;
	public String pfile;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
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
	@Override
	public String toString() {
		return "CartBean [cno=" + cno + ", mid=" + mid + ", pcode=" + pcode + ", pname=" + pname + ", pprice=" + pprice
				+ ", pcount=" + pcount + ", pfile=" + pfile + "]";
	}
	
	

	
}
