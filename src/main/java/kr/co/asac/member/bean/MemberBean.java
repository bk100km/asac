package kr.co.asac.member.bean;

public class MemberBean {
	private String mid;
	private String mpwd;
	private String mname;
	private String mbirth;
	private String mphone;
	private String maddr;
	private String maddrd;
	private String maddrz;
	private String mmail;
	private String mregdate;
	private String referer;
	private String month;
	
	//referer
	public String getReferer() {
		return referer;
	}
	public void setReferer(String referer) {
		this.referer = referer;
	}

	private int count;
	
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
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
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMaddrd() {
		return maddrd;
	}
	public void setMaddrd(String maddrd) {
		this.maddrd = maddrd;
	}
	public String getMaddrz() {
		return maddrz;
	}
	public void setMaddrz(String maddrz) {
		this.maddrz = maddrz;
	}
	public String getMmail() {
		return mmail;
	}
	public void setMmail(String mmail) {
		this.mmail = mmail;
	}
	public String getMregdate() {
		return mregdate;
	}
	public void setMregdate(String mregdate) {
		this.mregdate = mregdate;
	}
	
	@Override
	public String toString() {
		return "MemberBean [mid=" + mid + ", mpwd=" + mpwd + ", mname=" + mname + ", mbirth=" + mbirth + ", mphone="
				+ mphone + ", maddr=" + maddr + ", maddrd=" + maddrd + ", maddrz=" + maddrz + ", mmail=" + mmail
				+ ", mregdate=" + mregdate + "]";
	}
	
	public void initMember() {
		this.mid = "";
		this.mpwd = "";
		this.mname = "";
		this.mbirth = "";
		this.mphone = "";
		this.maddr = "";
		this.maddrd = "";
		this.maddrz = "";
		this.mmail = "";
	}
}
