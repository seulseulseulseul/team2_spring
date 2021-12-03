package com.itwill.domain;

import java.sql.Timestamp;

public class NoticeDTO {
	private int b_num;
	private int t_num;
	private int u_num;
	private String admin_id;
	private String b_title;
	private String b_content;
	private Timestamp b_date;
	
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Timestamp getB_Date() {
		return b_date;
	}
	public void setB_Date(Timestamp date) {
		this.b_date = date;
	}
	
}
