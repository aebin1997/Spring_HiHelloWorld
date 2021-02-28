package com.ict.hhw.board.model.vo;

import java.sql.Date;

public class Board {
	private final static long serialVersionUID = 3333L;
	
	private int bid;
	private String btype;
	private String btitle;
	private String bwriter;
	private String bcontent;
	private String b_original_filename;
	private String b_rename_filename;
	private int bcount;
	private int b_rcount;
	private Date b_create_date;
	private Date b_modfiy_date;
	private String bstatus;
	
	public Board() {}

	public Board(int bid, String btype, String btitle, String bwriter, String bcontent, String b_original_filename,
			String b_rename_filename, int bcount, int b_rcount, Date b_create_date, Date b_modfiy_date, String bstatus) {
		super();
		this.bid = bid;
		this.btype = btype;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.bcontent = bcontent;
		this.b_original_filename = b_original_filename;
		this.b_rename_filename = b_rename_filename;
		this.bcount = bcount;
		this.b_rcount = b_rcount;
		this.b_create_date = b_create_date;
		this.b_modfiy_date = b_modfiy_date;
		this.bstatus = bstatus;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getB_original_filename() {
		return b_original_filename;
	}

	public void setB_original_filename(String b_original_filename) {
		this.b_original_filename = b_original_filename;
	}

	public String getB_rename_filename() {
		return b_rename_filename;
	}

	public void setB_rename_filename(String b_rename_filename) {
		this.b_rename_filename = b_rename_filename;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public int getB_rcount() {
		return b_rcount;
	}

	public void setB_rcount(int b_rcount) {
		this.b_rcount = b_rcount;
	}

	public Date getB_create_date() {
		return b_create_date;
	}

	public void setB_create_date(Date b_create_date) {
		this.b_create_date = b_create_date;
	}

	public Date getB_modfiy_date() {
		return b_modfiy_date;
	}

	public void setB_modfiy_date(Date b_modfiy_date) {
		this.b_modfiy_date = b_modfiy_date;
	}

	public String getBstatus() {
		return bstatus;
	}

	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Board [bid=" + bid + ", btype=" + btype + ", btitle=" + btitle + ", bwriter=" + bwriter + ", bcontent="
				+ bcontent + ", b_original_filename=" + b_original_filename + ", b_rename_filename=" + b_rename_filename
				+ ", bcount=" + bcount + ", b_rcount=" + b_rcount + ", b_create_date=" + b_create_date
				+ ", b_modfiy_date=" + b_modfiy_date + ", bstatus=" + bstatus + "]";
	}

}
