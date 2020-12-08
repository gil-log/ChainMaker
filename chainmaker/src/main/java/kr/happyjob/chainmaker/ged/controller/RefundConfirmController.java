package kr.happyjob.chainmaker.ged.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.ged.model.ResponseDTO;
import kr.happyjob.chainmaker.ged.model.PurchaseInfoDTO;
import kr.happyjob.chainmaker.ged.model.PurchaseRequestDTO;
import kr.happyjob.chainmaker.ged.model.RefundConfirmInfoVO;
import kr.happyjob.chainmaker.ged.service.OrderConfirmService;
import kr.happyjob.chainmaker.ged.service.RefundConfirmService;
import kr.happyjob.chainmaker.scm.model.RefundVO;

@Controller
@RequestMapping("ged")
public class RefundConfirmController {

	private final Logger logger = LogManager.getLogger(this.getClass());
	private final String className = this.getClass().toString();

	@Resource(name="RefundConfirmServiceImpl")
	private RefundConfirmService refundConfirmService;
	
	
	// 0. 초기화면으로이동.
	@RequestMapping("refundConfirm.do")
	private String refundConfirm() {

		logger.info("+ Start " + className + ".initRefundConfirm");  ////className???? 

		return "ged/refundConfirm";
	}
	
	 //1. 임원 승인 전 반품 신청 목록  ajax통신 반품 관련 내역 리스트 조회 
		@RequestMapping("refundConfirmList.do")
		public String selectBeforeApproveRefundList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".selectBeforeApproveRefundList");
				
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage")); // 현재페이지 
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
			int pageIndex = (currentPage -1)*pageSize;
			
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
			
			logger.info("   - paramMap : " + paramMap);

			//임원 승인 전 반품 목록 실질 조회 
			List<RefundConfirmInfoVO> refundConfirmList = refundConfirmService.selectBeforeApproveRefundList(paramMap);
			model.addAttribute("refundConfirmList", refundConfirmList);
			model.addAttribute("paramMap", paramMap);

			//반품 목록 총 갯수
			int totalCnt = refundConfirmService.countBeforeApprovePurchaseList(paramMap);
			model.addAttribute("totalCnt", totalCnt);
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPage", currentPage);
			
			logger.info("+ END " + className + ".selectRefundList");

			return "/ged/refundConfirmList";
		}
		
		
		//임원이 최종적으로 승인 버튼 누른다. ->인서트, 업데이트 테이블2개 
			@RequestMapping("clickCeoRefundConfirm.do")
			public void clickCeoRefundConfirm(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
					HttpServletResponse response, HttpSession session) throws Exception {
				
			logger.info("+ Start " + className + ".updateRefundWareNo");
					
				
			refundConfirmService.clickCeoRefundConfirm(paramMap);

			}		
			
			
		
		//clickCeoRefundConfirm
		
		
	
	/*@GetMapping
	@RequestMapping("/list/{listInfo}")
	public String getPurchaseList (@PathVariable(value = "listInfo") String listInfo
			, Model model, @ModelAttribute PurchaseRequestDTO purchaseRequestDTO) throws Exception {

		//public List<RefundConfirmInfoVO> selectBeforeApproveRefundList(RefundConfirmInfoVO refundConfirmInfoVO);
		
		int currentPage = purchaseRequestDTO.getCurrentPage();
		int pageSize = purchaseRequestDTO.getPageSize();
		int pageIndex = (currentPage-1)*pageSize;	// 페이지 시작 row 번호

		purchaseRequestDTO.setPageIndex(pageIndex);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageDailyOrder",currentPage);
		
		String viewLocation = "";
		
		
		// pathValue listInfo 타입 별로, 일별 리스트 조회 내역 or 해당 주문의 상세 내역 리스트 메소드 호출 
		Map<String, Object> resultMap = new HashMap<>();
		
		switch(listInfo){
			case "purchase" : {
				//resultMap에 담아서 결과 리스트 가져온다.
				resultMap = getPurchaseList(purchaseRequestDTO);
				
				// resultMap의 key들을 set에 가져온다.
				Set<String> keySet = resultMap.keySet();
				Iterator<String> keyIterator = keySet.iterator();
				
				// model에 key와 value에 해당하는 값을 담아준다.
				while(keyIterator.hasNext()) {
					String key = keyIterator.next();
					Object value = resultMap.get(key);
					model.addAttribute(key, value);
				}
				
				viewLocation = "/ged/orderConfirmList";
				
				break;
			}
		}
		
		return viewLocation;
	}*/
	
	// 수량, 날짜 정보 가진 orderlist
	/*public Map<String, Object> getPurchaseList(PurchaseRequestDTO purchaseRequestDTO) {
		
		Map<String, Object> resultMap = new HashMap<>();
		
		// 일별 주문 목록 조회
		List<PurchaseInfoDTO> purchaseInfoList = orderConfirmServiceImpl.getBeforeApprovePurchaseList(purchaseRequestDTO);
		resultMap.put("purchaseInfoList", purchaseInfoList);
		
		int totalCount = orderConfirmServiceImpl.countBeforeApprovePurchaseList(purchaseRequestDTO);
		resultMap.put("totalCntDailyOrder", totalCount);
		
		return resultMap;
	}*/
	
	/*@RequestMapping(value = "/purchase/{purchaseNo}", method = RequestMethod.PUT)
	@ResponseBody
	public ResponseDTO postDirection(@PathVariable(value="purchaseNo") int purchaseNo) {
		
		ResponseDTO responseDTO = new ResponseDTO();
		
		logger.info("purchaseNo : "+purchaseNo);
		
		PurchaseRequestDTO purchaseRequestDTO = new PurchaseRequestDTO();
		purchaseRequestDTO.setPurchase_no(purchaseNo);
		
		orderConfirmServiceImpl.confirmPurchaseByPurchaseNo(purchaseRequestDTO);
		
		responseDTO.setResult("SUCCESS");
		responseDTO.setMsg("발주를 승인 하셨습니다.");
		
		
		return responseDTO;
	}*/
}
