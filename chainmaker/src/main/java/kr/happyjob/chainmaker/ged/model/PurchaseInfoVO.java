package kr.happyjob.chainmaker.ged.model;

import java.sql.Date;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode(of= {"purchase_no"})
public class PurchaseInfoVO {

	private String deli_company;
	private int purchase_no;
	private String pro_name;
	private int purchase_qty;
	private int purchase_price;
	private Date purchase_date;
	private String name;
	
}
