package kr.happyjob.chainmaker.scm.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ShippingDirectionDTO {
	
	private int ship_no;
	private int order_no;
	private int ware_no;
	private String pro_no;
	private int ship_qty;
	private String deli_master_name;
	private String writer_id;
	
	public ShippingDirectionDTO(PurchaseAndShippingInfoDTO purchaseAndShippingInfoDTO) {
		this.ship_no = purchaseAndShippingInfoDTO.getShip_no();
		this.order_no = purchaseAndShippingInfoDTO.getOrder_no();
		this.ware_no = purchaseAndShippingInfoDTO.getWare_no();
		this.pro_no = purchaseAndShippingInfoDTO.getPro_no();
		this.ship_qty = purchaseAndShippingInfoDTO.getShip_qty();
		this.deli_master_name = purchaseAndShippingInfoDTO.getDeli_master_name();
		this.writer_id = purchaseAndShippingInfoDTO.getWriter_id();
	}
}
