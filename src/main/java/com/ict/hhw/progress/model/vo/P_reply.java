package com.ict.hhw.progress.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class P_reply implements Serializable{
	private final static long serialVersionUID = 9999L;
	
	private int prid;
	private int ref_pid;
	private String prcontent;
	private String prwriter;
	private Date pr_date;
	private Date pr_modify_date;
	private String pr_status;
	
	public P_reply() {
	}

	public P_reply(int prid, int ref_pid, String prcontent, String prwriter, Date pr_date, Date pr_modify_date,
			String pr_status) {
		super();
		this.prid = prid;
		this.ref_pid = ref_pid;
		this.prcontent = prcontent;
		this.prwriter = prwriter;
		this.pr_date = pr_date;
		this.pr_modify_date = pr_modify_date;
		this.pr_status = pr_status;
	}

	public int getPrid() {
		return prid;
	}

	public void setPrid(int prid) {
		this.prid = prid;
	}

	public int getRef_pid() {
		return ref_pid;
	}

	public void setRef_pid(int ref_pid) {
		this.ref_pid = ref_pid;
	}

	public String getPrcontent() {
		return prcontent;
	}

	public void setPrcontent(String prcontent) {
		this.prcontent = prcontent;
	}

	public String getPrwriter() {
		return prwriter;
	}

	public void setPrwriter(String prwriter) {
		this.prwriter = prwriter;
	}

	public Date getPr_date() {
		return pr_date;
	}

	public void setPr_date(Date pr_date) {
		this.pr_date = pr_date;
	}

	public Date getPr_modify_date() {
		return pr_modify_date;
	}

	public void setPr_modify_date(Date pr_modify_date) {
		this.pr_modify_date = pr_modify_date;
	}

	public String getPr_status() {
		return pr_status;
	}

	public void setPr_status(String pr_status) {
		this.pr_status = pr_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "P_reply [prid=" + prid + ", ref_pid=" + ref_pid + ", prcontent=" + prcontent + ", prwriter=" + prwriter
				+ ", pr_date=" + pr_date + ", pr_modify_date=" + pr_modify_date + ", pr_status=" + pr_status + "]";
	}
	
}
