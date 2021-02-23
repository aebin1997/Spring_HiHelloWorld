package com.ict.hhw.blame.model.vo;

import java.sql.Date;

public class Blame {
	private final static long serialVersionUID = 4312L;
	
	private int blame_no; 				//신고번호
	private int blame_bid;				//신고 게시물의 번호
	private String blame_type;			//신고 글 구분
	private String mm_nickname;			//신고회원
	private String target_nickname;		//신고 당한 회원
	private Date blame_date;			//신고번호 일자
	private String blame_content;		//신고자 신고내용
	private String blame_ip;			//신고자 IP

	public Blame() {}

	public int getBlame_no() {
		return blame_no;
	}

	public void setBlame_no(int blame_no) {
		this.blame_no = blame_no;
	}

	public int getBlame_bid() {
		return blame_bid;
	}

	public void setBlame_bid(int blame_bid) {
		this.blame_bid = blame_bid;
	}

	public String getBlame_type() {
		return blame_type;
	}

	public void setBlame_type(String blame_type) {
		this.blame_type = blame_type;
	}

	public String getMm_nickname() {
		return mm_nickname;
	}

	public void setMm_nickname(String mm_nickname) {
		this.mm_nickname = mm_nickname;
	}

	public String getTarget_nickname() {
		return target_nickname;
	}

	public void setTarget_nickname(String target_nickname) {
		this.target_nickname = target_nickname;
	}

	public Date getBlame_date() {
		return blame_date;
	}

	public void setBlame_date(Date blame_date) {
		this.blame_date = blame_date;
	}

	public String getBlame_content() {
		return blame_content;
	}

	public void setBlame_content(String blame_content) {
		this.blame_content = blame_content;
	}

	public String getBlame_ip() {
		return blame_ip;
	}

	public void setBlame_ip(String blame_ip) {
		this.blame_ip = blame_ip;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Blame [blame_no=" + blame_no + ", blame_bid=" + blame_bid + ", blame_type=" + blame_type
				+ ", mm_nickname=" + mm_nickname + ", target_nickname=" + target_nickname + ", blame_date=" + blame_date
				+ ", blame_content=" + blame_content + ", blame_ip=" + blame_ip + "]";
	}


}
