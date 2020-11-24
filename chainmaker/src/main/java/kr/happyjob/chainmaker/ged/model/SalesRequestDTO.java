package kr.happyjob.chainmaker.ged.model;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SalesRequestDTO {					
	
	private int currentPage;
	private int pageSize;
	private int pageIndex;
	
	private Date startDate;
	private Date endDate;
	
	private String user_company;
}
