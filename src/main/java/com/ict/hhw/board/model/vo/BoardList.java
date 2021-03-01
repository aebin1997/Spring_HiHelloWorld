package com.ict.hhw.board.model.vo;

import java.sql.Date;

import com.ict.hhw.board_reply.model.vo.B_Reply;

public class BoardList {
	private final static long serialVersionUID = 3943L;
	
	private int bid;
	private int b_ref_bid;
	private String btype;
	private String btitle;
	private String bwriter;
	private String b_original_filename;
	private String b_rename_filename;
	private Date b_create_date;
	private int bcount;
	private String grade;
	
	public BoardList() {}

	public BoardList(int bid, int b_ref_bid, String btype, String btitle, String bwriter, String b_original_filename,
			String b_rename_filename, Date b_create_date, int bcount, String grade) {
		super();
		this.bid = bid;
		this.b_ref_bid = b_ref_bid;
		this.btype = btype;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.b_original_filename = b_original_filename;
		this.b_rename_filename = b_rename_filename;
		this.b_create_date = b_create_date;
		this.bcount = bcount;
		this.grade = grade;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getB_ref_bid() {
		return b_ref_bid;
	}

	public void setB_ref_bid(int b_ref_bid) {
		this.b_ref_bid = b_ref_bid;
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

	public Date getB_create_date() {
		return b_create_date;
	}

	public void setB_create_date(Date b_create_date) {
		this.b_create_date = b_create_date;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BoardList [bid=" + bid + ", b_ref_bid=" + b_ref_bid + ", btype=" + btype + ", btitle=" + btitle
				+ ", bwriter=" + bwriter + ", b_original_filename=" + b_original_filename + ", b_rename_filename="
				+ b_rename_filename + ", b_create_date=" + b_create_date + ", bcount=" + bcount + ", grade=" + grade
				+ "]";
	}


	
}
