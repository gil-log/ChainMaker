package kr.happyjob.chainmaker.dlm.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode(of= {"refund_no", "pro_no", "ware_no"})
public class EPCRefundDetailInfoVO {
	
	private int refund_no;
	private String pro_no;
	private int refund_qty;
	private String refund_note;
	private String pro_model_name;
	private String pro_name;
	private String pro_manu_name;
	private String detail_name;
	private int order_no;
	private int ware_no;
	private String ware_name;

}
