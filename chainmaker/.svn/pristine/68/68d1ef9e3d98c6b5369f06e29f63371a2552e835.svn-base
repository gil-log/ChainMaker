package kr.happyjob.chainmaker.scm.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WHInfoByProNoDTO {

	private int ware_no;
	private String pro_no;
	private int pro_ware_qty;
	private String ware_name;
	private String name;
	private String pro_name;
	
	public WHInfoByProNoDTO(WHInfoByProNoVO whInfoByProNoVO) {
		this.ware_no = whInfoByProNoVO.getWare_no();
		this.pro_no = whInfoByProNoVO.getPro_no();
		this.pro_ware_qty = whInfoByProNoVO.getPro_ware_qty();
		this.ware_name = whInfoByProNoVO.getWare_name();
		this.name = whInfoByProNoVO.getName();
		this.pro_name = whInfoByProNoVO.getPro_name();
	}
}
