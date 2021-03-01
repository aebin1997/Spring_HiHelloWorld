package com.ict.hhw.review_reply.model.vo;

import java.sql.Date;

public class Re_reply {
	private final static long serialVersionUID = 9976L;
	
	private int rid;
	private int ref_rid;
	private String rcontent;
	private String rwriter;
	private Date r_create_date;
	private Date r_modify_date;
	private String r_status;
	
	public Re_reply() {}

	public Re_reply(int rid, int ref_rid, String rcontent, String rwriter, Date r_create_date, Date r_modify_date,
			String r_status) {
		super();
		this.rid = rid;
		this.ref_rid = ref_rid;
		this.rcontent = rcontent;
		this.rwriter = rwriter;
		this.r_create_date = r_create_date;
		this.r_modify_date = r_modify_date;
		this.r_status = r_status;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getRef_rid() {
		return ref_rid;
	}

	public void setRef_rid(int ref_rid) {
		this.ref_rid = ref_rid;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRwriter() {
		return rwriter;
	}

	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}

	public Date getR_create_date() {
		return r_create_date;
	}

	public void setR_create_date(Date r_create_date) {
		this.r_create_date = r_create_date;
	}

	public Date getR_modify_date() {
		return r_modify_date;
	}

	public void setR_modify_date(Date r_modify_date) {
		this.r_modify_date = r_modify_date;
	}

	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Re_reply [rid=" + rid + ", ref_rid=" + ref_rid + ", rcontent=" + rcontent + ", rwriter=" + rwriter
				+ ", r_create_date=" + r_create_date + ", r_modify_date=" + r_modify_date + ", r_status=" + r_status
				+ "]";
	}
	
}
