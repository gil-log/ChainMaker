package kr.happyjob.chainmaker.dashboard.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MonthCompanyDTO {

	private String user_company;
	private int sales_price;
	private int profit_price;
	
	public MonthCompanyDTO(MonthCompanyVO vo) {
		this.user_company = vo.getUser_company();
		this.sales_price = vo.getSales_price();
		this.profit_price = vo.getProfit_price();
	}
}
