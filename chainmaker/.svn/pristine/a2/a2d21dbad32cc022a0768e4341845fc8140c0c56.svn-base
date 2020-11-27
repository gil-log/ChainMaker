package kr.happyjob.chainmaker.ged.controller;

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
import kr.happyjob.chainmaker.epc.model.OrdersRequestDTO;
import kr.happyjob.chainmaker.ged.model.CompanySalesDTO;
import kr.happyjob.chainmaker.ged.model.CompanySalesDetailDTO;
import kr.happyjob.chainmaker.ged.model.SalesRequestDTO;
import kr.happyjob.chainmaker.ged.service.SalesStatusService;

@Controller
@RequestMapping("/ged/salesStatus.do")
public class SalesStatusController {

	private final Logger logger = LogManager.getLogger(this.getClass());

	@Resource(name="SalesStatusServiceImpl")
	private SalesStatusService salesStatusServiceImpl;

	@RequestMapping(value="")
	public String getSalesStatusPage() {
		String viewLocation = "/ged/salesStatus";
		return viewLocation;
	}
	
	
	/**
	 * 매출 관련 내역 리스트 조회 
	 */
	@GetMapping
	@RequestMapping("/list/{listInfo}")
	public String getListDailyOrderHistoryOrDetail (@PathVariable(value = "listInfo") String listInfo
			, Model model, @ModelAttribute SalesRequestDTO salesRequestDTO) throws Exception {

		
		int currentPage = salesRequestDTO.getCurrentPage();
		int pageSize = salesRequestDTO.getPageSize();
		int pageIndex = (currentPage-1)*pageSize;	// 페이지 시작 row 번호

		salesRequestDTO.setPageIndex(pageIndex);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageDailyOrder",currentPage);
		
		String viewLocation = "";
		
		
		// pathValue listInfo 타입 별로, 일별 리스트 조회 내역 or 해당 주문의 상세 내역 리스트 메소드 호출 
		Map<String, Object> resultMap = new HashMap<>();
		
		switch(listInfo){
			case "total" : {
				//resultMap에 담아서 결과 리스트 가져온다.
				resultMap = getTotalSalesList(salesRequestDTO);
				
				// resultMap의 key들을 set에 가져온다.
				Set<String> keySet = resultMap.keySet();
				Iterator<String> keyIterator = keySet.iterator();
				
				// model에 key와 value에 해당하는 값을 담아준다.
				while(keyIterator.hasNext()) {
					String key = keyIterator.next();
					Object value = resultMap.get(key);
					model.addAttribute(key, value);
				}
				
				viewLocation = "/ged/salesStatusList";
				
				break;
			}
			
			case "detail" : {
				//resultMap에 담아서 결과 리스트 가져온다.
				resultMap = getDetailSalesList(salesRequestDTO);
				
				// resultMap의 key들을 set에 가져온다.
				Set<String> keySet = resultMap.keySet();
				Iterator<String> keyIterator = keySet.iterator();
				
				// model에 key와 value에 해당하는 값을 담아준다.
				while(keyIterator.hasNext()) {
					String key = keyIterator.next();
					Object value = resultMap.get(key);
					model.addAttribute(key, value);
				}
				
				viewLocation = "/ged/salesStatusDetailList";
				
				break;
			}
		}
		
		return viewLocation;
	}
	
	public Map<String, Object> getDetailSalesList(SalesRequestDTO salesRequestDTO){
		Map<String, Object> resultMap = new HashMap<>();
		
		List<CompanySalesDetailDTO> companySalesDTOList = salesStatusServiceImpl.getCompanySalesDetailListByCompanyName(salesRequestDTO);
		
		int totalCntDailyOrder = salesStatusServiceImpl.countCompanySalesDetailListByCompanyName(salesRequestDTO);
		
		resultMap.put("companySalesDTODetailList", companySalesDTOList);
		resultMap.put("totalCntDailyOrder", totalCntDailyOrder);
		
		return resultMap;
	}
	
	public Map<String, Object> getTotalSalesList(SalesRequestDTO salesRequestDTO){
		Map<String, Object> resultMap = new HashMap<>();
		
		List<CompanySalesDTO> companySalesDTOList = salesStatusServiceImpl.getCompanySalesList(salesRequestDTO);
		
		int totalCntDailyOrder = salesStatusServiceImpl.countCompanySales(salesRequestDTO);
		
		resultMap.put("companySalesDTOList", companySalesDTOList);
		resultMap.put("totalCntDailyOrder", totalCntDailyOrder);
		
		return resultMap;
	}
	
}
