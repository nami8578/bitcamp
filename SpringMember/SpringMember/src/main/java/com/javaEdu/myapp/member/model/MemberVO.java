package com.javaEdu.myapp.member.model;

public class MemberVO {
	
	private String name;
	private String id;
	private String pw;
	private String email;
	private String phoneNum;
	private String address;
	
	public MemberVO() {
		
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return  "MemberVO [name=" + name + ", id=" + id + ", pw=" + pw + ", email=" + email 
                + ", phoneNum=" + phoneNum + ", address=" + address + "]";
	}
	
	
}