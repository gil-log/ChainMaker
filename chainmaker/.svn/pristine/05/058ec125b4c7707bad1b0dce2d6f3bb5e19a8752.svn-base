package kr.happyjob.chainmaker.pcm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.pcm.model.OrderDepositProcessingModel;
import kr.happyjob.chainmaker.pcm.service.OrderDepositProcessingService;

@Controller
@RequestMapping("/pcm/")
public class OrderDepositProcessingController {

	//Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	//Get class name for logger
	private final String className = this.getClass().toString();

	@Autowired
	private OrderDepositProcessingService orderDepositProcessingService;
	
	@RequestMapping("orderDepositProcessing.do")
	public String orderDepositProcessing(){
		logger.info("구매담당자_기업고객_주문내역관리");
		
		return "/pcm/orderDepositProcessing";
	}

	//구매담당자 - 기업고객_주문내역 조회
	@RequestMapping("orderDepositProcessingList.do")
	public String orderDepositProcessingList(Model model, @RequestParam Map<String, Object> paramMap){		
		logger.info("orderDepositProcessingList.do 컨트롤러 => 구매담당자_기업고객_주문내역 조회");
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		logger.info("orderDepositProcessingList.do => paramMap : "+paramMap);
		
		
		//주문 내역 조회 정보
		List<OrderDepositProcessingModel> listOrderDepositProcessing=orderDepositProcessingService.orderDepositProcessingList(paramMap);				
		model.addAttribute("listOrderDepositProcessing", listOrderDepositProcessing);
		logger.info("orderDepositProcessingList.do => listOrderDepositProcessing : "+listOrderDepositProcessing);
		
		//주문 내역 조회 페이징 정보
		int orderDepositProcessingTotal=orderDepositProcessingService.countOrderDepositProcessingList(paramMap);
		model.addAttribute("orderDepositProcessingTotal", orderDepositProcessingTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageOrderDepositProcessingList", currentPage);
		
		return "/pcm/orderDepositProcessingList";
	}
	
	//구매담당자 - 기업고객_주문내역 단건 조회
	@RequestMapping("orderDepositProcessingSelect.do")
	@ResponseBody
	public Map<String,Object> orderDepositProcessingSelect(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("orderDepositProcessingSelect.do 컨트롤러 => 구매담당자_기업고객_주문내역 단건 조회");		

		Map<String, Object> resultMap = new HashMap<>();
				
		//구매번호 별 주문 내역 단건 조회 정보
		OrderDepositProcessingModel orderDepositProcessingModel = orderDepositProcessingService.orderDepositProcessingSelect(paramMap);
		resultMap.put("orderDepositProcessingModel", orderDepositProcessingModel);	
		
		return resultMap;
	}

	//구매담당자_발주 지시서 목록 단건 상세 조회
	@RequestMapping("modalOrderDepositProcessingDtl.do")
	public String modalOrderDepositProcessingdtl(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("modalOrderDepositProcessingDtl.do => 구매담당자_기업고객_주문내역 목록 단건 상세 조회");		
		
//		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
//		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
//		int pageIndex=(currentPage-1)*pageSize;
//		
//		paramMap.put("pageIndex", pageIndex);
//		paramMap.put("pageSize", pageSize);
		logger.info("modalOrderDepositProcessingDtl.do => paramMap : "+paramMap);		
		
		//구매번호 별 주문 내역 단건 상세 조회 정보
		List<OrderDepositProcessingModel> modalOrderDepositProcessingDtlList = orderDepositProcessingService.orderDepositProcessingDtlList(paramMap);
		model.addAttribute("modalOrderDepositProcessingDtlList", modalOrderDepositProcessingDtlList);		
		
		//구매번호 별 주문 내역 단건 상세 조회 페이징 정보
		int modalOrderDepositProcessingDtlTotal = orderDepositProcessingService.countOrderDepositProcessingDtlList(paramMap);
		model.addAttribute("modalOrderDepositProcessingDtlTotal", modalOrderDepositProcessingDtlTotal);		
//		model.addAttribute("pageSize", pageSize);
//		model.addAttribute("currentPageModalOrderDepositProcessingDtl", currentPage);
				
		return "/pcm/orderDepositProcessingDtlList";
	}
	
	//입금 확인 처리
	@RequestMapping("confirmDeposit.do")
	@ResponseBody
	public String confirmDeposit(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("confirmDeposit.do 컨트롤러 => 구매담당자_기업고객_주문번호 별 입금 확인 처리");
		logger.info("confirmDeposit.do => paramMap : "+paramMap);
		String result="";
		
		//해당 주문번호의 입금 확인 처리
		if(orderDepositProcessingService.updateOrderDepositProcessing(paramMap) > 0) {
			result="입금확인";
		}else{
			result="에러 발생";
		}		
		return result;
	}
}

