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
		
		logger.info("whInventoryList.do 컨트롤러");
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));	//현재 페이지 번호
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));	//페이지 사이즈
		int pageIndex=(currentPage-1)*pageSize;	//페이지 시작 row 번호
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);		
		logger.info("whInventoryList.do => paramMap : "+paramMap);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		//창고 리스트 정보
		List<WHInventoryFormModel> listWHInventory=whInventoryFormService.whInventoryList(paramMap);		
		resultMap.put("listWHInventory", listWHInventory);
		
		//창고 리스트 페이징 정보 담기
		int whInventoryFormTotal=whInventoryFormService.countWHInventoryList(paramMap);
		resultMap.put("whInventoryFormTotal", whInventoryFormTotal);
		resultMap.put("pageSize", pageSize);
		resultMap.put("currentPage", currentPage);
		
		return resultMap;
	}
	
	//제품별 입출고 내역 (특정 창고의 특정 제품 입출고 내역)
	@RequestMapping("whProductList.do")
	@ResponseBody
	public Map<String, Object> whProductList(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("whProductList.do 컨트롤러");
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));	//현재 페이지 번호
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));	//페이지 사이즈
		int pageIndex=(currentPage-1)*pageSize;	//페이지 시작 row 번호
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);		
		logger.info("whProductList.do => paramMap : "+paramMap);
		
		Map<String, Object> resultMap = new HashMap<>();		
		
		//창고 입출고 내역 정보
		List<WHInventoryFormModel> listWHProduct=whInventoryFormService.whProductList(paramMap);
		resultMap.put("listWHProduct", listWHProduct);
		
		//창고 입출고 내역 페이징 정보 담기
		int whProductTotal=whInventoryFormService.countWHProductList(paramMap);
		resultMap.put("whProductTotal", whProductTotal);
		resultMap.put("pageSize", pageSize);
		resultMap.put("currentPage", currentPage);		
		
		logger.info("resultMap : " + resultMap);
		
		return resultMap;
	}	
}
