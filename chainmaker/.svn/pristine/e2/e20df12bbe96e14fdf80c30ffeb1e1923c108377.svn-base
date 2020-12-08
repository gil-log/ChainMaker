package kr.happyjob.chainmaker.epc.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderListWithQtyAndDateDTO {

	private int order_no;
	private int order_total_qty;
	private long amount_payment;
	private Date order_date;
	private Date order_mod_date;
	private Date order_expdate;
	private String pro_name;
	
	private String order_cd;
	private String ship_cd;
	
	public OrderListWithQtyAndDateDTO(OrderListWithQtyAndDateVO vo) {
		this.order_no = vo.getOrder_no();
		this.order_total_qty = vo.getOrder_total_qty();
		this.amount_payment = vo.getAmount_payment();
		this.order_date = vo.getOrder_date();
		this.order_mod_date = vo.getOrder_mod_date();
		this.order_expdate = vo.getOrder_expdate();
		this.pro_name = vo.getPro_name();
		this.order_cd = vo.getOrder_cd();
		this.ship_cd = vo.getShip_cd();
	}
}
