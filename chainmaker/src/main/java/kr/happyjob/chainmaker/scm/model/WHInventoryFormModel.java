package kr.happyjob.chainmaker.scm.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WHInventoryFormModel {
	private String pro_no;
	private String pro_name;
	private int ware_no;
	private String ware_name;
	private String ware_address;
	private String ware_dt_address;
	private int pro_ware_qty;
	private int pro_io_qty;
	private String pro_io_cd;
}
