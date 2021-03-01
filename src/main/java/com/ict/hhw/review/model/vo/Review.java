package com.ict.hhw.review.model.vo;

import java.sql.Date;

public class Review {
	private final static long serialVersionUID = 9977L;

	private int rid;
	private int ref_proid;
	private int ref_qid;
	private String rtitle;
	private String rwriter;
	private String rcontent;
	private String r_original_filename;
	private String r_rename_filename;
	private int rcount;
	private Date r_create_date;
	private Date r_modify_date;
	private String r_status;
	
	public Review() {}

	public Review(int rid, int ref_proid, int ref_qid, String rtitle, String rwriter, String rcontent,
			String r_original_filename, String r_rename_filename, int rcount, Date r_create_date, Date r_modify_date,
			String r_status) {
		super();
		this.rid = rid;
		this.ref_proid = ref_proid;
		this.ref_qid = ref_qid;
		this.rtitle = rtitle;
		this.rwriter = rwriter;
		this.rcontent = rcontent;
		this.r_original_filename = r_original_filename;
		this.r_rename_filename = r_rename_filename;
		this.rcount = rcount;
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

	public int getRef_proid() {
		return ref_proid;
	}

	public void setRef_proid(int ref_proid) {
		this.ref_proid = ref_proid;
	}

	public int getRef_qid() {
		return ref_qid;
	}

	public void setRef_qid(int ref_qid) {
		this.ref_qid = ref_qid;
	}

	public String getRtitle() {
		return rtitle;
	}

	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}

	public String getRwriter() {
		return rwriter;
	}

	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getR_original_filename() {
		return r_original_filename;
	}

	public void setR_original_filename(String r_original_filename) {
		this.r_original_filename = r_original_filename;
	}

	public String getR_rename_filename() {
		return r_rename_filename;
	}

	public void setR_rename_filename(String r_rename_filename) {
		this.r_rename_filename = r_rename_filename;
	}

	public int getRcount() {
		return rcount;
	}

	public void setRcount(int rcount) {
		this.rcount = rcount;
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
		return "Review [rid=" + rid + ", ref_proid=" + ref_proid + ", ref_qid=" + ref_qid + ", rtitle=" + rtitle
				+ ", rwriter=" + rwriter + ", rcontent=" + rcontent + ", r_original_filename=" + r_original_filename
				+ ", r_rename_filename=" + r_rename_filename + ", rcount=" + rcount + ", r_create_date=" + r_create_date
				+ ", r_modify_date=" + r_modify_date + ", r_status=" + r_status + "]";
	}
	
}
