package kr.happyjob.chainmaker.epc.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class OrderDetailDTO {

	private int order_no;
	private String pro_no;
	private String pro_cd;
	private String pro_name;
	private String pro_manu_name;
	private int order_qty;
	private int pro_price;
	
	public OrderDetailDTO(OrderDetailVO vo) {
		this.order_no = vo.getOrder_no();
		this.pro_no = vo.getPro_no();
		this.pro_cd = vo.getPro_cd();
		this.pro_name = vo.getPro_name();
		this.pro_manu_name = vo.getPro_manu_name();
		this.order_qty = vo.getOrder_qty();
		this.pro_price = vo.getPro_price();
	}
}
