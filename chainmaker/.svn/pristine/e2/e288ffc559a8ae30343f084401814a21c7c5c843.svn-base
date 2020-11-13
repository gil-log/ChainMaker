package kr.happyjob.chainmaker.system.controller;

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

import kr.happyjob.chainmaker.system.model.UserMgrModel;
import kr.happyjob.chainmaker.system.service.UserMgrService;

@Controller
@RequestMapping("/system/")
public class UserMgrController {
	
	@Autowired
	UserMgrService userMgrService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 사용자관리 초기화면(관리자가 해주는 회원관리)
	 */
	@RequestMapping("usrMgr.do")
	public String initUser(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initUser");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initUser");

		return "system/userMgr";
	}
	
	
	/**
	 * 사용자관리 목록 조회
	 */
	@RequestMapping("listUser.do")
	public String listUser(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listUser");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 사용자관리 목록 조회
		List<UserMgrModel> listUser = userMgrService.listUser(paramMap);
		model.addAttribute("listUser", listUser);
		
		 //사용자관리 카운트 조회
		int totalCount = userMgrService.countListUser(paramMap);
	    model.addAttribute("totalCnt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage",currentPage);
		
		logger.info("+ End " + className + ".listUser");

		return "/system/userList";
	}
	
	/* 회원 상세 정보 뿌리기 */
	@RequestMapping("detailUser.do")
	@ResponseBody
	public Map<String,Object> detailUser(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		  logger.info("+ Start " + className + ".detailUser");
		  logger.info("   - paramMap : " + paramMap);
		  
		String result="";
		
		// 선택된 회원 1건 조회 
		UserMgrModel detailUser = userMgrService.detailUser(paramMap);
		//List<CommentsVO> comments = null;
		
		if(detailUser != null) {
			
			result = "SUCCESS";  // 성공시 찍습니다. 
			
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detailUser); // 리턴 값 해쉬에 담기 
		//resultMap.put("resultComments", comments);
		resultMap.put("resultMsg", result); // success 용어 담기 
		
		System.out.println("결과 글 찍어봅세 " + result);
		System.out.println("결과 글 찍어봅세 " + detailUser);
		
		logger.info("+ End " + className + ".detailUser");
		
		return resultMap;
	}
	
	
	
	/* 회원 등록, 수정, 삭제 하기 */
	@RequestMapping("userSave.do")
	@ResponseBody
	public Map<String,Object> savaList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".savaList");
		 logger.info("   - paramMap : " + paramMap);
		//System.out.println("저장키를 먹나요~~~~?? : " + paramMap);
		
		String action = (String)paramMap.get("action"); // 구분하는 키값 
		System.out.println("action 값 찍어보기 : " + action);
		
		//String content = (String)paramMap.get("commentContent");
		//System.out.println("아아앙아아아아아아아악 댃글 컨텐트!! " + content);
		
		// 사용자 정보 설정하기 
		// paramMap.put("fst_rgst_sst_id", session.getAttribute("usrSstId"));
		
		String resultMsg = "";
		//String id = (String) session.getAttribute("loginId"); // 아이디 
		//paramMap.put("writer", id); // session을 통해 아이디 가져옴 

		
		// insert 인지, update 수정인지 확인하기 
		if("I".equals(action)) {
			userMgrService.insertUser(paramMap); // 저장 service
			resultMsg = "SUCCESS";
			
		}else if("U".equals(action)) {
			userMgrService.updateUser(paramMap); // 수정 service
			resultMsg = "UPDATE";
			
		}else if("D".equals(action)) {
			userMgrService.deleteUser(paramMap); // 수정 service
			resultMsg = "DELETE";
			
		}else {
			resultMsg ="FALSE / 등록에 실패했습니다.";
		}
		
		
		// 결과 값 전송
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".savaList");
		
		return resultMap;
	}

}
