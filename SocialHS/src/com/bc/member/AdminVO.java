package com.bc.member;

public class AdminVO {
	private int a_idx, age;
	private String name, id, pw, phone, email, addr, rank, regdate, bbs_name;
	
	public int getA_idx() {
		return a_idx;
	}
	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	public String getBbs_name() {
		return bbs_name;
	}
	public void setBbs_name(String bbs_name) {
		this.bbs_name = bbs_name;
	}
	
	
	@Override
	public String toString() {
		return "AdminVO [a_idx=" + a_idx + ", age=" + age + ", name=" + name + ", id=" + id + ", pw=" + pw + ", phone="
				+ phone + ", email=" + email + ", addr=" + addr + ", rank=" + rank + ", regdate=" + regdate
				+ ", bbs_name=" + bbs_name + "]";
	}
	
	
	
}
