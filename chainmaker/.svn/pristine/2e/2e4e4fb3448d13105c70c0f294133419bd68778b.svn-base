package kr.happyjob.chainmaker.ged.model;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class CompanySalesDetailDTO {

	private String user_company;
	private int order_no;
	private String pro_no;
	private int order_qty;
	private Date order_date;
	private String pro_name;
	
	private int sales_price;
	private int profit_price;
	
	public CompanySalesDetailDTO(CompanySalesDetailVO vo) {
		this.user_company = vo.getUser_company();
		this.order_no = vo.getOrder_no();
		this.pro_no = vo.getPro_no();
		this.order_qty = vo.getOrder_qty();
		this.order_date = vo.getOrder_date();
		this.pro_name = vo.getPro_name();
		this.sales_price = vo.getSales_price();
		this.profit_price = vo.getProfit_price();
	}
}
