package kr.happyjob.chainmaker.dlm.model;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class EPCRefundInfoDTO {
	
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
	
	public EPCRefundInfoDTO(EPCRefundInfoVO vo) {
		this.refund_no = vo.getRefund_no();
		this.user_company = vo.getUser_company();
		this.pro_name = vo.getPro_name();
		this.refund_qty = vo.getRefund_qty();
		this.refund_date = vo.getRefund_date();
		this.refund_confirm_cd = vo.getRefund_confirm_cd();
		this.refund_note = vo.getRefund_note();
		this.pro_no = vo.getPro_no();
		this.order_no = vo.getOrder_no();
		this.ware_no = vo.getWare_no();
		this.ware_name = vo.getWare_name();
		this.pro_model_name = vo.getPro_model_name();
		this.pro_manu_name = vo.getPro_manu_name();
		this.detail_name = vo.getDetail_name();
	}
}
