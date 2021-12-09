package com.itwill.domain;

import java.sql.Timestamp;
import java.text.DecimalFormat;

public class ReviewDTO {
	private int re_num;
	private int book_no;
	private double re_point;
	private String re_coment;
	private Timestamp re_date;
	private String u_id;
	private String t_id;
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public double getRe_point() {
		return re_point;
	}
	public void setRe_point(double re_point) {
		this.re_point = re_point;
	}
	public String getRe_coment() {
		return re_coment;
	}
	public void setRe_coment(String re_coment) {
		this.re_coment = re_coment;
	}
	public Timestamp getRe_date() {
		return re_date;
	}
	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getT_id() {
		return t_id;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	
}
