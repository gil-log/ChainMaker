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

import kr.happyjob.chainmaker.epc.dao.MyPageDAO;
import kr.happyjob.chainmaker.epc.model.MyPageDTO;
import kr.happyjob.chainmaker.epc.service.MyPageService;


@Controller
@RequestMapping("/epc/")
public class MypageController {
	
	@Autowired
	MyPageService myPageService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 공통코드 관리 초기화면
	 */
	@RequestMapping("mypage")
	public String initMypage(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initMypage");
		
		
		// 사용자 정보 설정
		paramMap.put("loginID", session.getAttribute("loginId"));
		
		logger.info("   - paramMap : " + paramMap);
		logger.info("+ End " + className + ".initMypage");

		return "epc/mypageCostom";
	}
	
	
	/* 회원 상세 정보 뿌리기 */
	@RequestMapping("detailUser.do")
	@ResponseBody
	public Map<String,Object> detailUser(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		  logger.info("+ Start " + className + ".detailUser");
		  
		  paramMap.put("loginID", session.getAttribute("loginId"));
		
		 // System.out.println("결과 글 찍어봅세 1");
		  System.out.println("결과 글 찍어봅세 2" + paramMap);
		  
		  logger.info("   - paramMap : " + paramMap);
		  
		String result="";
		
		// 선택된 회원 1건 조회 
		MyPageDTO detailUser =  myPageService.detailUser(paramMap);
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
	
	@RequestMapping("userSave.do")
	@ResponseBody
	public Map<String, Object> saveUserInfo(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception
	{
		logger.info("+ Start " + className + ".userSave");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action"); // 구분하는 키값 
		System.out.println("action 값 찍어보기 : " + action);
		
		logger.info("   - paramMap : " + paramMap);
		String resultMsg = "";
		
		String loginID = (String) request.getParameter("rloginID"); // 아이디 
		paramMap.put("loginID", loginID); // request로 가져옴! getAttribute는 안되고 getParameter가 됨
		logger.info(loginID);
		
		
		
		// insert 인지, update 수정인지 확인하기 
				if("U".equals(action)) {
					myPageService.upUser(paramMap); // 수정 service
					resultMsg = "UPDATE";
					
				}else if("D".equals(action)) {
					myPageService.delUser(paramMap); // DEL코드 service
					resultMsg = "DELETE";
				
				}else {
					resultMsg ="FALSE / 등록에 실패했습니다.";
				}
				
				
				// 결과 값 전송
				Map<String, Object> resultMap = new HashMap<String, Object>();
				resultMap.put("resultMsg", resultMsg);
				
				logger.info("+ End " + className + ".userSave");
				
				return resultMap;
	}
	
}
