package kr.co.asac.product.bean;

public class ProductBean {
	private String pcode;
	private String pname;
	private int pprice;
	private String pcate;
	private String ptag;
	private String pfile;
	private String pcontent;
	private String pregdate;
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
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
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
	public String getPregdate() {
		return pregdate;
	}
	public void setPregdate(String pregdate) {
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
		return "ProductBean [pcode=" + pcode + ", pname=" + pname + ", pprice=" + pprice + ", pcate=" + pcate + ", ptag="
				+ ptag + ", pfile=" + pfile + ", pcontent=" + pcontent + ", pregdate=" + pregdate + ", sid=" + sid
				+ "]";
	}
}
