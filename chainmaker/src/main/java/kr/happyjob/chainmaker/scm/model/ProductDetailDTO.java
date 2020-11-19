package kr.happyjob.chainmaker.scm.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ProductDetailDTO {

	private String pro_no;
	private String pro_name;
	private String deli_company;
	private int ware_no;
	private int pro_ware_qty;
	private String ware_name;
	
	private String login_id;
	
	
	public ProductDetailDTO(ProductDetailVO productDetailVO) {
		this.pro_no = productDetailVO.getPro_no();
		this.pro_name = productDetailVO.getPro_name();
		this.deli_company = productDetailVO.getDeli_company();
		this.ware_no = productDetailVO.getWare_no();
		this.pro_ware_qty = productDetailVO.getPro_ware_qty();
		this.ware_name = productDetailVO.getWare_name();
	}
}
