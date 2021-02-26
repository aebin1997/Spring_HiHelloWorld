package com.ict.hhw.member.model.vo;

import java.sql.Date;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String nickname;
	private String email;
	private String sex;
	private String phone;
	private String address;
	private Date enrollDate;
	private Date updateDate;
	private String mstatus;
	private String selfintro_head;
	private String selfintro_content;
	private String propic;
	private String user_lv;
	private String grade;
	
	public Member() {}

	public Member(String id, String pwd, String name, String nickname, String email, String sex, String phone,
			String address, Date enrollDate, Date updateDate, String mstatus, String selfintro_head,
			String selfintro_content, String propic, String user_lv, String grade) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.sex = sex;
		this.phone = phone;
		this.address = address;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.mstatus = mstatus;
		this.selfintro_head = selfintro_head;
		this.selfintro_content = selfintro_content;
		this.propic = propic;
		this.user_lv = user_lv;
		this.grade = grade;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getMstatus() {
		return mstatus;
	}

	public void setMstatus(String mstatus) {
		this.mstatus = mstatus;
	}

	public String getSelfintro_head() {
		return selfintro_head;
	}

	public void setSelfintro_head(String selfintro_head) {
		this.selfintro_head = selfintro_head;
	}

	public String getSelfintro_content() {
		return selfintro_content;
	}

	public void setSelfintro_content(String selfintro_content) {
		this.selfintro_content = selfintro_content;
	}

	public String getPropic() {
		return propic;
	}

	public void setPropic(String propic) {
		this.propic = propic;
	}

	public String getUser_lv() {
		return user_lv;
	}

	public void setUser_lv(String user_lv) {
		this.user_lv = user_lv;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname + ", email=" + email
				+ ", sex=" + sex + ", phone=" + phone + ", address=" + address + ", enrollDate=" + enrollDate
				+ ", updateDate=" + updateDate + ", mstatus=" + mstatus + ", selfintro_head=" + selfintro_head
				+ ", selfintro_content=" + selfintro_content + ", propic=" + propic + ", user_lv=" + user_lv
				+ ", grade=" + grade + "]";
	}

	
}
