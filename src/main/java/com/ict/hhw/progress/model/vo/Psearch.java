package com.ict.hhw.progress.model.vo;

import java.sql.Date;

public class Psearch {
	private final static long serialVersionUID = 9997L;
	
	private String keyword;
	private int p_proid;
	private Date begin;
	private Date end;
	
	public Psearch() {}

	public Psearch(String keyword, int p_proid, Date begin, Date end) {
		super();
		this.keyword = keyword;
		this.p_proid = p_proid;
		this.begin = begin;
		this.end = end;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getP_proid() {
		return p_proid;
	}

	public void setP_proid(int p_proid) {
		this.p_proid = p_proid;
	}

	public Date getBegin() {
		return begin;
	}

	public void setBegin(Date begin) {
		this.begin = begin;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "Psearch [keyword=" + keyword + ", p_proid=" + p_proid + ", begin=" + begin + ", end=" + end + "]";
	}
	
}