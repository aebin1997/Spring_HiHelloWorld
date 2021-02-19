package com.ict.hhw.progress.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Progress implements Serializable{
	private final static long serialVersionUID = 8888L;
	
	private int pro_id;
	private int pro_qid;
	private String pro_writer;
	private String pro_answerer;
	private Date pro_deadline;
	private int pro_pay;
	private int pro_process;
	private String pro_status;
	
	public Progress() {}

	public Progress(int pro_id, int pro_qid, String pro_writer, String pro_answerer, Date pro_deadline, int pro_pay,
			int pro_process, String pro_status) {
		super();
		this.pro_id = pro_id;
		this.pro_qid = pro_qid;
		this.pro_writer = pro_writer;
		this.pro_answerer = pro_answerer;
		this.pro_deadline = pro_deadline;
		this.pro_pay = pro_pay;
		this.pro_process = pro_process;
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

	public String getPro_status() {
		return pro_status;
	}

	public void setPro_status(String pro_status) {
		this.pro_status = pro_status;
	}

	@Override
	public String toString() {
		return "Progress [pro_id=" + pro_id + ", pro_qid=" + pro_qid + ", pro_writer=" + pro_writer + ", pro_answerer="
				+ pro_answerer + ", pro_deadline=" + pro_deadline + ", pro_pay=" + pro_pay + ", pro_process="
				+ pro_process + ", pro_status=" + pro_status + "]";
	}
	
}
