package kr.happyjob.chainmaker.dashboard.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MonthProductDTO {

	private String pro_no;
	private String pro_name;
	private int profit_price;
	
	public MonthProductDTO(MonthProductVO vo) {
		this.pro_no = vo.getPro_no();
		this.pro_name = vo.getPro_name();
		this.profit_price = vo.getProfit_price();
		
	}
	
}
