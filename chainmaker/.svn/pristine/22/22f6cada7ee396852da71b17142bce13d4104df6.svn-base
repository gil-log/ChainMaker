package kr.happyjob.chainmaker.dashboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.dashboard.InfService.InfService;
import kr.happyjob.chainmaker.dashboard.model.InfModel;
import kr.happyjob.chainmaker.scm.model.FileModel;
import kr.happyjob.chainmaker.scm.service.NoticeService;



@Controller
@RequestMapping("/inf/")
public class InfController {

	@Autowired
	InfService infService;
	
	@Autowired
	NoticeService noticeService;
	
	/**
	 * 1:1 문의 목록
	 */
	@RequestMapping("listinf.do")
	public String listinf(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
	
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		   
		// 공통 1:1문의 목록 조회
		List<InfModel> listInf = infService.listInf(paramMap);
		model.addAttribute("listInf", listInf);
		
		// 공통 1:1문의 목록 카운트 조회
		int totalCount = infService.countListInf(paramMap);
		model.addAttribute("totalCntlistInf", totalCount);
		
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage",currentPage);
		
	
		return "/dashboard/infList";
	}	
	
	//1:1 단일 조회
			@RequestMapping("infByInfNo.do")
			@ResponseBody
			public Map<String, Object> infContent(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
					HttpServletResponse response, HttpSession session) throws Exception {
			
				FileModel selectFile = infService.selectFile(paramMap);
				Map<String, Object> resultMap = new HashMap<>();
				String notice_no=(String)request.getParameter("notice_no");
				int inf_num = Integer.parseInt(notice_no);

				InfModel InfModel = infService.selectInfByInfNo(inf_num);
				resultMap.put("infNoData", InfModel);
				resultMap.put("result2", selectFile);
				return resultMap;
			}
}