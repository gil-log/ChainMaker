package kr.happyjob.chainmaker.scm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.happyjob.chainmaker.scm.model.SupplierInfoModel;
import kr.happyjob.chainmaker.scm.service.SupplierInfoService;




@Controller
@RequestMapping("/scm")
public class SupplierInfoController {
	@Autowired //묶어준다
	SupplierInfoService supplierInfoService;
	
	private static final Logger logger = LoggerFactory.getLogger(SupplierInfoController.class);
	private final String className = this.getClass().toString();
	
	@RequestMapping("supplierInfo.do")
	public String initSupplierInfo(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession Session) throws Exception{
		
		logger.info("+ Start " + className + ".initSupplierInfo");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initSupplierInfo");
		
		return "scm/supplierInfo";
		
	}

	//납품업체 조회
	@RequestMapping("listDelivery.do")
	public String listDelivery(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".listDelivery");
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage -1)*pageSize;									// 페이지 시작 row 번호
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 납품업체 목록 조회
		List<SupplierInfoModel> listDeliveryModel = supplierInfoService.listDelivery(paramMap);
		model.addAttribute("listDeliveryModel", listDeliveryModel);
		
		// 납품업체 목록 카운트 조회
		int totalCount = supplierInfoService.totalCntDelivery(paramMap);
		model.addAttribute("totalDelivery", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageDelivery",currentPage);
		
		
		logger.info("+ End " + className + ".listDelivery");
		
		
		return "scm/listDelivery";
	}
	
	
	//상품목록 조회
	@RequestMapping("listProduct.do")
	public String listProduct(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".listProduct");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;									// 페이지 시작 row 번호
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 제품 목록 조회
		List<SupplierInfoModel> listProductModel = supplierInfoService.listProduct(paramMap);
		model.addAttribute("listProductModel", listProductModel);
		
		// 제품 목록 카운트 조회
		int totalCount = supplierInfoService.totalCntProduct(paramMap);
		model.addAttribute("totalProduct", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageProduct",currentPage);
		
		logger.info("+ End " + className + ".listProduct");
		
		
		return "scm/listProduct";
	}
	
}

