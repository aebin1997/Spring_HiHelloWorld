package com.ict.hhw.member.model.vo;

import java.sql.Date;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String nickname;
	private String email;
	private String gender;
	private int age;
	private String phone;
	private String address;
	private Date enrolldate;
	private Date updatedate;
	private String mStatus;
	
	public Member() {}

	public Member(String id, String pwd, String name, String nickname, String email, String gender, int age,
			String phone, String address, Date enrolldate, Date updatedate, String mStatus) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.address = address;
		this.enrolldate = enrolldate;
		this.updatedate = updatedate;
		this.mStatus = mStatus;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname + ", email=" + email
				+ ", gender=" + gender + ", age=" + age + ", phone=" + phone + ", address=" + address + ", enrolldate="
				+ enrolldate + ", updatedate=" + updatedate + ", mStatus=" + mStatus + "]";
	}
	
}
