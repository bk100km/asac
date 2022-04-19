package kr.co.asac.orders.bean;

import java.util.Date;

public class OrderBean {
	private String ocode;
	private String sid;
	private String mid;
	private String pcode;
	private int ocount;
	private String oname;
	private String oaddrz;
	private String oaddr;
	private String oaddrd;
	private String ophone;
	private int ototal;
	private String omessage;
	private String odelivery;
	private String oconfirmed;
	private Date oregdate;
	private String pname;
	private int pprice;
	private String mname;
	private String maddrz;
	private String maddr;
	private String maddrd;
	private String mphone;
	private String pfile;

	private String daterange;
	private int count;
	private int week;
	private int month;
	private int total;
	private Date date;
	private String pcate;

	public String getOcode() {
		return ocode;
	}

	public void setOcode(String ocode) {
		this.ocode = ocode;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
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

	public int getOcount() {
		return ocount;
	}

	public void setOcount(int ocount) {
		this.ocount = ocount;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOaddrz() {
		return oaddrz;
	}

	public void setOaddrz(String oaddrz) {
		this.oaddrz = oaddrz;
	}

	public String getOaddr() {
		return oaddr;
	}

	public void setOaddr(String oaddr) {
		this.oaddr = oaddr;
	}

	public String getOaddrd() {
		return oaddrd;
	}

	public void setOaddrd(String oaddrd) {
		this.oaddrd = oaddrd;
	}

	public String getOphone() {
		return ophone;
	}

	public void setOphone(String ophone) {
		this.ophone = ophone;
	}

	public int getOtotal() {
		return ototal;
	}

	public void setOtotal(int ototal) {
		this.ototal = ototal;
	}

	public String getOmessage() {
		return omessage;
	}

	public void setOmessage(String omessage) {
		this.omessage = omessage;
	}

	public Date getOregdate() {
		return oregdate;
	}

	public void setOregdate(Date oregdate) {
		this.oregdate = oregdate;
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

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getMaddrz() {
		return maddrz;
	}

	public void setMaddrz(String maddrz) {
		this.maddrz = maddrz;
	}

	public String getMaddrd() {
		return maddrd;
	}

	public void setMaddrd(String maddrd) {
		this.maddrd = maddrd;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getDaterange() {
		return daterange;
	}

	public void setDaterange(String daterange) {
		this.daterange = daterange;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public String getPcate() {
		return pcate;
	}

	public void setPcate(String pcate) {
		this.pcate = pcate;
	}

	public String getOdelivery() {
		return odelivery;
	}

	public void setOdelivery(String odelivery) {
		this.odelivery = odelivery;
	}

	public String getOconfirmed() {
		return oconfirmed;
	}

	public void setOconfirmed(String oconfirmed) {
		this.oconfirmed = oconfirmed;
	}

	public String getPfile() {
		return pfile;
	}

	public void setPfile(String pfile) {
		this.pfile = pfile;
	}

	@Override
	public String toString() {
		return "OrderBean [ocode=" + ocode + ", sid=" + sid + ", mid=" + mid + ", pcode=" + pcode + ", ocount=" + ocount
				+ ", oname=" + oname + ", oaddrz=" + oaddrz + ", oaddr=" + oaddr + ", oaddrd=" + oaddrd + ", ophone="
				+ ophone + ", ototal=" + ototal + ", omessage=" + omessage + ", odelivery=" + odelivery
				+ ", oconfirmed=" + oconfirmed + ", oregdate=" + oregdate + ", pname=" + pname + ", pprice=" + pprice
				+ ", mname=" + mname + ", maddrz=" + maddrz + ", maddr=" + maddr + ", maddrd=" + maddrd + ", mphone="
				+ mphone + ", pfile=" + pfile + ", daterange=" + daterange + ", count=" + count + ", week=" + week
				+ ", month=" + month + ", total=" + total + ", date=" + date + ", pcate=" + pcate + "]";
	}

}
