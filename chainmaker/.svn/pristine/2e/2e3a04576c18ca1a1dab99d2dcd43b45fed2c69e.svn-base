package kr.happyjob.chainmaker.epc.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class RefundUserInfoDTO {

	private String loginID;
	private String name;
	private String user_address;
	private String bank_name;
	private String user_account;
	
	public RefundUserInfoDTO(RefundUserInfoVO vo) {
		this.loginID = vo.getLoginID();
		this.name = vo.getName();
		this.user_address = vo.getUser_address();
		this.bank_name = vo.getBank_name();
		this.user_account = vo.getUser_account();
	}
}
