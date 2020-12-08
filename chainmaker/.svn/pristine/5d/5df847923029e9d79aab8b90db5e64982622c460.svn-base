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

import kr.happyjob.chainmaker.epc.model.ProductListModel;
import kr.happyjob.chainmaker.epc.service.ProductListService;
import kr.happyjob.chainmaker.scm.model.UserInfoModel;


@Controller
@RequestMapping("/epc/")
public class ProductListController {
	
	@Autowired
	ProductListService productListService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 공통코드 관리 초기화면
	 */
	@RequestMapping("productList.do")
	public String initProductList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initProductList");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initProductList");

		return "epc/productList";
	}
	
	@RequestMapping("listProductList.do")
	public String listProductList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listProduct");
		logger.info("   - paramMap : " + paramMap);

		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 그룹코드 목록 조회
		List<ProductListModel> listProductListModel = productListService.listProductList(paramMap);
		model.addAttribute("listProductListModel", listProductListModel);
		
		// 공통 그룹코드 목록 카운트 조회
				int totalCount = productListService.countListProductList(paramMap);
				model.addAttribute("totalCntProductList", totalCount);
				
				model.addAttribute("pageSize", pageSize);
				model.addAttribute("currentPageProductList",currentPage);
				
		
				logger.info("+ End " + className + ".listProductList");
		

		return "/epc/listProductList";
	}	
	
	
	//  제품 단일 정보 ajax 통신
		@RequestMapping("detailProduct.do")
		@ResponseBody
		public Map<String,Object> detailProduct(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
			  logger.info("+ Start " + className + ".detailProduct");
			  logger.info("   - paramMap : " + paramMap);
			  
			String resultMsg="";
			
			// 선택된 회원 1건 조회 
			ProductListModel detail = productListService.selectProductDetail(paramMap);
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
			/*
			int exbasket = productListService.existBasket(paramMap);
			
			model.addAttribute("existBasket",exbasket);*/
			
			//System.out.println("결과 글 찍어봅세 " + resultMsg);
			//System.out.println("결과 글 찍어봅세 " + detail);
			
			logger.info("+ End " + className + ".detailProduct");
			
			return resultMap;
		}	
		
		/**
		 *  주문 기능
		 */
		@RequestMapping("inOrder.do")
		@ResponseBody
		public Map<String, Object> inOrder(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".inOrder");
			logger.info("   - paramMap : " + paramMap);
			
			
			String result = "SUCCESS";
			String resultMsg = "주문 되었습니다.";
			
			
			// 사용자 정보 설정
			paramMap.put("login_id", session.getAttribute("loginId"));
				productListService.insertOrder(paramMap);
		
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
			
			logger.info("+ End " + className + ".inOrder");
			
			return resultMap;
		}
		
		/**
		 *  장바구니 기능
		 */
		@RequestMapping("inBasket.do")
		@ResponseBody
		public Map<String, Object> inBasket(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".inBasket");
			
			
			
			String result = "SUCCESS";
			String resultMsg = "장바구니에 넣었습니다.";
			
			
			// 사용자 정보 설정
			paramMap.put("login_id", session.getAttribute("loginId"));
				productListService.insertBasket(paramMap);
			
			
			
			
			logger.info("   - paramMap : " + paramMap);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
			
			logger.info("+ End " + className + ".inBasket");
			
			return resultMap;
		}	
		
		/**
		 *  장바구니 중복체크 기능
		 */
		@RequestMapping("exBasket.do")
		@ResponseBody
		public Map<String, Object> exBasket(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".exBasket");
			
		
			
			
			
			
			logger.info("   - paramMap : " + paramMap);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			// 사용자 정보 설정
						paramMap.put("login_id", session.getAttribute("loginId"));
							
						
			int existBasket = productListService.existBasket(paramMap);
			model.addAttribute("exBasket",existBasket);
			paramMap.put("exBasket",existBasket);
			resultMap.put("exBasket",existBasket);
			logger.info("+ End " + className + ".exBasket");
			
			return resultMap;
		}	
		
		 /* 은행 모달 뿌리기 */
		@RequestMapping("Bank.do")
		@ResponseBody
		public Map<String,Object> adminBank(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
			  logger.info("+ Start " + className + ".adminBank");
			  logger.info("   - paramMap : " + paramMap);
			  
			String result="";
			
			// 선택된 회원 1건 조회 
			ProductListModel adminBank = productListService.adminBank(paramMap);
			//List<CommentsVO> comments = null;
		
			if(adminBank != null) {
				
				result = "SUCCESS";  // 성공시 찍습니다. 
				
			}else {
				result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
			}
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", adminBank); // 리턴 값 해쉬에 담기 
			//resultMap.put("resultComments", comments);
			resultMap.put("resultMsg", result); // success 용어 담기 
			
			System.out.println("결과 글 찍어봅세 " + result);
			System.out.println("결과 글 찍어봅세 " + adminBank);
			
			logger.info("+ End " + className + ".adminBank");
			
			return resultMap;
		}
		
		/**
		 * 동적 셀렉트 조회
		 */
		
		@RequestMapping("selectProduct.do")
		@ResponseBody
		public Map<String, Object> selectProduct(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session)  throws Exception{
		
			logger.info("+ Start " + className + ".selectProduct" );
			
			List<ProductListModel> cList =  productListService.selectProduct(paramMap);
			model.addAttribute("cListobj", cList);
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			
			resultMap.put("cListobj", cList);
			
			
			
			logger.info("+ End " + className + ".selectProduct");
			
			return resultMap;
		}
		
		/**
		 * 동적 셀렉트 상품목록
		 */
		
		@RequestMapping("selectDetail.do")
		@ResponseBody
		public Map<String, Object> selectDetail(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session)  throws Exception{
		
			logger.info("+ Start " + className + ".selectDetail" );
			
			List<ProductListModel> dList =  productListService.selectDetail(paramMap);
			model.addAttribute("dListobj", dList);
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			
			resultMap.put("dListobj", dList);
			
			
			
			logger.info("+ End " + className + ".selectDetail");
			
			return resultMap;
		}
		
		
}