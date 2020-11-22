package kr.happyjob.chainmaker.scm.model;

import java.sql.Date;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode(of= {"order_no", "pro_name"})
public class ShippingOrderVO {

	private int order_no;
	private String pro_name;
	private Date order_date;
	private String user_company;
	private int ship_total_qty;
	private Date order_expdate;
	private String ship_cd;
	
}
