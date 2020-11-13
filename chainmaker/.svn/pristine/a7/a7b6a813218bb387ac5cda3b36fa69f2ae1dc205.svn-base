package kr.happyjob.chainmaker.epc.controller;

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

import kr.happyjob.chainmaker.epc.model.ProductListModel;
import kr.happyjob.chainmaker.epc.service.ProductListService;


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
		
		logger.info("+ Start " + className + ".initComnCod");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initComnCod");

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
				System.out.println(totalCount);
				model.addAttribute("pageSize", pageSize);
				model.addAttribute("currentPageProductList",currentPage);
				
		
				logger.info("+ End " + className + ".listProductList");
		

		return "/epc/listProductList";
	}	
	
	
}