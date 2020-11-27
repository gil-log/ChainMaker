package kr.happyjob.chainmaker.dashboard.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class SlideProductInfoDTO {

	private String pro_no;
	private String pro_name;
	private int pro_price;
	private String pro_cd;
	private String pro_detail;
	private String file_server_path;
	
	public SlideProductInfoDTO(SlideProductInfoVO vo) {
		this.pro_no = vo.getPro_no();
		this.pro_name = vo.getPro_name();
		this.pro_price = vo.getPro_price();
		this.pro_cd = vo.getPro_cd();
		this.pro_detail = vo.getPro_detail();
		this.file_server_path = vo.getFile_server_path();
	}
}
