package kr.happyjob.chainmaker.dlm.model;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class RefundInfoRequestDTO {

	private int currentPage;
	private int pageSize;
	private int pageIndex;
	
	
	private int refund_no;
	private String user_company;
	
	private String loginID;
	
	private Date startDate;
	private Date endDate;
	
	private int refund_confirm_cd;
}
