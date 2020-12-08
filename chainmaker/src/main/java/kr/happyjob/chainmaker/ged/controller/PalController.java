package kr.happyjob.chainmaker.ged.controller;
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

import kr.happyjob.chainmaker.ged.model.PalVO;
import kr.happyjob.chainmaker.ged.service.PalService;


@Controller
@RequestMapping("/ged/")
public class PalController {

	@Autowired
	PalService palService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	// 발주 지시서 초기화면
	@RequestMapping("profitAndLoss.do")
	private String profitAndLoss(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".purchaseDir");
		logger.info("   - paramMap : " + paramMap);
		logger.info("+ End " + className + ".courseMng");
		
		return "ged/pal";
	}
	
	
	/* 공지사항 리스트 뿌리기 */
	@RequestMapping("profitAndLossList.do")
	public String profitAndLossList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		    logger.info("+ Start " + className + ".refundInsList");
		    logger.info("   - paramMap : " + paramMap);
			//System.out.println("param에서 넘어온 값을 찍어봅시다.: " + paramMap);
			
			// jsp페이지에서 넘어온 파람 값 정리 (페이징 처리를 위해 필요)
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage")); // 현재페이지 
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
			int pageIndex = (currentPage -1)*pageSize;
			
			// 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
		
			// 서비스 호출
			List<PalVO> palList = palService.palList(paramMap);
			model.addAttribute("palList", palList);
			
			// 목록 숫자 추출하여 보내기 
			int totalCnt = palService.palTotalCnt(paramMap);
			model.addAttribute("totalCnt", totalCnt);
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPage",currentPage);
			
			//System.out.println("자 컨트롤러에서 값을 가지고 jsp로 갑니다~ : " + freeboardlist.size());
			logger.info("+ End " + className + ".refundInsList");
			
		return "ged/palList";	
	}
	
	@RequestMapping("profitAndLossDList.do")
	public String profitAndLossDList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		    logger.info("+ Start " + className + ".refundInsList");
		    logger.info("   - paramMap : " + paramMap);
			//System.out.println("param에서 넘어온 값을 찍어봅시다.: " + paramMap);
			
			// jsp페이지에서 넘어온 파람 값 정리 (페이징 처리를 위해 필요)
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage")); // 현재페이지 
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
			int pageIndex = (currentPage -1)*pageSize;
			
			// 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
		
			// 서비스 호출
			List<PalVO> palDList = palService.palDList(paramMap);
			model.addAttribute("palDList", palDList);
			
			// 목록 숫자 추출하여 보내기 
			int totalCnt = palService.palDTotalCnt(paramMap);
			model.addAttribute("totalCnt", totalCnt);
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPage",currentPage);
			
			//System.out.println("자 컨트롤러에서 값을 가지고 jsp로 갑니다~ : " + freeboardlist.size());
			logger.info("+ End " + className + ".refundInsList");
			
		return "ged/palDList";	
	}
}
