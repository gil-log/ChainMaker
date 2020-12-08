package kr.happyjob.chainmaker.ged.model;

import java.sql.Date;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//@EqualsAndHashCode(of= {"refund_no"})  //이거하나만?? 팀장님께.. 
public class RefundConfirmInfoVO {
	
	// refund 테이블 프라이머리키3개
	private int refund_no;
	private String pro_no;
	private int ware_no;
	
	//임원페이지 화면에 보여줄 내용
	private String user_company;
	private String pro_name;
	private Date order_date;
	private Date refund_date;
	private long order_qty;
	private long refund_qty;
	private long total_price;

}
