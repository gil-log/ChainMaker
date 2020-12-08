package kr.happyjob.chainmaker.epc.model;

import java.util.Date;

import lombok.EqualsAndHashCode;
import lombok.Getter;

import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
/*@EqualsAndHashCode(of = {"refund_no", "pro_no"}) //sql처럼 PK값을 지정해주는 것 */
public class RefundHistoryDTO {
	
	private int refund_no;   			//반품 번호
	private int order_no;    			//주문 번호
	private String pro_no;	    		//제품 번호
	private String pro_name;			//제품 명
	private int refund_qty;  			//반품 수량
	private long pro_price;				//물품 금액
	private Date refund_date; 			//반품 일자
	private String refund_note; 		//반품 사유
	private String refund_confirm_cd;	//반품 확인 코드
	private String loginID;				//아이디
	private int count;					//카운트 값
	
	/*VO 타입으로 들어온  값을 DTO로 변환*/
	public RefundHistoryDTO (RefundHistoryVO vo){
		this.refund_no = vo.getRefund_no();
		this.order_no = vo.getOrder_no();
		this.pro_no = vo.getPro_no();
		this.pro_name = vo.getPro_name();
		this.refund_qty = vo.getRefund_qty();
		this.pro_price = vo.getPro_price();
		this.refund_date = vo.getRefund_date();
		this.refund_note = vo.getRefund_note();
		this.refund_confirm_cd = vo.getRefund_confirm_cd();
		this.loginID = vo.getLoginID();
		this.count = vo.getCount();
	}
}
