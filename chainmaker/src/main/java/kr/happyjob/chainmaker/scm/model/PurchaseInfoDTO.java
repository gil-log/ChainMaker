package kr.happyjob.chainmaker.scm.model;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class PurchaseInfoDTO {
	
	private int purchase_no;
	private int purchase_qty;
	private int purchase_cd;
	private Date purchase_date;
	private String pro_no;
	private String loginID;
	private int ware_no;
	
	public PurchaseInfoDTO(PurchaseAndShippingInfoDTO purchaseAndShippingInfoDTO) {
		this.purchase_no = purchaseAndShippingInfoDTO.getPurchase_no();
		this.purchase_qty = purchaseAndShippingInfoDTO.getPurchase_qty();
		this.purchase_cd = purchaseAndShippingInfoDTO.getPurchase_cd();
		this.pro_no = purchaseAndShippingInfoDTO.getPro_no();
		this.loginID = purchaseAndShippingInfoDTO.getLoginID();
		this.ware_no = purchaseAndShippingInfoDTO.getWare_no();
	}
	
}
