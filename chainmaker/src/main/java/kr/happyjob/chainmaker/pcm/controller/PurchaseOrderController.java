package kr.happyjob.chainmaker.pcm.controller;

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

import kr.happyjob.chainmaker.pcm.model.PurchaseOrderModel;
import kr.happyjob.chainmaker.pcm.service.PurchaseOrderService;

@Controller
@RequestMapping("/pcm/")
public class PurchaseOrderController {

	//Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	//Get class name for logger
	private final String className = this.getClass().toString();

	@Autowired
	PurchaseOrderService purchaseOrderService;
	
	@RequestMapping("purchaseOrder.do")
	public String purchaseOrder(){
		logger.info("구매담당자 - 제품 발주/반품 목록");
		
		return "pcm/purchaseOrder";
	}
	
	@RequestMapping("purchaseOrderList.do")
	public String purchaseOrderList(Model model, @RequestParam Map<String, Object> paramMap){		
		logger.info("구매담당자 - 제품 발주/반품 목록 => 데이터 전송");
		logger.info("paramMap : "+paramMap);
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		
		//DB의 목록 list에 담아 purchaseOrderList.jsp로 전달
		List<PurchaseOrderModel> listPurchaseOrder=purchaseOrderService.purchaseOrderList(paramMap);
		
		//가상 더미데이터
		PurchaseOrderModel pur=new PurchaseOrderModel(1, "서울컴즈", "11ax무선공유기", 5, "purchase", "1");
		listPurchaseOrder.add(pur);		
		
		model.addAttribute("listPurchaseOrder", listPurchaseOrder);
		
		//DB목록의 total row를 담아 purchaseOrderList.jsp로 전달
		int purchaseOrderTotal=purchaseOrderService.countPurchaseOrderList(paramMap);
		
		//가상 더미데이터
		purchaseOrderTotal=1;
		
		model.addAttribute("purchaseOrderTotal", purchaseOrderTotal);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPagePurchaseOrderList", currentPage);
		
		return "/pcm/purchaseOrderList";
	}
	
	@RequestMapping("purchaseOrderSelect.do")
	@ResponseBody
	public PurchaseOrderModel purchaseOrderSelect(int purchase_no){
		logger.info("구매담당자 - 제품 발주/반품 단품 목록 => 데이터 전송");		
		
		return purchaseOrderService.purchaseOrderSelect(purchase_no);
	}
}
