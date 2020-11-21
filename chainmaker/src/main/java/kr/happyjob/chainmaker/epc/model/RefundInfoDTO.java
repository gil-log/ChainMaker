package kr.happyjob.chainmaker.epc.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RefundInfoDTO {

	private int refund_no;
	private int order_no;
	private String pro_no;
	private int refund_qty;
	private String refund_note;
}
