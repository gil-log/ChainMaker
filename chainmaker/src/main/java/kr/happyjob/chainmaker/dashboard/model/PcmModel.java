package kr.happyjob.chainmaker.dashboard.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PcmModel {
	
	private int purchase_no;
	private int purchase_cd;
	private Date purchase_date;
	private String direction_cd;	//purchase 발주, refund 반품, shipping 배송
	private String detail_name;		//0 미승인, 1 승인
	private String deli_company;
	private int pro_deli_price;
	private int price;
	private int total_price;
	private String pro_no;
	private String pro_name;
	private String pro_cd;
	private int ware_no;
    private String deli_name;
    private String deli_phone;
    private String deli_email;
    private String ware_name;
    private String ware_address;
    private String ware_dt_address;
}