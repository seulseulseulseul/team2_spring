package com.itwill.domain;

import java.sql.Timestamp;

public class ReplyDTO {
	private int r_num; // 댓글번호
	private int c_num; // 게시글번호
	private int parent; // 부모댓글
	private int r_order; // 순서
	private int depth; // 깊이
	private String u_id; // 아이디
	private String nic; // 닉네임
	private String content; // 글내용
	private Timestamp date; // 작성일 
	
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getR_order() {
		return r_order;
	}
	public void setR_order(int r_order) {
		this.r_order = r_order;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getNic() {
		return nic;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}

}
