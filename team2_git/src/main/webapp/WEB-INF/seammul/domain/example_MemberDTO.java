package com.itwill.domain;

import java.sql.Timestamp;

public class MemberDTO {
	// Member정보를 담아서 전달
	// 멤버변수: 아무나 접근 못하게 막아줌(데이터 은닉)
	private String id;
	private String pass;
	private String name;
	private Timestamp date;
	
	
	// 멤버함수(메서드)
	// 멤버변수를 접근할 통로
	// set get 메서드 만들기 alt shift s => r
	public void setId(String id) {
		this.id=id;
	}
	public String getId() {
		return this.id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
}
