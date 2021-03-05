package com.ict.hhw.payment.model.vo;

import java.sql.Date;

public class Payment {
	private final static long serialVersionUID = 9999L;
	
	private int payid;
	private String member;
	private String sort;
	private int price;
	private String paypg;
	private Date paydate;
	
	public Payment() {}

	public Payment(int payid, String member, String sort, int price, String paypg, Date paydate) {
		super();
		this.payid = payid;
		this.member = member;
		this.sort = sort;
		this.price = price;
		this.paypg = paypg;
		this.paydate = paydate;
	}

	public int getPayid() {
		return payid;
	}

	public void setPayid(int payid) {
		this.payid = payid;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPaypg() {
		return paypg;
	}

	public void setPaypg(String paypg) {
		this.paypg = paypg;
	}

	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Payment [payid=" + payid + ", member=" + member + ", sort=" + sort + ", price=" + price + ", paypg="
				+ paypg + ", paydate=" + paydate + "]";
	}

}