package kr.happyjob.chainmaker.epc.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.happyjob.chainmaker.epc.model.RefundHistoryDTO;
import kr.happyjob.chainmaker.epc.service.RefundHistoryService;



@Controller
@RequestMapping(value="/epc/")
public class RefundHistoryController {
	@Resource(name="RefundHistoryServiceImpl")
	private RefundHistoryService refundHistoryServiceImpl;
	
	private final Logger logger = LogManager.getLogger(this.getClass());
	private final String className = this.getClass().toString();
	/*반품 목록 초기화면*/
	@RequestMapping("refundHistory.do")
	public String initRefundHistory(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".initRefundHistory");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initRefundHistory");
		
		String ViewLocation = "epc/refundHistory";
		
		return ViewLocation;
	}
	/*반품 목록 조회*/
	@RequestMapping("listRefundHistory.do")
	public String selectRefundHistory(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectRefundHistory");
		logger.info("   - paramMap : " + paramMap);
		String loginID = (String)session.getAttribute("loginId");
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
		int pageIndex = (currentPage-1) * pageSize;
		
		paramMap.put("loginID", loginID);
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		List<RefundHistoryDTO> selectRefundHistoryModel = refundHistoryServiceImpl.selectRefundHistory(paramMap);
		model.addAttribute("selectRefundHistoryModel", selectRefundHistoryModel);

		int totalRefundHistory = refundHistoryServiceImpl.countRefundHistory(paramMap);
		
		model.addAttribute("totalRefundHistory", totalRefundHistory);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageRefundHistory", currentPage);
		
		logger.info("+ End " + className + ".selectRefundHistory");
		
		return "epc/listRefundHistory";
	}
	
	/*반품 목록 단건 조회*/
	@RequestMapping("detailRefundHistory.do")

	public String detailRefundHistory(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		logger.info("+ Start " + className + ".detailRefundHistory");
		logger.info("   - paramMap : " + paramMap);
		
		

		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
		int pageIndex = (currentPage - 1) * pageSize;

		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		List<RefundHistoryDTO> detailRefundHistoryDTO = refundHistoryServiceImpl.detailRefundHistory(paramMap);
		model.addAttribute("detailRefundHistoryDTO", detailRefundHistoryDTO);

		int totalRefundHistoryDetail = refundHistoryServiceImpl.totalDetailRefundHistory(paramMap);

		model.addAttribute("totalRefundHistoryDetail", totalRefundHistoryDetail);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currenPageRefundHistoryDetail", currentPage);

		logger.info("+ End " + className + ".detailRefundHistory");
		
		return "epc/listDetailRefundHistory";
	}
			
}
