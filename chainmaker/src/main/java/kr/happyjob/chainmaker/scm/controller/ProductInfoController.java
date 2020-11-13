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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.chainmaker.scm.model.DetailCdVO;
import kr.happyjob.chainmaker.scm.model.ProductInfoModel;
import kr.happyjob.chainmaker.scm.service.ProductInfoService;

@Controller
@RequestMapping("scm")
public class ProductInfoController {
	
	@Autowired
	ProductInfoService service;
	
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
		
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	// 1. 제품정보 관리 초기페이지
	
	@RequestMapping("productInfo")
	private String productInfo() {
		
		logger.info("+ Start " + className + ".initProductInfo");
		
		return "scm/productInfo";
	}
	
	// 2. 제품정보 목록 ajax 통신
	@RequestMapping("productList.do")
	private String productList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		logger.info("   - paramMap : " + paramMap);
		
		// 상품 목록 조회
		List<ProductInfoModel> list = service.selectProductInfo(paramMap);
		model.addAttribute("listModel", list);
		
		// 상풍 목록 카운트 조회
		int totalCount = service.countProductInfo();
		model.addAttribute("totalCnt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);
		
		//상세코드 조회
		List<DetailCdVO> cdList = service.selectDetailCode();
		session.setAttribute("cdListObj", cdList); // 세션으로 넣는 이유... 옵션값 뽑기 위해..
		
		
		return "scm/productList";
		
	}
	
	// 3. 제품 단일 정보 ajax 통신
	@RequestMapping("detailProduct.do")
	@ResponseBody
	public Map<String,Object> detailProduct(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		  logger.info("+ Start " + className + ".detailProduct");
		  logger.info("   - paramMap : " + paramMap);
		  
		String resultMsg="";
		
		// 선택된 회원 1건 조회 
		ProductInfoModel detail = service.selectProductDetail(paramMap);
		//List<CommentsVO> comments = null;
		
		if(detail != null) {
			
			resultMsg = "SUCCESS";  // 성공시 찍습니다. 
			
		}else {
			resultMsg = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detail); // 리턴 값 해쉬에 담기 
		//resultMap.put("resultComments", comments);
		resultMap.put("resultMsg", resultMsg); // success 용어 담기 
		
		System.out.println("결과 글 찍어봅세 " + resultMsg);
		System.out.println("결과 글 찍어봅세 " + detail);
		
		logger.info("+ End " + className + ".detailProduct");
		
		return resultMap;
	}	

	// 4. 제품 정보 및 파일 등록
	@ResponseBody
	@RequestMapping("productSave.do")
	public Map<String,Object> productSave(Model model, @RequestParam Map<String,Object> paramMap, MultipartHttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		  logger.info("+ Start " + className + ".productSave");
		  logger.info("   - paramMap : " + paramMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String resultMsg = "";
		
		boolean flag = service.insertProduct(paramMap, request);
		
		if(flag) {
			resultMsg = "SUCCESS";
		}else {
			resultMsg = "FAIL / 불러오기에 실패했습니다.";
		}
		
		System.out.println("결과 글 찍어봅세 " + resultMsg);
		resultMap.put("resultMsg", resultMsg); // success 용어 담기
		
		logger.info("+ End " + className + ".productSave");
		return resultMap;
	}
	
	// 5. 제품 정보 및 파일 삭제
	@ResponseBody
	@RequestMapping("productDel.do")
	public Map<String,Object> productDel(Model model, @RequestParam Map<String,Object> paramMap,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".productDel");
		logger.info("   - paramMap : " + paramMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String resultMsg = "";
		
		boolean flag = service.deleteProduct(paramMap);
		
		if(flag) {
			resultMsg = "SUCCESS";
		}else {
			resultMsg = "FAIL / 불러오기에 실패했습니다.";
		}
		
		System.out.println("결과 글 찍어봅세 " + resultMsg);
		resultMap.put("resultMsg", resultMsg); // success 용어 담기
		
		logger.info("+ End " + className + ".productDel");
		
		return resultMap;
		
	}

}
