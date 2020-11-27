package kr.happyjob.chainmaker.dlm.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.happyjob.chainmaker.dlm.service.DlmRefundOrderService;

@Controller
@RequestMapping("/dlm")
public class DlmRefundOrderController {
  
  // Set logger
  private final Logger logger = LogManager.getLogger(this.getClass());
  
  // Get class name for logger
  private final String className = this.getClass().toString();
  
  @Autowired
  DlmRefundOrderService dlmRefundOrderService;
  
  // 반품 지시서 ( 납품 업체 ) 목록
  @RequestMapping("refundorder.do")
  public String refundOrder() {
    
    logger.info("반품 지시서 (납품 업체) 목록 페이지");
    logger.info(" + Start - " + className + ".initRefundOrderInfo");
    
    return "dlm/refundOrderList";
  }
  
}
