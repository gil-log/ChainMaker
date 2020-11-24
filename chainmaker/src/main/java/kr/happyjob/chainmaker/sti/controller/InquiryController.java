package kr.happyjob.chainmaker.sti.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.happyjob.chainmaker.sti.service.InquiryService;
import kr.happyjob.chainmaker.common.comnUtils.ComnCodUtil;
import kr.happyjob.chainmaker.common.comnUtils.MediaUtils;
import kr.happyjob.chainmaker.sti.model.InquiryByInqNoModel;
import kr.happyjob.chainmaker.sti.model.InquiryModel;

@Controller
@RequestMapping("/sti/")
public class InquiryController {
	
	@Autowired
	InquiryService inquiryService;


	// Root path for file upload 
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	/**
	 * 게시글 초기화면
	 */
	@RequestMapping("inquiry.do")
	public String inquiry(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initCmntBbs");


		return "sti/inquiry";
	}
	

	
		/**
		 * 1:1 문의 목록
		 */
		@RequestMapping("listinquiry.do")
		public String listinquiry(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".listinquiry");
			logger.info("   - paramMap : " + paramMap);			
			
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
			int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
					
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
			
			   
			// 공통 1:1문의 목록 조회
			List<InquiryModel> listInquiry = inquiryService.listInquiry(paramMap);
			model.addAttribute("listInquiry", listInquiry);
			
			// 공통 1:1문의 목록 카운트 조회
			int totalCount = inquiryService.countListInquiry(paramMap);
			model.addAttribute("totalCntlistInquiry", totalCount);
			
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPageInquiry",currentPage);
			
			logger.info("+ End " + className + ".listinquiry");
			 

			return "/sti/inquiryList";
		}	
//1:1 단일 조회
		@RequestMapping("inquiryByInqNo.do")
		@ResponseBody
		public Map<String, Object> inquiryContent(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".inquiryByInqNo");
			logger.info("   - paramMap : " + paramMap);
			
			
		
			Map<String, Object> resultMap = new HashMap<>();
			String inq_no=(String)request.getParameter("inq_no");
			int inq_num = Integer.parseInt(inq_no);

			InquiryByInqNoModel inquiryByInqNoModel = inquiryService.selectInquiryByInqNo(inq_num);
			resultMap.put("inqNoData", inquiryByInqNoModel);
			return resultMap;
		}
		
		@RequestMapping("inquiryInAns.do")
		@ResponseBody
		public Map<String, Object> inquiryAns (@RequestParam Map<String, Object> paramMap) throws Exception{
			
			int insertInquiryAns = inquiryService.insertInquiryAns(paramMap);
			
			Map<String, Object> map = new HashMap<>();
			
			if(insertInquiryAns==1){
				paramMap.put("answer_cd","1");
				int answerONX = inquiryService.answerONX(paramMap);
				
				map.put("result", "SUCCESS");
				map.put("resultMsg", "답장완료");
				
			} else{
				
				map.put("result","Fail");
				map.put("resultMsg", "작성 실패");
			}
			
			System.out.println(insertInquiryAns);
			
			return map;
		}
		@RequestMapping("deleteInqAns.do")
		@ResponseBody
		public Map<String, Object> inquiryAnsDel (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
		
				
				
				logger.info("+ Start " + className + ".inquiryAnsDel");
				logger.info("   - paramMap : " + paramMap);
				
				String result = "SUCCESS";
				String resultMsg = "삭제 되었습니다.";

				int inqAnsDel = inquiryService.inqAnsDel(paramMap);
				
				
				
				paramMap.put("answer_cd", "0");
				
				inquiryService.answerONX(paramMap);
				
				
				
				
				Map<String, Object> resultMap = new HashMap<String, Object>();
				resultMap.put("result", result);
				resultMap.put("resultMsg", resultMsg);
				
				logger.info("+ End " + className + ".inquiryAnsDel");
				
				return resultMap;
			
			
		}
		
}
