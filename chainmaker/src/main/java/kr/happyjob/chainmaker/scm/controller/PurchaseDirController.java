package kr.happyjob.chainmaker.scm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.scm.model.PurchaseDirectionModel;
import kr.happyjob.chainmaker.scm.service.PurchaseDirService;


@Controller
@RequestMapping("scm")
public class PurchaseDirController {
	
	@Autowired
	PurchaseDirService service;
	
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
		
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	// 1. 발주 지시서 초기페이지
	
	@RequestMapping("purchaseDir")
	private String purchaseDirection(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".purchaseDir");
		logger.info("   - paramMap : " + paramMap);
		logger.info("+ End " + className + ".courseMng");
		
		return "scm/purchaseDirection";
	}
	
	// 2.발주 지시서 AJAX 로딩 페이지
	@ResponseBody
	@RequestMapping("directionList.do")
	private Map<String, Object> directionList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		  logger.info("+ Start " + className + ".directionList");
		  logger.info("   - paramMap : " + paramMap);
		  
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);

		String searchWord = (String)paramMap.get("searchWord");
		String searchKey = (String)paramMap.get("searchKey");
		String fromDate = (String)paramMap.get("fromDate");
		String toDate = (String)paramMap.get("toDate");

		paramMap.put("searchWord", searchWord);
		paramMap.put("searchKey", searchKey);
		paramMap.put("fromDate", fromDate);
		paramMap.put("toDate", toDate);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 과정 목록 조회
		List<PurchaseDirectionModel> dirList = service.selectDirection(paramMap);
		resultMap.put("dirList", dirList);
		
		// 공통 그룹코드 목록 카운트 조회
		int totalCount = service.countDirection(paramMap);
		resultMap.put("totalCount", totalCount);
		
		resultMap.put("pageSize", pageSize);
		resultMap.put("currentPageComnGrpCod",currentPage);
		
		logger.info("+ End " + className + ".directionList");
		

		return resultMap;
		  
	}


	
	

}
