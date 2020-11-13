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

import kr.happyjob.chainmaker.scm.model.ProductInfo;
import kr.happyjob.chainmaker.scm.service.ProductInfoService;
import kr.happyjob.chainmaker.system.model.UserMgrModel;

@Controller
@RequestMapping("scm")
public class ProductInfoController {
	
	@Autowired
	ProductInfoService service;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
		
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	@RequestMapping("summernotetest")
	private String productInfo() {
		
		logger.info("+ Start " + className + ".initProductInfo");
		
		return "scm/summernote";
	}
	
	
	// 1. 제품정보 관리 초기페이지
	
	@RequestMapping("productInfo")
	private String productInfo2() {
		
		logger.info("+ Start " + className + ".initProductInfo2");
		
		return "scm/protest";
	}
	
	// 2. 제품정보 목록 ajax 통신

	@RequestMapping("productList.do")
	private String productList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		
		paramMap.put("ofcId", session.getAttribute("ofcId"));          // 오피스 ID
		paramMap.put("ofcDvsCod", session.getAttribute("ofcDvsCod"));  // 오피스 구분 코드
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		logger.info("   - paramMap : " + paramMap);
		
		// 게시글 목록 조회 0depth
		List<ProductInfo> list = service.selectProductInfo();
		
		model.addAttribute("listModel", list);
		
		// 게시글 목록 카운트 조회
		int totalCount = service.countProductInfo();
		model.addAttribute("totalCnt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);
		
		return "scm/productList";
		
	}
	
	/* 회원 상세 정보 뿌리기 */
	@RequestMapping("detailProduct.do")
	@ResponseBody
	public Map<String,Object> detailProduct(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		  logger.info("+ Start " + className + ".detailProduct");
		  logger.info("   - paramMap : " + paramMap);
		  
		String result="";
		
		// 선택된 회원 1건 조회 
		ProductInfo detail = service.selectProductDetail(paramMap);
		//List<CommentsVO> comments = null;
		
		if(detail != null) {
			
			result = "SUCCESS";  // 성공시 찍습니다. 
			
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detail); // 리턴 값 해쉬에 담기 
		//resultMap.put("resultComments", comments);
		resultMap.put("resultMsg", result); // success 용어 담기 
		
		System.out.println("결과 글 찍어봅세 " + result);
		System.out.println("결과 글 찍어봅세 " + detail);
		
		logger.info("+ End " + className + ".detailProduct");
		
		return resultMap;
	}	
	
	
	
	

}
