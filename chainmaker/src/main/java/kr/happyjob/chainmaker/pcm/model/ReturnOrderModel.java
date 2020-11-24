package kr.happyjob.chainmaker.pcm.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReturnOrderModel {
	
	private int refund_no;
	private String deli_company;
	private int refund_qty; 
	private String pro_cd;
	private Date refund_date;
	private String pro_no;
	private String pro_name;
	private String direction_cd;	//purchase 발주, refund 반품, shipping 배송
	private String refund_cd;		//0 미지급, 1 지급
	private String refund_confirm_cd;		//0 확인, 1 미확인	
	private String deli_name;
	private String deli_phone;
	private String deli_email;
}
