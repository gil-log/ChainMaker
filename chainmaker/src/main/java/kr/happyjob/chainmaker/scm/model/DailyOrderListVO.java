package kr.happyjob.chainmaker.scm.model;



import java.sql.Timestamp;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode(of = {"order_no", "pro_no"})
public class DailyOrderListVO {
	
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
	
}
