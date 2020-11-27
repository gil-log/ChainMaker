package kr.happyjob.chainmaker.scm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.scm.model.WHInventoryFormModel;
import kr.happyjob.chainmaker.scm.service.WHInventoryFormService;


@Controller
@RequestMapping("/scm/")
public class WHInventoryFormController {

	//Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	//Get class name for logger
	private final String className = this.getClass().toString();
		
	@Autowired
	private WHInventoryFormService whInventoryFormService;
	
	//창고별 재고 현황 페이지 연결
	@RequestMapping("whInventoryForm.do")
	public String whInventoryForm(){
		logger.info("창고별 재고 현황 페이지");
		
		return "scm/whInventoryForm";
	}
	
	//창고별 재고 조회
	@RequestMapping("whInventoryList.do")
	@ResponseBody
	public Map<String, Object> whInventoryList(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("@@@ Ajax컨트롤러 => whInventoryList.do 작동 @@@");
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));	//현재 페이지 번호
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));	//페이지 사이즈
		int pageIndex=(currentPage-1)*pageSize;	//페이지 시작 row 번호
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);		
		
		Map<String, Object> resultMap = new HashMap<>();
		
		//select문 리스트에 담기
		List<WHInventoryFormModel> listWHInventory=whInventoryFormService.whInventoryList(paramMap);
		//Map에 list 담기
		resultMap.put("listWHInventory", listWHInventory);
		
		//paging 정보 담기
		int whInventoryFormTotal=whInventoryFormService.countWHInventoryList(paramMap);
		resultMap.put("whInventoryFormTotal", whInventoryFormTotal);
		resultMap.put("pageSize", pageSize);
		resultMap.put("currentPage", currentPage);
		
		return resultMap;
	}
	
	////제품별 입출고 내역 (특정 창고의 특정 제품 입출고 내역)
	@RequestMapping("whProductList.do")
	@ResponseBody
	public Map<String, Object> whProductList(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("@@@ Ajax컨트롤러 => whProductList.do 작동 @@@");
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));	//현재 페이지 번호
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));	//페이지 사이즈
		int pageIndex=(currentPage-1)*pageSize;	//페이지 시작 row 번호
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);		
		
		Map<String, Object> resultMap = new HashMap<>();		
		
		//select문 리스트에 담기
		List<WHInventoryFormModel> listWHProduct=whInventoryFormService.whProductList(paramMap);
				
		//Map에 list 담기
		resultMap.put("listWHProduct", listWHProduct);
		
		//paging 정보 담기
		int whProductTotal=whInventoryFormService.countWHProductList(paramMap);
		resultMap.put("whProductTotal", whProductTotal);
		resultMap.put("pageSize", pageSize);
		resultMap.put("currentPage", currentPage);		
		
		logger.info("resultMap : " + resultMap);
		
		return resultMap;
	}	
}
