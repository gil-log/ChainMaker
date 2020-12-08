package kr.happyjob.chainmaker.ged.model;

import java.math.BigInteger;
import java.sql.Date;

import lombok.NoArgsConstructor;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class PurchaseInfoDTO {
	
	private String deli_company;
	private int purchase_no;
	private String pro_name;
	private int purchase_qty;
	private BigInteger purchase_price;
	private Date purchase_date;
	private String name;

	public PurchaseInfoDTO(PurchaseInfoVO vo) {
		this.deli_company = vo.getDeli_company();
		this.purchase_no = vo.getPurchase_no();
		this.pro_name = vo.getPro_name();
		this.purchase_qty = vo.getPurchase_qty();
		this.purchase_price = vo.getPurchase_price();
		this.purchase_date = vo.getPurchase_date();
		this.name = vo.getName();
	}
}
