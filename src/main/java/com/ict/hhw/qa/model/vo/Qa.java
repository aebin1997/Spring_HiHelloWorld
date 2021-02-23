package com.ict.hhw.qa.model.vo;

import java.sql.Date;

public class Qa {
	private final static long serialVersionUID = 5555L;
	
	private int qa_id;
	private String qa_title;
	private String qa_writer;
	private String qa_content;
	private int qa_point;
	private String qa_origin_file_name;
	private String qa_rename_file_name;
	private int qa_readcount;
	private Date qa_create_date;
	private Date qa_modify_date;
	private String qa_status;
	
	public Qa() {}

	public Qa(int qa_id, String qa_title, String qa_writer, String qa_content, int qa_point, String qa_origin_file_name,
			String qa_rename_file_name, int qa_readcount, Date qa_create_date, Date qa_modify_date, String qa_status) {
		super();
		this.qa_id = qa_id;
		this.qa_title = qa_title;
		this.qa_writer = qa_writer;
		this.qa_content = qa_content;
		this.qa_point = qa_point;
		this.qa_origin_file_name = qa_origin_file_name;
		this.qa_rename_file_name = qa_rename_file_name;
		this.qa_readcount = qa_readcount;
		this.qa_create_date = qa_create_date;
		this.qa_modify_date = qa_modify_date;
		this.qa_status = qa_status;
	}

	public int getQa_id() {
		return qa_id;
	}

	public void setQa_id(int qa_id) {
		this.qa_id = qa_id;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public String getQa_writer() {
		return qa_writer;
	}

	public void setQa_writer(String qa_writer) {
		this.qa_writer = qa_writer;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public int getQa_point() {
		return qa_point;
	}

	public void setQa_point(int qa_point) {
		this.qa_point = qa_point;
	}

	public String getQa_origin_file_name() {
		return qa_origin_file_name;
	}

	public void setQa_origin_file_name(String qa_origin_file_name) {
		this.qa_origin_file_name = qa_origin_file_name;
	}

	public String getQa_rename_file_name() {
		return qa_rename_file_name;
	}

	public void setQa_rename_file_name(String qa_rename_file_name) {
		this.qa_rename_file_name = qa_rename_file_name;
	}

	public int getQa_readcount() {
		return qa_readcount;
	}

	public void setQa_readcount(int qa_readcount) {
		this.qa_readcount = qa_readcount;
	}

	public Date getQa_create_date() {
		return qa_create_date;
	}

	public void setQa_create_date(Date qa_create_date) {
		this.qa_create_date = qa_create_date;
	}

	public Date getQa_modify_date() {
		return qa_modify_date;
	}

	public void setQa_modify_date(Date qa_modify_date) {
		this.qa_modify_date = qa_modify_date;
	}

	public String getQa_status() {
		return qa_status;
	}

	public void setQa_status(String qa_status) {
		this.qa_status = qa_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Qa [qa_id=" + qa_id + ", qa_title=" + qa_title + ", qa_writer=" + qa_writer + ", qa_content="
				+ qa_content + ", qa_point=" + qa_point + ", qa_origin_file_name=" + qa_origin_file_name
				+ ", qa_rename_file_name=" + qa_rename_file_name + ", qa_readcount=" + qa_readcount
				+ ", qa_create_date=" + qa_create_date + ", qa_modify_date=" + qa_modify_date + ", qa_status="
				+ qa_status + "]";
	}

	

	
	
	
}
