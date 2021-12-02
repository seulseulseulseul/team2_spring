package com.itwill.domain;

import java.sql.Timestamp;

public class BoardDTO {
	private String name;
	private String pass;
	private String subject;
	private String content;
	private int readcount; //조회수 0
	private Timestamp date;
	//파일추가
	private String file;
	//set get 메서드 정의
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	private int num;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
