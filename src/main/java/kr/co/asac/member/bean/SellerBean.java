package kr.co.asac.member.bean;

import org.springframework.web.multipart.MultipartFile;

public class SellerBean {
	private String sid;
	private String spwd;
	private String sname;
	private String sbirth;
	private String sphone;
	private String saddr;
	private String saddrd;
	private String saddrz;
	private String smail;
	private String sregdate;
	private String scompany;
	private String snumber;
	private String sfile;
	private String sok;
	
	private String month;
	private int count;
	
	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSpwd() {
		return spwd;
	}

	public void setSpwd(String spwd) {
		this.spwd = spwd;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSbirth() {
		return sbirth;
	}

	public void setSbirth(String sbirth) {
		this.sbirth = sbirth;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSaddr() {
		return saddr;
	}

	public void setSaddr(String saddr) {
		this.saddr = saddr;
	}

	public String getSaddrd() {
		return saddrd;
	}

	public void setSaddrd(String saddrd) {
		this.saddrd = saddrd;
	}

	public String getSaddrz() {
		return saddrz;
	}

	public void setSaddrz(String saddrz) {
		this.saddrz = saddrz;
	}

	public String getSmail() {
		return smail;
	}

	public void setSmail(String smail) {
		this.smail = smail;
	}

	public String getSregdate() {
		return sregdate;
	}

	public void setSregdate(String sregdate) {
		this.sregdate = sregdate;
	}

	public String getScompany() {
		return scompany;
	}

	public void setScompany(String scompany) {
		this.scompany = scompany;
	}

	public String getSnumber() {
		return snumber;
	}

	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}

	public String getSfile() {
		return sfile;
	}

	public void setSfile(String sfile) {
		this.sfile = sfile;
	}

	public String getSok() {
		return sok;
	}

	public void setSok(String sok) {
		this.sok = sok;
	}

	@Override
	public String toString() {
		return "SellerBean [sid=" + sid + ", spwd=" + spwd + ", sname=" + sname + ", sbirth=" + sbirth + ", sphone="
				+ sphone + ", saddr=" + saddr + ", saddrd=" + saddrd + ", saddrz=" + saddrz + ", smail=" + smail
				+ ", sregdate=" + sregdate + ", scompany=" + scompany + ", snumber=" + snumber + ", sfile=" + sfile
				+ ", sok=" + sok + "]";
	}
}
