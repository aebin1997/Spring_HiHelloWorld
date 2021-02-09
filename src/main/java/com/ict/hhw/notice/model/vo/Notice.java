package com.ict.hhw.notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable {
	private static final long serialVersionUID = 2222L;
	
	private int nid;
	private String ntype;
	private String nwriter;
	private String ntitle;
	private String ncontent;
	private String n_file_name;
	private String n_rfile_name;
	private Date n_date;
	private Date n_modify_date;
	private int ncount;
	private String nstatus;
	
	public Notice() {}

	public Notice(int nid, String ntype, String nwriter, String ntitle, String ncontent, String n_file_name,
			String n_rfile_name, Date n_date, Date n_modify_date, int ncount, String nstatus) {
		super();
		this.nid = nid;
		this.ntype = ntype;
		this.nwriter = nwriter;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.n_file_name = n_file_name;
		this.n_rfile_name = n_rfile_name;
		this.n_date = n_date;
		this.n_modify_date = n_modify_date;
		this.ncount = ncount;
		this.nstatus = nstatus;
	}

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public String getNtype() {
		return ntype;
	}

	public void setNtype(String ntype) {
		this.ntype = ntype;
	}

	public String getNwriter() {
		return nwriter;
	}

	public void setNwriter(String nwriter) {
		this.nwriter = nwriter;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getN_file_name() {
		return n_file_name;
	}

	public void setN_file_name(String n_file_name) {
		this.n_file_name = n_file_name;
	}

	public String getN_rfile_name() {
		return n_rfile_name;
	}

	public void setN_rfile_name(String n_rfile_name) {
		this.n_rfile_name = n_rfile_name;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	public Date getN_modify_date() {
		return n_modify_date;
	}

	public void setN_modify_date(Date n_modify_date) {
		this.n_modify_date = n_modify_date;
	}

	public int getNcount() {
		return ncount;
	}

	public void setNcount(int ncount) {
		this.ncount = ncount;
	}

	public String getNstatus() {
		return nstatus;
	}

	public void setNstatus(String nstatus) {
		this.nstatus = nstatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [nid=" + nid + ", ntype=" + ntype + ", nwriter=" + nwriter + ", ntitle=" + ntitle + ", ncontent="
				+ ncontent + ", n_file_name=" + n_file_name + ", n_rfile_name=" + n_rfile_name + ", n_date=" + n_date
				+ ", n_modify_date=" + n_modify_date + ", ncount=" + ncount + ", nstatus=" + nstatus + "]";
	}

}
