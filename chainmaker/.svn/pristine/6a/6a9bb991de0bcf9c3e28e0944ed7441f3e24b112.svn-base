package kr.happyjob.chainmaker.scm.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDetailByOrderNoAndProNoDTO {

	private String pro_no;
	private int order_no;
	private String order_date;
	private String user_company;
	private String pro_name;
	private String order_expdate;
	private int order_qty;
	private int deposit_cd;
	private String order_cd;
	
	public OrderDetailByOrderNoAndProNoDTO(OrderDetailByOrderNoAndProNoVO orderDetailVO) {
		
		this.pro_no = orderDetailVO.getPro_no();
		this.order_no = orderDetailVO.getOrder_no();
		this.order_date = orderDetailVO.getOrder_date();
		this.user_company = orderDetailVO.getUser_company();
		this.pro_name = orderDetailVO.getPro_name();
		this.order_expdate = orderDetailVO.getOrder_expdate();
		this.order_qty = orderDetailVO.getOrder_qty();
		this.deposit_cd = orderDetailVO.getDeposit_cd();
		this.order_cd = orderDetailVO.getOrder_cd();
	}
}
