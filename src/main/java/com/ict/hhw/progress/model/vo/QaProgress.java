package com.ict.hhw.progress.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QaProgress implements Serializable{
	private final static long serialVersionUID = 8889L;
	
	private int pro_id;
	private int pro_qid;
	private String qa_title;
	private String qa_content;
	private String pro_writer;
	private String pro_answerer;
	private String qa_origin_file_name;
	private String qa_rename_file_name;
	private Date qa_create_date;
	private Date pro_deadline;
	private int pro_pay;
	private int pro_process;
	private String qa_status;
	private String pro_status;
	
	
	public QaProgress() {}


	public QaProgress(int pro_id, int pro_qid, String qa_title, String qa_content, String pro_writer,
			String pro_answerer, String qa_origin_file_name, String qa_rename_file_name, Date qa_create_date,
			Date pro_deadline, int pro_pay, int pro_process, String qa_status, String pro_status) {
		super();
		this.pro_id = pro_id;
		this.pro_qid = pro_qid;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.pro_writer = pro_writer;
		this.pro_answerer = pro_answerer;
		this.qa_origin_file_name = qa_origin_file_name;
		this.qa_rename_file_name = qa_rename_file_name;
		this.qa_create_date = qa_create_date;
		this.pro_deadline = pro_deadline;
		this.pro_pay = pro_pay;
		this.pro_process = pro_process;
		this.qa_status = qa_status;
		this.pro_status = pro_status;
	}


	public int getPro_id() {
		return pro_id;
	}


	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}


	public int getPro_qid() {
		return pro_qid;
	}


	public void setPro_qid(int pro_qid) {
		this.pro_qid = pro_qid;
	}


	public String getQa_title() {
		return qa_title;
	}


	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}


	public String getQa_content() {
		return qa_content;
	}


	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}


	public String getPro_writer() {
		return pro_writer;
	}


	public void setPro_writer(String pro_writer) {
		this.pro_writer = pro_writer;
	}


	public String getPro_answerer() {
		return pro_answerer;
	}


	public void setPro_answerer(String pro_answerer) {
		this.pro_answerer = pro_answerer;
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


	public Date getQa_create_date() {
		return qa_create_date;
	}


	public void setQa_create_date(Date qa_create_date) {
		this.qa_create_date = qa_create_date;
	}


	public Date getPro_deadline() {
		return pro_deadline;
	}


	public void setPro_deadline(Date pro_deadline) {
		this.pro_deadline = pro_deadline;
	}


	public int getPro_pay() {
		return pro_pay;
	}


	public void setPro_pay(int pro_pay) {
		this.pro_pay = pro_pay;
	}


	public int getPro_process() {
		return pro_process;
	}


	public void setPro_process(int pro_process) {
		this.pro_process = pro_process;
	}


	public String getQa_status() {
		return qa_status;
	}


	public void setQa_status(String qa_status) {
		this.qa_status = qa_status;
	}


	public String getPro_status() {
		return pro_status;
	}


	public void setPro_status(String pro_status) {
		this.pro_status = pro_status;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "QaProgress [pro_id=" + pro_id + ", pro_qid=" + pro_qid + ", qa_title=" + qa_title + ", qa_content="
				+ qa_content + ", pro_writer=" + pro_writer + ", pro_answerer=" + pro_answerer
				+ ", qa_origin_file_name=" + qa_origin_file_name + ", qa_rename_file_name=" + qa_rename_file_name
				+ ", qa_create_date=" + qa_create_date + ", pro_deadline=" + pro_deadline + ", pro_pay=" + pro_pay
				+ ", pro_process=" + pro_process + ", qa_status=" + qa_status + ", pro_status=" + pro_status + "]";
	}
}
