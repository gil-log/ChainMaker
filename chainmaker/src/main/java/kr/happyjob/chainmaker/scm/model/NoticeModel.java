package kr.happyjob.chainmaker.scm.model;

import java.sql.Date;

import lombok.Data;
@Data
public class NoticeModel {
	
	
	private String loginID;
	private String notice_content;
	private int notice_hit;
	private Date notice_moddate;
	private int notice_no;
	private Date notice_regdate;
	private String notice_title;
	
	

}
