package kr.co.asac.review.bean;

import java.util.Date;

public class ReviewBean {
	
	
	private String pcode;
	private String mid;
	private int rnum;
	private int rrate;
	private Date rdate;
	private String rtitle;
	private String rcontent;
	private String rfile;
	private String sid;
	private String ranswer;
	private Date adate;  
	
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getRanswer() {
		return ranswer;
	}
	public void setRanswer(String ranswer) {
		this.ranswer = ranswer;
	}
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getRrate() {
		return rrate;
	}
	public void setRrate(int rrate) {
		this.rrate = rrate;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRfile() {
		return rfile;
	}
	public void setRfile(String rfile) {
		this.rfile = rfile;
	}
	@Override
	public String toString() {
		return "ReviewBean [pcode=" + pcode + ", mid=" + mid + ", rnum=" + rnum + ", rrate=" + rrate + ", rdate="
				+ rdate + ", rtitle=" + rtitle + ", rcontent=" + rcontent + ", rfile=" + rfile + ", sid=" + sid
				+ ", ranswer=" + ranswer + ", adate=" + adate + "]";
	}


}
