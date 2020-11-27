package kr.happyjob.chainmaker.epc.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.happyjob.chainmaker.epc.model.OrderDetailDTO;
import kr.happyjob.chainmaker.epc.model.OrderListWithQtyAndDateDTO;
import kr.happyjob.chainmaker.epc.service.RefundRequestService;
import kr.happyjob.chainmaker.scm.model.DailyOrderListDTO;
import kr.happyjob.chainmaker.epc.model.OrdersRequestDTO;
import kr.happyjob.chainmaker.scm.service.DailyOrderHistoryService;

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
			, Model model, @ModelAttribute OrdersRequestDTO ordersRequestDTO) throws Exception {

		
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
	
	// 날짜와 주문 코드로 주문 내역 검색
	public Map<String, Object> getOrderListSearchByDateAndOrderCD(OrdersRequestDTO ordersRequestDTO) {
		Map<String, Object> resultMap = new HashMap<>();
		
		
		// 일별 주문 목록 조회
		List<DailyOrderListDTO> dailyOrderListByDateAndOrderCD = dailyOrderHistoryService.getDailyOrderListByDateAndOrderCD(ordersRequestDTO);
		resultMap.put("listDailyOrder", dailyOrderListByDateAndOrderCD);
		
		// 일별 주문 목록 카운트 조회
		int totalCount = dailyOrderHistoryService.countDailyOrderListByDateAndOrderCD(ordersRequestDTO);
		resultMap.put("totalCntDailyOrder", totalCount);
		
		return resultMap;
	}
	
}
