package kr.happyjob.chainmaker.dlm.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor

public class DlmPurchaseOrderDTO {

  private String loginID;
  private int deli_no;
  private String deli_company;
  private String total_price;
  
  private String purchase_date;
  
  public DlmPurchaseOrderDTO(DlmPurchaseOrderVO dlmPurchaseOrderVO) {
    
    this.deli_no = dlmPurchaseOrderVO.getDeli_no();
    this.deli_company = dlmPurchaseOrderVO.getDeli_company();
    this.total_price = dlmPurchaseOrderVO.getTotal_price();
    
    this.purchase_date = dlmPurchaseOrderVO.getPurchase_date();
    
    
  }
  
 
  
}
