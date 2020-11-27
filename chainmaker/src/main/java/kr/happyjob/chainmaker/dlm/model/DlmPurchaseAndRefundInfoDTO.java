package kr.happyjob.chainmaker.dlm.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DlmPurchaseAndRefundInfoDTO {
  
  private int refund_no;
  private int purchase_no;
  private int ware_no;
  private int pro_io_qty;
  private String pro_no;
  private String refund_note;
  
}
