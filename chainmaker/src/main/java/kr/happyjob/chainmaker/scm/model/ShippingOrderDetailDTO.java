package kr.happyjob.chainmaker.scm.model;

import java.sql.Date;

import lombok.ToString;

import lombok.Setter;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ShippingOrderDetailDTO {

	private Date order_date;
	private int order_no;
	private int ship_qty;
	private int ware_no;
	private String pro_name;
	private String ware_name;
	private String pro_no;
	private String user_company;
	private int deposit_cd;
	private String name;
	
	public ShippingOrderDetailDTO(ShippingOrderDetailVO vo) {
		this.order_date = vo.getOrder_date();
		this.order_no = vo.getOrder_no();
		this.ship_qty = vo.getShip_qty();
		this.ware_no = vo.getWare_no();
		this.pro_name = vo.getPro_name();
		this.ware_name = vo.getWare_name();
		this.pro_no = vo.getPro_no();
		this.user_company = vo.getUser_company();
		this.deposit_cd = vo.getDeposit_cd();
		this.name = vo.getName();
	}
}
