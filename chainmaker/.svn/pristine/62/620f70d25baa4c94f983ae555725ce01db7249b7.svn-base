package kr.happyjob.chainmaker.dlm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.dlm.model.DlmPurchaseAndRefundInfoDTO;
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
    int totalcnt = dlmPurchaseOrderService.purchaseOrderListTotal(purchaseOrderPgAndKeyWordDTO);
    
    model.addAttribute("listPurchaseOrderInfo", listPurchaseOrderInfo);
    model.addAttribute("purchaseOrderListTotal", totalcnt);
   
    return "dlm/purchaseList";
  }
  
  // 발주 지시서 상세 목록 조회
  @RequestMapping("purchaseOrderDtlList.do")
  public String purchaseOrderDtlList(@ModelAttribute PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO, Model model, HttpSession session)throws Exception {
    
    int currentPage = purchaseOrderPgAndKeyWordDTO.getCurrentPage();
    int pageSize = purchaseOrderPgAndKeyWordDTO.getPageSize();
    int pageIndex = (currentPage - 1) * pageSize;
    
    purchaseOrderPgAndKeyWordDTO.setLoginID((String) session.getAttribute("loginId"));
    
    purchaseOrderPgAndKeyWordDTO.setPageIndex(pageIndex);
    
    List<DlmPurchaseOrderDTO> listPurchaseOrderDtlInfo = dlmPurchaseOrderService.purchaseOrderDtlListByCompany(purchaseOrderPgAndKeyWordDTO);
    int totalcnt = dlmPurchaseOrderService.purchaseOrderDtlListTotal(purchaseOrderPgAndKeyWordDTO);
    
    model.addAttribute("listPurchaseOrderDtlInfo", listPurchaseOrderDtlInfo);
    model.addAttribute("purchaseOrderDtlListTotal", totalcnt);
    
    return "dlm/purchaseDtlList";
  }
  
  // 반품 요청
  @RequestMapping(value = "/refundOrder", method = RequestMethod.POST)
  @ResponseBody
  public Map<String, Object> refundAndCreateDirection(@RequestBody List<DlmPurchaseAndRefundInfoDTO>refundList, HttpSession session)throws Exception {
    Map<String, Object>resultMap = new HashMap<String, Object>();
    String loginID = (String)session.getAttribute("loginId");
    
    logger.info("requestDTO_List -------"+refundList);
    resultMap = dlmPurchaseOrderService.refundInfoInit(refundList,loginID);
    
    
    return resultMap;
  }
  
  // 발주 처리 & 입고 처리
  @RequestMapping(value="/purchaseOrder", method = RequestMethod.POST)
  @ResponseBody
  public Map<String, Object> purchaseAndStorage(@RequestBody List<DlmPurchaseAndRefundInfoDTO>purchaseList, HttpSession session) throws Exception {
    Map<String, Object>resultMap = new HashMap<String, Object>();
    String loginID = (String)session.getAttribute("loginId");
    
    logger.info("requestDTO_List -----------"+purchaseList);
    resultMap = dlmPurchaseOrderService.purchaseAndMngStorage(purchaseList, loginID);
    
    
    return resultMap;
  }
  
  
}
