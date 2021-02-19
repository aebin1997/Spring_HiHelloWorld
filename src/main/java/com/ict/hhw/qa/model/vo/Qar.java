package com.ict.hhw.qa.model.vo;

import java.sql.Date;

public class Qar implements java.io.Serializable{
	private final static long serialVersionUID = 9999L;
	
	private int qar_id;
	private String qar_content;
	private int ref_qa_id;
	private String qar_writer;
	private Date qar_create_date;
	private Date qar_modify_date;
	private String qar_status;
	
	public Qar() {}

	public Qar(int qar_id, String qar_content, int ref_qa_id, String qar_writer, Date qar_create_date,
			Date qar_modify_date, String qar_status) {
		super();
		this.qar_id = qar_id;
		this.qar_content = qar_content;
		this.ref_qa_id = ref_qa_id;
		this.qar_writer = qar_writer;
		this.qar_create_date = qar_create_date;
		this.qar_modify_date = qar_modify_date;
		this.qar_status = qar_status;
	}

	public int getQar_id() {
		return qar_id;
	}

	public void setQar_id(int qar_id) {
		this.qar_id = qar_id;
	}

	public String getQar_content() {
		return qar_content;
	}

	public void setQar_content(String qar_content) {
		this.qar_content = qar_content;
	}

	public int getRef_qa_id() {
		return ref_qa_id;
	}

	public void setRef_qa_id(int ref_qa_id) {
		this.ref_qa_id = ref_qa_id;
	}

	public String getQar_writer() {
		return qar_writer;
	}

	public void setQar_writer(String qar_writer) {
		this.qar_writer = qar_writer;
	}

	public Date getQar_create_date() {
		return qar_create_date;
	}

	public void setQar_create_date(Date qar_create_date) {
		this.qar_create_date = qar_create_date;
	}

	public Date getQar_modify_date() {
		return qar_modify_date;
	}

	public void setQar_modify_date(Date qar_modify_date) {
		this.qar_modify_date = qar_modify_date;
	}

	public String getQar_status() {
		return qar_status;
	}

	public void setQar_status(String qar_status) {
		this.qar_status = qar_status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Qar [qar_id=" + qar_id + ", qar_content=" + qar_content + ", ref_qa_id=" + ref_qa_id + ", qar_writer="
				+ qar_writer + ", qar_create_date=" + qar_create_date + ", qar_modify_date=" + qar_modify_date
				+ ", qar_status=" + qar_status + "]";
	}


}
