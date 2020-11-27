package kr.happyjob.chainmaker.dlm.service;

import java.util.Collections;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.dlm.dao.DlmPurchaseOrderDao;
import kr.happyjob.chainmaker.dlm.model.DlmPurchaseAndRefundInfoDTO;
import kr.happyjob.chainmaker.dlm.model.DlmPurchaseOrderDTO;
import kr.happyjob.chainmaker.dlm.model.DlmPurchaseOrderVO;
import kr.happyjob.chainmaker.dlm.model.PurchaseOrderPgAndScKeyWordDTO;
import java.util.Comparator;

@Service
public class DlmPurchaseOrderServiceImpl implements DlmPurchaseOrderService{

  @Autowired
  DlmPurchaseOrderDao dlmPurchaseOrderDao;
  
  
  
  @Override
  // 담당자 별 발주 리스트 목록 조회
  public List<DlmPurchaseOrderDTO> purchaseOrderListByMng(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception {
    // VO에서 DTO변환 과정
    List<DlmPurchaseOrderVO> purchaseOrderList = dlmPurchaseOrderDao.purchaseOrderListByMng(purchaseOrderPgAndKeyWordDTO);
    Iterator<DlmPurchaseOrderVO> iter = purchaseOrderList.iterator();
    
    List<DlmPurchaseOrderDTO> resultDTOList = new LinkedList<DlmPurchaseOrderDTO>();
    
    while (iter.hasNext()) {
      DlmPurchaseOrderVO dlmPurchaseOrderVO = iter.next();
      DlmPurchaseOrderDTO resultDTO = new DlmPurchaseOrderDTO(dlmPurchaseOrderVO);
      resultDTOList.add(resultDTO);
    }
    return resultDTOList;
  }

  @Override
  // 발주 리스트 조회 목록 수
  public int purchaseOrderListTotal(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception {
    return dlmPurchaseOrderDao.purchaseOrderListTotal(purchaseOrderPgAndKeyWordDTO);
  }

  @Override
  // 업체별 발주 상세 목록 조회
  public List<DlmPurchaseOrderDTO> purchaseOrderDtlListByCompany(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception {
 // VO에서 DTO변환 과정
    List<DlmPurchaseOrderVO> purchaseOrderDtlList = dlmPurchaseOrderDao.purchaseOrderDtlListByCompany(purchaseOrderPgAndKeyWordDTO);
    Iterator<DlmPurchaseOrderVO> iter = purchaseOrderDtlList.iterator();
    
    List<DlmPurchaseOrderDTO> resultDTOList = new LinkedList<DlmPurchaseOrderDTO>();
    
    while (iter.hasNext()) {
      DlmPurchaseOrderVO dlmPurchaseOrderVO = iter.next();
      DlmPurchaseOrderDTO resultDTO = new DlmPurchaseOrderDTO(dlmPurchaseOrderVO);
      resultDTOList.add(resultDTO);
    }
    return resultDTOList;
  }

  @Override
  // 발주 리스트 상세 조회 목록 수
  public int purchaseOrderDtlListTotal(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception {
    return dlmPurchaseOrderDao.purchaseOrderDtlListTotal(purchaseOrderPgAndKeyWordDTO);
  }

  
  // 반품 정보 생성
  public int refundInfoInit(List<DlmPurchaseAndRefundInfoDTO> resendList) throws Exception {
//    
//    List<Map<String, Object>> resendList = (List<Map<String, Object>>) paramMap.get("resendList");
//    
//    
//    List<DlmPurchaseAndRefundInfoDTO> orderByPurchaseNoDTOList = new LinkedList<>();
//    
//    int tempPurchaseNo = 0;
//    int nowPurchaseNo = 0;
//    
//    
//    
//    Comparator<DlmPurchaseAndRefundInfoDTO> purchaseComparator = new Comparator<DlmPurchaseAndRefundInfoDTO>()
//    {
//    @Override
//    public int compare(DlmPurchaseAndRefundInfoDTO dto1, DlmPurchaseAndRefundInfoDTO dto2) {
//      
//      int result = 0;
//      if(dto1.getPurchase_no() > dto2.getPurchase_no()) {
//        result = 1;
//      } else if(dto1.getPurchase_no() == dto2.getPurchase_no()) {
//        result = 0;
//      } else if(dto1.getPurchase_no() < dto2.getPurchase_no()) {
//        result = -1;
//      }
//      
//      return result;
//    }
//    };
//    
//    
//    Collections.sort(resendList, purchaseComparator);
//    
//    
//    
//    
//    
//    
//    
//    DlmPurchaseAndRefundInfoDTO firstBeforeOrderByPurchaseNoDTO = resendList.get(0);
//    int firstPurchaseNo = firstBeforeOrderByPurchaseNoDTO.getPurchase_no();
//    
//    orderByPurchaseNoDTOList.add(firstBeforeOrderByPurchaseNoDTO);
//    
//    tempPurchaseNo = firstPurchaseNo;
//    
//    for(int i = 1 ; i < resendList.size(); i++) {
//      
//      DlmPurchaseAndRefundInfoDTO nowBeforeOrderByPurchaseNoDTO = resendList.get(i);
//      
//      nowPurchaseNo = nowBeforeOrderByPurchaseNoDTO.getPurchase_no();
//      
//      if(nowPurchaseNo == tempPurchaseNo) {
//        
//        orderByPurchaseNoDTOList.add(nowBeforeOrderByPurchaseNoDTO);
//        
//      } else {
//        
//        tempPurchaseNo = nowPurchaseNo;
//        
//        // 여기가 다중 INsert들어가야 되는 부분
//        orderByPurchaseNoDTOList
//        
//        
//        
//        orderByPurchaseNoDTOList.clear();
//      }
//      
//    }
//    
//    
//    //List에서 INDEX 0 ~ LIST안에 크기만큼 일단 포문이든 반복문 돌ㄹ아야ㅑ되고
//    // lIST안에 INDEX에 해당하는 MAP에서 KEYWORD가 PURCHASE_NO인 에를
//    // TEMP에다 넣어두고 앞값들 하고 비교해야하는데 첫 값에 대해서는 예외 처리 해줘야되고
//    // TEMP랑 다음~~ INDEX에 해당하는 MAP에서 KEYWORD가 PURCHASE_NO가 같은 애들은
//    // 새로 Map<String, Object>에다가 LIST<DlmPurchaseAndRefundInfoDTO>
//    // 넣어줘야 하는데
//    
//    // 계속  LIST<DlmPurchaseAndRefundInfoDTO>에다가 ADD  해주다가 
//    // TEMP가 지금 INDEX에 해당하는 MAP에 키워드가 PURCHASE_NO의 OBJECT랑 달라지는 순간
//    
//    //  그전에 저장하고 있던  LIST<DlmPurchaseAndRefundInfoDTO> << 새로 생성했던애를
//    // DAO에 다중 인서트 하는거 해주고 
//    // TEMP 다시 반복
//    
//    
//   
//    
//    
//    
//    resendList.
//    
//    
//    
//    
//    
//    
//    
//    
//    int refundResult = dlmPurchaseOrderDao.insertRefundInfoRequest();
    int refundResult = 0;
    
    return refundResult;
  }

  
  
  
}