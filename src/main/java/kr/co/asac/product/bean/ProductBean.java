package kr.co.asac.product.bean;

import java.util.Date;

public class ProductBean {
	private String pcode;
	private String pname;
	private int price;
	private String pcate;
	private String ptag;
	private String pfile;
	private String pcontent;
	private Date pregdate;
	private String sid;
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPcate() {
		return pcate;
	}
	public void setPcate(String pcate) {
		this.pcate = pcate;
	}
	public String getPtag() {
		return ptag;
	}
	public void setPtag(String ptag) {
		this.ptag = ptag;
	}
	public String getPfile() {
		return pfile;
	}
	public void setPfile(String pfile) {
		this.pfile = pfile;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public Date getPregdate() {
		return pregdate;
	}
	public void setPregdate(Date pregdate) {
		this.pregdate = pregdate;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	@Override
	public String toString() {
		return "ProductBean [pcode=" + pcode + ", pname=" + pname + ", price=" + price + ", pcate=" + pcate + ", ptag="
				+ ptag + ", pfile=" + pfile + ", pcontent=" + pcontent + ", pregdate=" + pregdate + ", sid=" + sid
				+ "]";
	}
}
