package kr.happyjob.chainmaker.scm.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WhMngInfoDTO {
  
  private String loginID;
  private String name;
  private String user_tel1;
  private String user_tel2;
  private String user_tel3;
  private String user_email;
  
  // 기본 생성자가 없어서 NoSearchMethodException: WhMngInfoDTO<init>()에러를 뱉어서 추가한 기본 생성자
  private WhMngInfoDTO() {};
  
  public WhMngInfoDTO(WHInfoVO whInfoVO) {
    
    this.loginID = whInfoVO.getLoginID();
    this.name = whInfoVO.getName();
    this.user_tel1 = whInfoVO.getUser_tel1();
    this.user_tel2 = whInfoVO.getUser_tel2();
    this.user_tel3 = whInfoVO.getUser_tel3();
    this.user_email = whInfoVO.getUser_email();
    
  }
  
  
}
