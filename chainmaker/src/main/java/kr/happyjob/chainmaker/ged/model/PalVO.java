package kr.happyjob.chainmaker.ged.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PalVO {
	private Date order_date;
	private String user_company;
	private String company;
	private int profit;
	private int loss;	
	
	
}
