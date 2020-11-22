package kr.happyjob.chainmaker.scm.model;

import java.sql.Date;

import lombok.NoArgsConstructor;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ShippingOrderDTO {

	private int order_no;
	private String pro_name;
	private Date order_date;
	private String user_company;
	private int ship_total_qty;
	private Date order_expdate;
	private String ship_cd;
	
	public ShippingOrderDTO(ShippingOrderVO vo) {
		this.order_no = vo.getOrder_no();
		this.pro_name = vo.getPro_name();
		this.order_date = vo.getOrder_date();
		this.user_company = vo.getUser_company();
		this.ship_total_qty = vo.getShip_total_qty();
		this.order_expdate = vo.getOrder_expdate();
		this.ship_cd = vo.getShip_cd();
	}
	
}
