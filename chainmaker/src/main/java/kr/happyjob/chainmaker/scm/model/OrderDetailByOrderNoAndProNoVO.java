package kr.happyjob.chainmaker.scm.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode(of= {"order_no", "pro_no"})
public class OrderDetailByOrderNoAndProNoVO {
	
	private String pro_no;
	private int order_no;
	private String order_date;
	private String user_company;
	private String pro_name;
	private String order_expdate;
	private int order_qty;
	private int deposit_cd;
	private String order_cd;
	
}
