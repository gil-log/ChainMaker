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
			   
			// 공통 그룹코드 목록 조회
			List<InquiryModel> listInquiry = inquiryService.listInquiry(paramMap);
			model.addAttribute("listInquiry", listInquiry);
			
			// 공통 그룹코드 목록 카운트 조회
			int totalCount = inquiryService.countListInquiry(paramMap);
			model.addAttribute("totalCntlistInquiry", totalCount);
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPageInquiry",currentPage);
			
			logger.info("+ End " + className + ".listinquiry");
			 

			return "/sti/inquiryList";
		}	

}
