package kr.happyjob.chainmaker.scm.model;


import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DailyOrderListDTO {
	
	private int row_num;
	private int order_no;
	private String pro_no;
	private String pro_name;
	private int order_qty;
	private String order_cd;
	private String deposit_cd;
	
	private Timestamp order_date;
	private Timestamp order_expdate;
	private Timestamp order_mod_date;
	
	private String loginID;
	private String user_company;
	private int pro_ware_qty;
	private int pro_deli_price;
	private int pro_price;
	
	public DailyOrderListDTO(DailyOrderListVO dailyOrderListVO) {
		
		this.row_num = dailyOrderListVO.getRow_num();
		this.order_no = dailyOrderListVO.getOrder_no();
		this.pro_no = dailyOrderListVO.getPro_no();
		this.pro_name = dailyOrderListVO.getPro_name();
		this.order_qty = dailyOrderListVO.getOrder_qty();
		this.order_cd = dailyOrderListVO.getOrder_cd();
		this.deposit_cd = dailyOrderListVO.getDeposit_cd();
		this.order_date = dailyOrderListVO.getOrder_date();
		this.order_expdate = dailyOrderListVO.getOrder_expdate();
		this.order_mod_date = dailyOrderListVO.getOrder_mod_date();
		this.loginID = dailyOrderListVO.getLoginID();
		this.user_company = dailyOrderListVO.getUser_company();
		this.pro_ware_qty = dailyOrderListVO.getPro_ware_qty();
		this.pro_deli_price = dailyOrderListVO.getPro_deli_price();
		this.pro_price = dailyOrderListVO.getPro_price();
	}
	
}
