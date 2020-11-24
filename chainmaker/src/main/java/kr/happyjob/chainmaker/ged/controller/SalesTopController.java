package kr.happyjob.chainmaker.ged.controller;

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

import kr.happyjob.chainmaker.ged.model.SalesTopModel;
import kr.happyjob.chainmaker.ged.service.SalesTopService;


// ged/salesTop
@Controller
@RequestMapping("ged")
public class SalesTopController {
	
		@Autowired
		SalesTopService service;

	// Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());
			
		// Get class name for logger
		private final String className = this.getClass().toString();
	
		// 1. 매출 상위 초기페이지
		
		@RequestMapping("salesTop")
		private String salesTop(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".salesTop");
			logger.info("   - paramMap : " + paramMap);
			logger.info("+ End " + className + ".courseMng");
			
			return "ged/salesTop";
		}
		
		// 2. 매출 상위 AJAX 로딩 페이지
		@ResponseBody
		@RequestMapping("salesList.do")
		private Map<String, Object> 	salesList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception{
			
			//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
			  logger.info("+ Start " + className + ".salesList");
			  logger.info("   - paramMap : " + paramMap);

			String fromDate = (String)paramMap.get("fromDate");
			String toDate = (String)paramMap.get("toDate");

			paramMap.put("fromDate", fromDate);
			paramMap.put("toDate", toDate);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			// 매출 목록 조회
			List<SalesTopModel> salesList = service.selectSalesList(paramMap);
			resultMap.put("salesList", salesList);
			
			logger.info("+ End " + className + ".salesList");
			

			return resultMap;
			  
		}
		
		

}
