package user;

import java.sql.Timestamp;

public class user_MemberDTO {
	private String u_id;
	private String u_pass;
	private String u_name;
	private String u_nic;
	private String u_phone;
	private String u_email;
	private int u_cash;
	private int u_num;
	
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pass() {
		return u_pass;
	}
	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_nic() {
		return u_nic;
	}
	public void setU_nic(String u_nic) {
		this.u_nic = u_nic;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public int getU_cash() {
		return u_cash;
	}
	public void setU_cash(int u_cash) {
		this.u_cash = u_cash;
	}
	
	
}
