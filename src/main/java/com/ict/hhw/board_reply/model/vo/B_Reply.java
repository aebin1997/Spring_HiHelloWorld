package com.ict.hhw.board_reply.model.vo;

import java.sql.Date;

public class B_Reply implements java.io.Serializable {
	private final static long serialVersionUID = 4577L;
	
	private int b_rid;
	private String b_rcontent;
	private int b_ref_bid;
	private String b_rwriter;
	private Date b_create_date;
	private Date b_modify_date;
	private String b_status;
	
	public B_Reply() {}

	public B_Reply(int b_rid, String b_rcontent, int b_ref_bid, String b_rwriter, Date b_create_date,
			Date b_modify_date, String b_status) {
		super();
		this.b_rid = b_rid;
		this.b_rcontent = b_rcontent;
		this.b_ref_bid = b_ref_bid;
		this.b_rwriter = b_rwriter;
		this.b_create_date = b_create_date;
		this.b_modify_date = b_modify_date;
		this.b_status = b_status;
	}

	public int getB_rid() {
		return b_rid;
	}

	public void setB_rid(int b_rid) {
		this.b_rid = b_rid;
	}

	public String getB_rcontent() {
		return b_rcontent;
	}

	public void setB_rcontent(String b_rcontent) {
		this.b_rcontent = b_rcontent;
	}

	public int getB_ref_bid() {
		return b_ref_bid;
	}

	public void setB_ref_bid(int b_ref_bid) {
		this.b_ref_bid = b_ref_bid;
	}

	public String getB_rwriter() {
		return b_rwriter;
	}

	public void setB_rwriter(String b_rwriter) {
		this.b_rwriter = b_rwriter;
	}

	public Date getB_create_date() {
		return b_create_date;
	}

	public void setB_create_date(Date b_create_date) {
		this.b_create_date = b_create_date;
	}

	public Date getB_modify_date() {
		return b_modify_date;
	}

	public void setB_modify_date(Date b_modify_date) {
		this.b_modify_date = b_modify_date;
	}

	public String getB_status() {
		return b_status;
	}

	public void setB_status(String b_status) {
		this.b_status = b_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "B_Reply [b_rid=" + b_rid + ", b_rcontent=" + b_rcontent + ", b_ref_bid=" + b_ref_bid + ", b_rwriter="
				+ b_rwriter + ", b_create_date=" + b_create_date + ", b_modify_date=" + b_modify_date + ", b_status="
				+ b_status + "]";
	}

}
