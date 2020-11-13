package kr.happyjob.chainmaker.pcm.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PurchaseOrderModel {
	
	//가상 더미데이터 입력을 위한 생성자
	public PurchaseOrderModel(int purchase_no, String deli_company, String pro_cd, int purchase_qty,
			String direction_cd, String purchase_cd) {
		super();
		this.purchase_no = purchase_no;
		this.deli_company = deli_company;
		this.pro_cd = pro_cd;
		this.purchase_qty = purchase_qty;
		this.direction_cd = direction_cd;
		this.purchase_cd = purchase_cd;
	}
	
	private int purchase_no;
	private String deli_company;
	private String pro_cd;
	private int purchase_qty;
	private String purchase_date ;
	private String direction_cd;	//purchase 발주, refund 반품, shipping 배송
	private String purchase_cd;		//0 미승인, 1 승인
	private String pro_name;
	private String pro_no;
}
