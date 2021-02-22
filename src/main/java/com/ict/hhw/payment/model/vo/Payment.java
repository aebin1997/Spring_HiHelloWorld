package com.ict.hhw.payment.model.vo;

import java.sql.Date;

public class Payment {
	private final static long serialVersionUID = 9999L;
	
	private int payid;
	private String memberid;
	private String paypg;
	private String payinfo;
	private Date paydate;
	private String payip;
	
	public Payment() {}

	public Payment(int payid, String memberid, String paypg, String payinfo, Date paydate, String payip) {
		super();
		this.payid = payid;
		this.memberid = memberid;
		this.paypg = paypg;
		this.payinfo = payinfo;
		this.paydate = paydate;
		this.payip = payip;
	}

	public int getPayid() {
		return payid;
	}

	public void setPayid(int payid) {
		this.payid = payid;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getPaypg() {
		return paypg;
	}

	public void setPaypg(String paypg) {
		this.paypg = paypg;
	}

	public String getPayinfo() {
		return payinfo;
	}

	public void setPayinfo(String payinfo) {
		this.payinfo = payinfo;
	}

	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public String getPayip() {
		return payip;
	}

	public void setPayip(String payip) {
		this.payip = payip;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Payment [payid=" + payid + ", memberid=" + memberid + ", paypg=" + paypg + ", payinfo=" + payinfo
				+ ", paydate=" + paydate + ", payip=" + payip + "]";
	}
	
}
