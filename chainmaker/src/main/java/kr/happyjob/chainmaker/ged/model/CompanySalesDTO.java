package kr.happyjob.chainmaker.ged.model;

import lombok.ToString;

import lombok.Setter;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class CompanySalesDTO {
	
	private String user_company;
	private int sales_price;
	private int profit_price;
	
	public CompanySalesDTO(CompanySalesVO vo) {
		this.user_company = vo.getUser_company();
		this.sales_price = vo.getSales_price();
		this.profit_price = vo.getProfit_price();
	}
}
