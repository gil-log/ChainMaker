package kr.happyjob.chainmaker.scm.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WHInfoDTO {
  
  private int totalcnt;
  
  private int ware_no;
  private String ware_name;
  private String ware_address;
  private String ware_dt_address;
  private String ware_zipcode;
  
  private String user_id;
  private String name;
  private String user_tel1;
  private String user_tel2;
  private String user_tel3;
  private String user_email;
  
  public WHInfoDTO(WHInfoVO whInfoVO) {
    
    this.totalcnt = whInfoVO.getTotalcnt();
    
    this.ware_no = whInfoVO.getWare_no();
    this.ware_name = whInfoVO.getWare_name();
    this.ware_address = whInfoVO.getWare_address();
    this.ware_dt_address = whInfoVO.getWare_dt_address();
    this.ware_zipcode = whInfoVO.getWare_zipcode();
    
    this.user_id = whInfoVO.getUser_id();
    this.name = whInfoVO.getName();
    this.user_tel1 = whInfoVO.getUser_tel1();
    this.user_tel2 = whInfoVO.getUser_tel2();
    this.user_tel3 = whInfoVO.getUser_tel3();
    this.user_email = whInfoVO.getUser_email();
    
  }
}
