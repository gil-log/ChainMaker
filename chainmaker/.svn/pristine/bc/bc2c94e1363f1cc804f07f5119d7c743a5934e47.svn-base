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
  
  private String purchase_no;
  private String purchase_qty;
  private String purchase_date;
  
  private String pro_no;
  private String pro_name;
  private String pro_deli_price;
  private String pro_manu_name;
  
  private int pro_io_qty;
  
  private int ware_no;

  
  private String detail_name;
  
  public DlmPurchaseOrderDTO(DlmPurchaseOrderVO dlmPurchaseOrderVO) {
    
    this.deli_no = dlmPurchaseOrderVO.getDeli_no();
    this.deli_company = dlmPurchaseOrderVO.getDeli_company();
    this.total_price = dlmPurchaseOrderVO.getTotal_price();
    
    this.purchase_no = dlmPurchaseOrderVO.getPurchase_no();
    this.purchase_qty = dlmPurchaseOrderVO.getPurchase_qty();
    this.purchase_date = dlmPurchaseOrderVO.getPurchase_date();
    
    this.pro_no = dlmPurchaseOrderVO.getPro_no();
    this.pro_name = dlmPurchaseOrderVO.getPro_name();
    this.pro_deli_price = dlmPurchaseOrderVO.getPro_deli_price();
    this.pro_manu_name = dlmPurchaseOrderVO.getPro_manu_name();
    
    this.pro_io_qty = dlmPurchaseOrderVO.getPro_io_qty();
    
    this.ware_no = dlmPurchaseOrderVO.getWare_no();
    
    this.detail_name = dlmPurchaseOrderVO.getDetail_name();
    
  }
  
}
