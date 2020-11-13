package kr.happyjob.chainmaker.scm.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PageAndOrderInfoDTO {					
	
	private int currentPage;
	private int pageSize;
	private int pageIndex;
	
	private int order_no;
	private String pro_no;
	
}
