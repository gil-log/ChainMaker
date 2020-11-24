package kr.happyjob.chainmaker.dashboard.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MonthProfitDTO {

	private String order_date;
	private int month_profit;
	
	public MonthProfitDTO(MonthProfitVO vo) {
		this.order_date = vo.getOrder_date();
		this.month_profit = vo.getMonth_profit();
	}
	
}
