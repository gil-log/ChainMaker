package kr.happyjob.chainmaker.ged.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode(of="user_company")
public class CompanySalesVO {

	private String user_company;
	private int sales_price;
	private int profit_price;
	
}
