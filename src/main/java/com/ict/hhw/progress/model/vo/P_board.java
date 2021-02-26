package com.ict.hhw.progress.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class P_board implements Serializable{
	private final static long serialVersionUID = 9999L;
	
	private int pid;
	private int p_proid;
	private String pwriter;
	private String ptitle;
	private String pcontent;
	private String p_file_name;
	private String p_rfile_name;
	private Date p_date;
	private Date p_modify_date;
	private int pcount;
	private String pstatus;

	public P_board() {}

	public P_board(int pid, int p_proid, String pwriter, String ptitle, String pcontent, String p_file_name,
			String p_rfile_name, Date p_date, Date p_modify_date, int pcount, String pstatus) {
		super();
		this.pid = pid;
		this.p_proid = p_proid;
		this.pwriter = pwriter;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.p_file_name = p_file_name;
		this.p_rfile_name = p_rfile_name;
		this.p_date = p_date;
		this.p_modify_date = p_modify_date;
		this.pcount = pcount;
		this.pstatus = pstatus;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getP_proid() {
		return p_proid;
	}

	public void setP_proid(int p_proid) {
		this.p_proid = p_proid;
	}

	public String getPwriter() {
		return pwriter;
	}

	public void setPwriter(String pwriter) {
		this.pwriter = pwriter;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getP_file_name() {
		return p_file_name;
	}

	public void setP_file_name(String p_file_name) {
		this.p_file_name = p_file_name;
	}

	public String getP_rfile_name() {
		return p_rfile_name;
	}

	public void setP_rfile_name(String p_rfile_name) {
		this.p_rfile_name = p_rfile_name;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public Date getP_modify_date() {
		return p_modify_date;
	}

	public void setP_modify_date(Date p_modify_date) {
		this.p_modify_date = p_modify_date;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "P_board [pid=" + pid + ", p_proid=" + p_proid + ", pwriter=" + pwriter + ", ptitle=" + ptitle
				+ ", pcontent=" + pcontent + ", p_file_name=" + p_file_name + ", p_rfile_name=" + p_rfile_name
				+ ", p_date=" + p_date + ", p_modify_date=" + p_modify_date + ", pcount=" + pcount + ", pstatus="
				+ pstatus + "]";
	}
	
}
