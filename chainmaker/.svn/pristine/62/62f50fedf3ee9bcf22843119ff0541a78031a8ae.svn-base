package kr.happyjob.chainmaker.scm.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.scm.dao.SupplierInfoDao;
import kr.happyjob.chainmaker.scm.model.SupplierInfoModel;
import kr.happyjob.chainmaker.scm.service.SupplierInfoService;
import kr.happyjob.chainmaker.system.model.ComnGrpCodModel;




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
	// 납품 업체 저장
	@RequestMapping("saveDelivery.do")
	@ResponseBody
	public Map<String, Object> saveDelivery (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		logger.info("+ Start " + className + ".saveDelivery");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		
		String result = "SUCCESS";
		String resultMsg = "";
		
		if("I".equals(action)){
			//납품 업체 등록
			supplierInfoService.insertDelivery(paramMap);
			resultMsg = "등록 완료";
		} else if("U".equals(action)){
			//납품 업체 수정
			supplierInfoService.updateDelivery(paramMap);
			resultMsg = "수정 완료";
		} /*else if("D".equals(action)){
			//납품 업체 삭제
			supplierInfoService.deleteDelivery(paramMap);
			resultMsg = "삭제 완료";
		} else if("R".equals(action)){
			//납품 업체 복구
			supplierInfoService.recoveryDelivery(paramMap);
			resultMsg = "복원 완료";
		}*/
		else{
			result = "FALSE";
			resultMsg = "저장 실패";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveDelivery");
		
		return resultMap;
	}
	//납품 업체 단건 조회
	@RequestMapping("selectDelivery.do")
	@ResponseBody
	public Map<String, Object> selectDelivery (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		logger.info("+ Start " + className + ".selectDelivery");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		SupplierInfoModel supplierInfoModel = supplierInfoService.selectDelivery(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("supplierInfoModel", supplierInfoModel);
		
		logger.info("+ End " + className + ".selectDelivery");
		
		System.out.println(resultMap);
		return resultMap;
	}
}

