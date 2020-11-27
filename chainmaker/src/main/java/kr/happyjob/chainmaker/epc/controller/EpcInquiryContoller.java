package kr.happyjob.chainmaker.epc.controller;

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

import kr.happyjob.chainmaker.epc.model.EpcInquiryModel;
import kr.happyjob.chainmaker.epc.service.EpcInquiryService;

@Controller
@RequestMapping("/epc/")
public class EpcInquiryContoller {
	//빌립담당
	
	@Autowired
	EpcInquiryService inquiryService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	/* 초기화면 */
	@RequestMapping("inquiry.do")
	public String initInquiry(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".initInquiry");
		logger.info("   - paramMap: " + paramMap);
		
		List<EpcInquiryModel> listCategory = inquiryService.listCategory(paramMap);
		model.addAttribute("listCategory", listCategory);

		logger.info("+ End " + className + ".initInquiry");

		return "epc/Inquiry";
	}
	
	/* 문의 목록 조회 */
	@RequestMapping("InquiryList.do")
	public String listInquiry(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
	
		logger.info("+ Start " + className + ".listInquiry");
		logger.info("   - paramMap: " + paramMap);
		
		String loginID = (String)session.getAttribute("loginId");
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
		int pageIndex = (currentPage-1)*pageSize;
		
		paramMap.put("loginID", loginID);
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);

		System.out.println("loginID = " + loginID);
		
		// 목록 조회
		List<EpcInquiryModel> listInquiry = inquiryService.listInquiry(paramMap);
		// 카운트 조회
		int totalCount = inquiryService.inquiryTotalCnt(paramMap);
		
		model.addAttribute("listInquiry", listInquiry);
		model.addAttribute("totalCnt", totalCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);
		
		logger.info("+End" + className + ".listInquiry");

		
		return "epc/InquiryList";
	}
	
	@RequestMapping("detailInquiry.do")
	@ResponseBody
	public Map<String, Object> detailInquiry(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		// 결과값 저장
		String result ="";
		
		logger.info("+ Start " + className + ".detailInquiry");
		logger.info("-paramMap + " + paramMap);
		
		EpcInquiryModel detailInquiry = inquiryService.detailInquiry(paramMap);
		
		if(detailInquiry != null){
			result = "SUCCESS";
		}
		else{
			result = "불러오기에 실패했습니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detailInquiry);
		resultMap.put("resultMsg", result);
		
		System.out.println("결과 글 찍어봅세 " + detailInquiry);
		System.out.println("결과 글 찍어봅세 " + result);
		
		logger.info("+ End " + className + ".detailInquiry");
		
		return resultMap;
	}
	
	@RequestMapping("inquirySave.do")
	@ResponseBody
	public Map<String, Object> saveInquiry(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception
	{
		logger.info("+ Start " + className + ".userSave");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action"); // 구분하는 키값 
		System.out.println("action 값 찍어보기 : " + action);
		
		String resultMsg = "";
		
		String loginID = (String) request.getParameter("rloginID"); // 아이디 
		paramMap.put("loginID", loginID); // request로 가져옴! getAttribute는 안되고 getParameter가 됨
		logger.info(loginID);
		
		
		
		// insert 인지, update 수정인지 확인하기 
				if("I".equals(action)) {
					inquiryService.insertInquiry(paramMap); // 저장 service
					resultMsg = "SUCCESS";
					
				}else if("U".equals(action)) {
					inquiryService.updateInquiry(paramMap); // 수정 service
					resultMsg = "UPDATE";
					
				}else if("D".equals(action)) {
					inquiryService.deleteInquiry(paramMap);
					resultMsg = "DELETE";
					
				}else {
					resultMsg ="FALSE / 등록에 실패했습니다.";
				}
				
				
				// 결과 값 전송
				Map<String, Object> resultMap = new HashMap<String, Object>();
				resultMap.put("resultMsg", resultMsg);
				
				logger.info("+ End " + className + ".savaList");
				
				return resultMap;
	}
	
	

}
