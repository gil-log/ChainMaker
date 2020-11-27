package kr.happyjob.chainmaker.dlm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.happyjob.chainmaker.dlm.model.DlmPurchaseOrderDTO;
import kr.happyjob.chainmaker.dlm.model.PurchaseOrderPgAndScKeyWordDTO;
import kr.happyjob.chainmaker.dlm.service.DlmPurchaseOrderService;

@Controller
@RequestMapping("/dlm")
public class DlmPurchaseOrderController {
  
  // Set logger
  private final Logger logger = LogManager.getLogger(this.getClass());
  
  // Get class name for logger
  private final String className = this.getClass().toString();
  
  @Autowired
  DlmPurchaseOrderService dlmPurchaseOrderService;
  
  // 발주 지시서 ( 납품 업체 ) 목록 페이지
  @RequestMapping("purchaseorder.do")
  public String purchaseOrder() {
    
    logger.info("발주 지시서 (납품 업체) 목록 페이지");
    logger.info(" + Start - " + className + ".initPurchaseOrderInfo");
    
    return "dlm/purchaseOrderList";
  }
  
  // 발주 지시서 목록 조회
  @RequestMapping("purchaseOrderList.do")
  public String purchaseOrderList(@ModelAttribute PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO, Model model, HttpSession session) throws Exception {
    
    int currentPage = purchaseOrderPgAndKeyWordDTO.getCurrentPage();
    int pageSize = purchaseOrderPgAndKeyWordDTO.getPageSize();
    int pageIndex = (currentPage - 1) * pageSize;
    
    logger.info("---------SearchKey - "+purchaseOrderPgAndKeyWordDTO.getSearchKey());
    logger.info("---------SearchWord - "+purchaseOrderPgAndKeyWordDTO.getSearchWord());
    logger.info("---------StartDate - "+purchaseOrderPgAndKeyWordDTO.getStartDate());
    logger.info("---------EndDate - "+purchaseOrderPgAndKeyWordDTO.getEndDate());
    
    purchaseOrderPgAndKeyWordDTO.setLoginID((String) session.getAttribute("loginId"));
    
    purchaseOrderPgAndKeyWordDTO.setPageIndex(pageIndex);
    
    List<DlmPurchaseOrderDTO> listPurchaseOrderInfo = dlmPurchaseOrderService.purchaseOrderListByMng(purchaseOrderPgAndKeyWordDTO);
    int totalcnt = dlmPurchaseOrderService.totalCnt(purchaseOrderPgAndKeyWordDTO);
    
    model.addAttribute("listPurchaseOrderInfo", listPurchaseOrderInfo);
    model.addAttribute("purchaseOrderListTotal", totalcnt);
   
    return "dlm/purchaseList";
  }
  
  // 발주 지시서 상세 목록 조회
  @RequestMapping("purchaseOrderDtlList.do")
  public String purchaseOrderDtlList() {
    
    return "dlm/purchaseDtlList";
  }
  
}
