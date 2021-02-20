package com.ict.hhw.notice.model.vo;

import java.sql.Date;

public class Notice {
	private final static long serialVersionUID = 2233L;
	
	private int nid;
	private String ntype;
	private String nwriter;
	private String ntitle;
	private String ncontent;
	private String n_file_name;
	private String n_rfile_name;
	private Date n_date;
	private Date n_modfiy_date;
	private int ncount;
	private String nstatus;
	
	public Notice() {}

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

	public Date getN_modfiy_date() {
		return n_modfiy_date;
	}

	public void setN_modfiy_date(Date n_modfiy_date) {
		this.n_modfiy_date = n_modfiy_date;
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
				+ ", n_modfiy_date=" + n_modfiy_date + ", ncount=" + ncount + ", nstatus=" + nstatus + "]";
	}

}
