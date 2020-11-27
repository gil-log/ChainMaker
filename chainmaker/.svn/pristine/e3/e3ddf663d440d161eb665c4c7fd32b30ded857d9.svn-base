package kr.happyjob.chainmaker.scm.controller;

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

import kr.happyjob.chainmaker.epc.model.OrderDetailDTO;
import kr.happyjob.chainmaker.epc.model.OrdersRequestDTO;
import kr.happyjob.chainmaker.epc.model.RefundUserInfoDTO;
import kr.happyjob.chainmaker.scm.model.ShippingOrderDTO;
import kr.happyjob.chainmaker.scm.model.ShippingOrderDetailDTO;
import kr.happyjob.chainmaker.scm.model.ShippingRequestDTO;
import kr.happyjob.chainmaker.scm.service.ShippingDirectionService;


@Controller
@RequestMapping("/scm/shippingDirection.do")
public class ShippingDirectionController {
	private final Logger logger = LogManager.getLogger(this.getClass());

	
	 @Resource(name="ShippingDirectionServiceImpl")
	 private ShippingDirectionService shippingDirectionServiceImpl;
	 
	
	@RequestMapping("")
	public String getShippingDirectionPage() {
		String viewLocation = "/scm/shippingDirection";
		return viewLocation;
	}
	
	/**
	 * 배송 관련 내역 리스트 조회 
	 */
	@GetMapping
	@RequestMapping("/list/{listInfo}")
	public String getListDailyOrderHistoryOrDetail (@PathVariable(value = "listInfo") String listInfo
			, Model model, @ModelAttribute ShippingRequestDTO shippingRequestDTO) throws Exception {

		
		int currentPage = shippingRequestDTO.getCurrentPage();
		int pageSize = shippingRequestDTO.getPageSize();
		int pageIndex = (currentPage-1)*pageSize;	// 페이지 시작 row 번호

		shippingRequestDTO.setPageIndex(pageIndex);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageDailyOrder",currentPage);
		
		String viewLocation = "";
		
		
		// pathValue listInfo 타입 별로, 일별 리스트 조회 내역 or 해당 주문의 상세 내역 리스트 메소드 호출 
		Map<String, Object> resultMap = new HashMap<>();
		
		switch(listInfo){
			case "shipping" : {
				//resultMap에 담아서 결과 리스트 가져온다.
				resultMap = getShippingOrderList(shippingRequestDTO);
				
				// resultMap의 key들을 set에 가져온다.
				Set<String> keySet = resultMap.keySet();
				Iterator<String> keyIterator = keySet.iterator();
				
				// model에 key와 value에 해당하는 값을 담아준다.
				while(keyIterator.hasNext()) {
					String key = keyIterator.next();
					Object value = resultMap.get(key);
					model.addAttribute(key, value);
				}
				
				viewLocation = "/scm/shippingDirectionList";
				
				break;
			}
			
			case "unshipping" : {
				//resultMap에 담아서 결과 리스트 가져온다.
				resultMap = getUnShippingOrderList(shippingRequestDTO);
				
				// resultMap의 key들을 set에 가져온다.
				Set<String> keySet = resultMap.keySet();
				Iterator<String> keyIterator = keySet.iterator();
				
				// model에 key와 value에 해당하는 값을 담아준다.
				while(keyIterator.hasNext()) {
					String key = keyIterator.next();
					Object value = resultMap.get(key);
					model.addAttribute(key, value);
				}
				
				viewLocation = "/scm/shippingDirectionList";
				
				break;
			}
		}
		
		return viewLocation;
	}
	
	public Map<String, Object> getUnShippingOrderList(ShippingRequestDTO shippingRequestDTO){
		Map<String, Object> resultMap = new HashMap<>();
		
		shippingRequestDTO.setShip_cd("unshippng");
		
		List<ShippingOrderDTO> shippingDirectionList = shippingDirectionServiceImpl.getShippingOrderList(shippingRequestDTO);
		
		int totalCntDailyOrder = shippingDirectionServiceImpl.countShippingOrderList(shippingRequestDTO);
		
		resultMap.put("shippingDirectionList", shippingDirectionList);
		resultMap.put("totalCntDailyOrder", totalCntDailyOrder);
		
		return resultMap;
	}
	
	public Map<String, Object> getShippingOrderList(ShippingRequestDTO shippingRequestDTO){
		Map<String, Object> resultMap = new HashMap<>();
		
		List<ShippingOrderDTO> shippingDirectionList = shippingDirectionServiceImpl.getShippingOrderList(shippingRequestDTO);
		
		int totalCntDailyOrder = shippingDirectionServiceImpl.countShippingOrderList(shippingRequestDTO);
		
		resultMap.put("shippingDirectionList", shippingDirectionList);
		resultMap.put("totalCntDailyOrder", totalCntDailyOrder);
		
		return resultMap;
	}
	
	
	@RequestMapping(value= "/order/{orderNo}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getUserInfo(@PathVariable(value="orderNo") int orderNo){

		Map<String, Object> resultMap = new HashMap<>();
		
		ShippingRequestDTO shippingRequestDTO = new ShippingRequestDTO();
		
		shippingRequestDTO.setOrder_no(orderNo);
		
		List<ShippingOrderDetailDTO> shippingOrderDetailList = shippingDirectionServiceImpl.getShippingOrderDetailList(shippingRequestDTO);
		
		resultMap.put("shippingOrderDetailList", shippingOrderDetailList);
		
		return resultMap;
	}
	
	
	
}
