package kr.happyjob.chainmaker.dlm.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.dlm.model.EPCRefundDetailInfoDTO;
import kr.happyjob.chainmaker.dlm.model.EPCRefundInfoDTO;
import kr.happyjob.chainmaker.dlm.model.RefundInfoRequestDTO;
import kr.happyjob.chainmaker.dlm.model.StockProcessingRequestDTO;
import kr.happyjob.chainmaker.dlm.model.StockProcessingResponseDTO;
import kr.happyjob.chainmaker.dlm.service.RefundBuyerService;

@Controller
@RequestMapping("/dlm/refundBuyer.do")
public class RefundBuyerController {

	//Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	//Get class name for logger
	private final String className = this.getClass().toString();
		
	@Resource(name="RefundBuyerServiceImpl")
	private RefundBuyerService refundBuyerServiceImpl;
	
	//기업고객(발주 지시서 목록)_배송담당자
	@RequestMapping("")
	public String whInventoryForm(){
		logger.info("기업고객_반품  지시서 목록_배송담당자 페이지");
		
		return "dlm/refundBuyer";
	}
	
	/**
	 * 반품 관련 내역 리스트 조회 
	 */
	@GetMapping
	@RequestMapping("/list/{listInfo}")
	public String getListDailyOrderHistoryOrDetail (@PathVariable(value = "listInfo") String listInfo
			, Model model, @ModelAttribute RefundInfoRequestDTO refundInfoRequestDTO, HttpSession session) throws Exception {

		
		String loginID = (String)session.getAttribute("loginId");
		
		refundInfoRequestDTO.setLoginID(loginID);
		
		int currentPage = refundInfoRequestDTO.getCurrentPage();
		int pageSize = refundInfoRequestDTO.getPageSize();
		int pageIndex = (currentPage-1)*pageSize;	// 페이지 시작 row 번호

		refundInfoRequestDTO.setPageIndex(pageIndex);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageDailyOrder",currentPage);
		
		String viewLocation = "";
		
		
		// pathValue listInfo 타입 별로, 일별 리스트 조회 내역 or 해당 주문의 상세 내역 리스트 메소드 호출 
		Map<String, Object> resultMap = new HashMap<>();
		
		switch(listInfo){
			case "refund" : {
				//resultMap에 담아서 결과 리스트 가져온다.
				resultMap = getRefundListByDateAndCompanyName(refundInfoRequestDTO);
				
				// resultMap의 key들을 set에 가져온다.
				Set<String> keySet = resultMap.keySet();
				Iterator<String> keyIterator = keySet.iterator();
				
				// model에 key와 value에 해당하는 값을 담아준다.
				while(keyIterator.hasNext()) {
					String key = keyIterator.next();
					Object value = resultMap.get(key);
					model.addAttribute(key, value);
				}
				
				viewLocation = "/dlm/refundBuyerList";
				
				break;
			}
			
			case "detail" : {
				
				resultMap = getRefundDetailByRefundNo(refundInfoRequestDTO);
				// resultMap의 key들을 set에 가져온다.
				
				Set<String> keySet = resultMap.keySet();
				Iterator<String> keyIterator = keySet.iterator();
				
				// model에 key와 value에 해당하는 값을 담아준다.
				while(keyIterator.hasNext()) {
					String key = keyIterator.next();
					Object value = resultMap.get(key);
					model.addAttribute(key, value);
				}
				
				viewLocation = "/dlm/refundBuyerDetailList";
				
				break;
			}
			
			default : {
				
				
				break;
			}
			
		}
		
		return viewLocation;
	}
	
	public Map<String, Object> getRefundListByDateAndCompanyName(RefundInfoRequestDTO refundInfoRequestDTO) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<>();
		
		// 일별 주문 목록 조회
		List<EPCRefundInfoDTO> EPCRefundInfoList = refundBuyerServiceImpl.getEPCRefundListByRefundDateAndCompanyName(refundInfoRequestDTO);
		resultMap.put("EPCRefundInfoList", EPCRefundInfoList);
		
		int totalCount = refundBuyerServiceImpl.countEPCRefundListByRefundDateAndCompanyName(refundInfoRequestDTO);
		resultMap.put("totalCntDailyOrder", totalCount);
		
		return resultMap;
	}
	
	public Map<String, Object> getRefundDetailByRefundNo(RefundInfoRequestDTO refundInfoRequestDTO) throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		
		List<EPCRefundDetailInfoDTO> refundDetailList = refundBuyerServiceImpl.getRefundDetailListByRefundNo(refundInfoRequestDTO);
		
		resultMap.put("refundDetailList",refundDetailList);

		int totalCount = refundBuyerServiceImpl.countRefundDetailListByRefundNo(refundInfoRequestDTO);
		resultMap.put("totalCntDailyOrder", totalCount);
		
		return resultMap;
	}
	
	@RequestMapping(value="/refund/{refundNo}", method = RequestMethod.PATCH)
	@ResponseBody
	public StockProcessingResponseDTO processStockAndUpdateProductIOQtyAndRefundConfirmCD(@PathVariable(value = "refundNo") int refundNo) throws Exception {
		
		StockProcessingRequestDTO requestDTO = new StockProcessingRequestDTO(refundNo);
		
		String proIOCD = "in_pre";
		
		requestDTO.setPro_io_cd(proIOCD);
		
		StockProcessingResponseDTO resultResponseDTO = refundBuyerServiceImpl.stockInWarehouse(requestDTO);
		
		return resultResponseDTO;
	}

	
}
