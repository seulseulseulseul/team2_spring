package com.itwill.domain;

import java.sql.Date;


public class ReservationDTO {
	private int book_num;
	private String u_id;
	private String t_id;
	private Date book_date;
	private String book_time;
	private String coment;
	public Date getBook_date() {
		return book_date;
	}
	public void setBook_date(Date book_date) {
		this.book_date = book_date;
	}
	public String getBook_time() {
		return book_time;
	}
	public void setBook_time(String book_time) {
		this.book_time = book_time;
	}
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
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
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	
}
