package kr.happyjob.chainmaker.dashboard.model;

import java.sql.Date;

public class DashboardModel {

	private int nt_no;
	private int nt_no2;
	private String loginID;
	private String nt_title;
	private String nt_note;
	private Date write_date;
	
	
	
	public int getNt_no() {
		return nt_no;
	}
	public void setNt_no(int nt_no) {
		this.nt_no = nt_no;
	}
	public int getNt_no2() {
		return nt_no2;
	}
	public void setNt_no2(int nt_no2) {
		this.nt_no2 = nt_no2;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getNt_title() {
		return nt_title;
	}
	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}
	public String getNt_note() {
		return nt_note;
	}
	public void setNt_note(String nt_note) {
		this.nt_note = nt_note;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

}
