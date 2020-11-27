package kr.happyjob.chainmaker.epc.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.epc.model.OrderDetailDTO;
import kr.happyjob.chainmaker.epc.model.OrderListWithQtyAndDateDTO;
import kr.happyjob.chainmaker.epc.service.RefundRequestService;
import kr.happyjob.chainmaker.epc.model.ResponseDTO;
import kr.happyjob.chainmaker.epc.model.OrdersRequestDTO;
import kr.happyjob.chainmaker.epc.model.RefundInfoDTO;
import kr.happyjob.chainmaker.epc.model.RefundUserInfoDTO;

@Controller
@RequestMapping(value="/epc/refundrequest.do")
public class RefundRequestController {
	
	private final Logger logger = LogManager.getLogger(this.getClass());

	@Resource(name="RefundRequestServiceImpl")
	private RefundRequestService refundRequestServiceImpl;
	
	
	@RequestMapping(value="")
	public String getRefundRequestPage() {
		String viewLocation = "/epc/refundRequest";
		return viewLocation;
	}
	
	/**
	 * 반품 관련 내역 리스트 조회 
	 */
	@GetMapping
	@RequestMapping("/list/{listInfo}")
	public String getListDailyOrderHistoryOrDetail (@PathVariable(value = "listInfo") String listInfo
			, Model model, @ModelAttribute OrdersRequestDTO ordersRequestDTO, HttpSession session) throws Exception {

		
		String loginID = (String)session.getAttribute("loginId");
		
		ordersRequestDTO.setLoginID(loginID);
		
		int currentPage = ordersRequestDTO.getCurrentPage();
		int pageSize = ordersRequestDTO.getPageSize();
		int pageIndex = (currentPage-1)*pageSize;	// 페이지 시작 row 번호

		ordersRequestDTO.setPageIndex(pageIndex);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageDailyOrder",currentPage);
		
		String viewLocation = "";
		
		
		// pathValue listInfo 타입 별로, 일별 리스트 조회 내역 or 해당 주문의 상세 내역 리스트 메소드 호출 
		Map<String, Object> resultMap = new HashMap<>();
		
		switch(listInfo){
			case "order" : {
				//resultMap에 담아서 결과 리스트 가져온다.
				resultMap = getOrderListWithQtyAndDate(ordersRequestDTO);
				
				// resultMap의 key들을 set에 가져온다.
				Set<String> keySet = resultMap.keySet();
				Iterator<String> keyIterator = keySet.iterator();
				
				// model에 key와 value에 해당하는 값을 담아준다.
				while(keyIterator.hasNext()) {
					String key = keyIterator.next();
					Object value = resultMap.get(key);
					model.addAttribute(key, value);
				}
				
				viewLocation = "/epc/refundRequestOrderList";
				
				break;
			}
			
			case "product" : {
				
				resultMap = getOrderDetailProductInfoByOrderNo(ordersRequestDTO);
				// resultMap의 key들을 set에 가져온다.
				
				Set<String> keySet = resultMap.keySet();
				Iterator<String> keyIterator = keySet.iterator();
				
				// model에 key와 value에 해당하는 값을 담아준다.
				while(keyIterator.hasNext()) {
					String key = keyIterator.next();
					Object value = resultMap.get(key);
					model.addAttribute(key, value);
				}
				
				viewLocation = "/epc/refundRequestOrderDetailList";
				
				break;
			}
			
			default : {
				
				
				break;
			}
			
		}
		
		return viewLocation;
	}
	
	public Map<String, Object> getOrderDetailProductInfoByOrderNo(OrdersRequestDTO ordersRequestDTO){
		Map<String, Object> resultMap = new HashMap<>();
		
		List<OrderDetailDTO> orderDetailDTOList = refundRequestServiceImpl.getOrderDetailProductInfoByOrderNo(ordersRequestDTO);
		
		resultMap.put("orderDetailDTOList",orderDetailDTOList);
		
		return resultMap;
	}
	
	
	// 수량, 날짜 정보 가진 orderlist
	public Map<String, Object> getOrderListWithQtyAndDate(OrdersRequestDTO ordersRequestDTO) {
		
		Map<String, Object> resultMap = new HashMap<>();
		
		// 일별 주문 목록 조회
		List<OrderListWithQtyAndDateDTO> listDailyOrder = refundRequestServiceImpl.getOrderListWithQtyAndDateByDate(ordersRequestDTO);
		resultMap.put("orderListWithQtyAndDate", listDailyOrder);
		
		int totalCount = refundRequestServiceImpl.countOrderListByDate(ordersRequestDTO);
		resultMap.put("totalCntDailyOrder", totalCount);
		
		return resultMap;
	}
	
	@RequestMapping(value = "/direction/{type}", method = RequestMethod.POST)
	@ResponseBody
	public ResponseDTO postDirection(@PathVariable(value="type") String type, @RequestBody List<RefundInfoDTO> refundInfoList) {
		
		ResponseDTO responseDTO = new ResponseDTO();
		
		logger.info("direction type : "+type);
		
		switch(type) {
		
			case "refund" : {
				
				int refundResult = refundRequestServiceImpl.putRefundDirection(refundInfoList);
				
				logger.info("반품 결과 : " + refundResult);
				
				responseDTO.setResult("SUCCESS");
				responseDTO.setMsg("반품 신청이 완료 되었습니다.");
				
				if(refundResult == -1) {
					responseDTO.setResult("FAIL");
					responseDTO.setMsg("반품 신청에 실패 하였습니다.");
				}
				break;
			}
			
		}
		
		return responseDTO;
	}
	
	@RequestMapping(value= "/user/{type}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getUserInfo(@PathVariable(value="type") String type, HttpSession session){

		Map<String, Object> resultMap = new HashMap<>();
		
		switch(type) {
			case "refund" : {
			
				RefundUserInfoDTO refundUserInfoDTO = new RefundUserInfoDTO();
				
				String loginID = (String) session.getAttribute("loginId");
				
				refundUserInfoDTO.setLoginID(loginID);
				
				RefundUserInfoDTO resultRefundUserInfo = refundRequestServiceImpl.getRefundUserInfo(refundUserInfoDTO);
				
				resultMap.put("refundUserInfo", resultRefundUserInfo);
				
				break;
			}
		}
		
		return resultMap;
	}
	
	
	
}
