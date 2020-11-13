package kr.happyjob.chainmaker.system.model;

import java.sql.Date;

public class NoticeModel {
	
	
	private int nt_no;
	private int nt_no2;
	private String loginID;
	private String nt_title;
	private String nt_note;
	private String write_date;
	private String title;
	private String from_date;
	private String to_date;
	
	
	
	
	
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
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFrom_date() {
		return from_date;
	}
	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}
	public String getTo_date() {
		return to_date;
	}
	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}
	
	
	

}
