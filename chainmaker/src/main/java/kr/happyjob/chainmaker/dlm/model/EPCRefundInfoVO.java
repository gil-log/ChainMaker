package kr.happyjob.chainmaker.dlm.model;

import java.sql.Date;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode(of= {"refund_no", "pro_no", "ware_no"})
public class EPCRefundInfoVO {

	private int refund_no;
	private String user_company;
	private String pro_name;
	private int refund_qty;
	private Date refund_date;
	private int refund_confirm_cd;
	private String refund_note;
	private String pro_no;
	private int order_no;
	private int ware_no;
	private String ware_name;
	private String pro_model_name;
	private String pro_manu_name;
	private String detail_name;
	
}
