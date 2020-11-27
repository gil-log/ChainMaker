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

import kr.happyjob.chainmaker.scm.model.RefundVO;
import kr.happyjob.chainmaker.scm.model.UserInfoModel;
import kr.happyjob.chainmaker.scm.service.RefundInfoService;
import kr.happyjob.chainmaker.scm.service.UserInfoService;

@Controller
@RequestMapping("/scm/")
public class RefundInfoController {
	// 혜원담당 12페이지 반품 신청 목록

	@Autowired
	RefundInfoService refundInfoService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	/**
	 * 사용자관리 초기화면(관리자가 해주는 회원관리)
	 */

	// 0. 초기화면으로이동.
	@RequestMapping("/refundInfo.do")
	private String refundInfo() {

		logger.info("+ Start " + className + ".initRefundInfo");

		return "scm/refundInfo";
	}

	// 1. ajax 통신 (반품 신청 목록 리스트 뿌리기, 갯수세기 )
	@RequestMapping("refundList.do")
	public String selectRefundList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".refundTableList");
		logger.info("   - paramMap : " + paramMap);
		logger.info("+ End " + className + ".refundTableList");

		List<RefundVO> refundList = refundInfoService.selectRefundList(paramMap);
		model.addAttribute("refundList", refundList);
		model.addAttribute("paramMap", paramMap);

		// 상풍 목록 몇개인지 조회
		int totalCnt = refundInfoService.refundListCnt(paramMap);
		model.addAttribute("totalCnt", totalCnt);

		return "/scm/refundList";
	}
	
	//2. 검색하면 나오는것, 갯수세기
	@RequestMapping("selectedRefundList.do")
	public String selectedRefundList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		List<RefundVO> selectedRefundList = refundInfoService.selectedRefundList(paramMap);
		model.addAttribute("selectedRefundList", selectedRefundList);
		model.addAttribute("paramMap", paramMap);

		// 상풍 목록 몇개인지 조회
		int totalCnt = refundInfoService.selectedRefundCnt(paramMap);
		model.addAttribute("totalCnt", totalCnt);

		return "/scm/refundList";
	}
	

	// 이거 나중에 삭제할 것!!

	/**
	 * 사용자관리 목록 조회
	 */
	/*
	 * @RequestMapping("UserInfoList.do") public String listUser(Model
	 * model, @RequestParam Map<String, Object> paramMap, HttpServletRequest
	 * request, HttpServletResponse response, HttpSession session) throws
	 * Exception {
	 * 
	 * logger.info("+ Start " + className + ".listUser"); logger.info(
	 * "   - paramMap : " + paramMap);
	 * 
	 * 
	 * int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
	 * // 현재 페이지 번호 int pageSize =
	 * Integer.parseInt((String)paramMap.get("pageSize")); // 페이지 사이즈 int
	 * pageIndex = (currentPage-1)*pageSize; // 페이지 시작 row 번호
	 * 
	 * paramMap.put("pageIndex", pageIndex); paramMap.put("pageSize", pageSize);
	 * 
	 * // 사용자관리 목록 조회 List<UserInfoModel> listUser =
	 * userInfoService.listUser(paramMap); model.addAttribute("listUser",
	 * listUser);
	 * 
	 * //사용자관리 카운트 조회 int totalCount = userInfoService.countListUser(paramMap);
	 * model.addAttribute("totalCnt", totalCount);
	 * 
	 * model.addAttribute("pageSize", pageSize);
	 * model.addAttribute("currentPage",currentPage);
	 * 
	 * logger.info("+ End " + className + ".listUser");
	 * 
	 * 
	 * return "/scm/UserInfoList"; }
	 * 
	 * 회원 상세 정보 뿌리기
	 * 
	 * @RequestMapping("detailUser.do")
	 * 
	 * @ResponseBody public Map<String,Object> detailUser(Model
	 * model, @RequestParam Map<String,Object> paramMap, HttpServletRequest
	 * request, HttpServletResponse response, HttpSession session) throws
	 * Exception {
	 * 
	 * //System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
	 * logger.info("+ Start " + className + ".detailUser"); logger.info(
	 * "   - paramMap : " + paramMap);
	 * 
	 * String result="";
	 * 
	 * // 선택된 회원 1건 조회 UserInfoModel detailUser =
	 * userInfoService.detailUser(paramMap); //List<CommentsVO> comments = null;
	 * 
	 * if(detailUser != null) {
	 * 
	 * result = "SUCCESS"; // 성공시 찍습니다.
	 * 
	 * }else { result = "FAIL / 불러오기에 실패했습니다."; // null이면 실패입니다. }
	 * 
	 * Map<String, Object> resultMap = new HashMap<String, Object>();
	 * resultMap.put("result", detailUser); // 리턴 값 해쉬에 담기
	 * //resultMap.put("resultComments", comments); resultMap.put("resultMsg",
	 * result); // success 용어 담기
	 * 
	 * System.out.println("결과 글 찍어봅세 " + result); System.out.println(
	 * "결과 글 찍어봅세 " + detailUser);
	 * 
	 * logger.info("+ End " + className + ".detailUser");
	 * 
	 * return resultMap; }
	 * 
	 * @RequestMapping("userSave.do")
	 * 
	 * @ResponseBody public Map<String, Object> saveUserInfo(Model
	 * model, @RequestParam Map<String, Object> paramMap, HttpServletRequest
	 * request, HttpServletResponse response, HttpSession session) throws
	 * Exception { logger.info("+ Start " + className + ".saveComnGrpCod");
	 * logger.info( "   - paramMap : " + paramMap);
	 * 
	 * String action = (String)paramMap.get("action"); // 구분하는 키값
	 * System.out.println("action 값 찍어보기 : " + action);
	 * 
	 * String resultMsg = "";
	 * 
	 * String loginID = (String) request.getParameter("rloginID"); // 아이디
	 * paramMap.put("loginID", loginID); // request로 가져옴! getAttribute는 안되고
	 * getParameter가 됨 logger.info(loginID);
	 * 
	 * 
	 * 
	 * // insert 인지, update 수정인지 확인하기 if("I".equals(action)) {
	 * userInfoService.insertUser(paramMap); // 저장 service resultMsg =
	 * "SUCCESS";
	 * 
	 * }else if("U".equals(action)) { userInfoService.updateUser(paramMap); //
	 * 수정 service resultMsg = "UPDATE";
	 * 
	 * }else if("D".equals(action)) { userInfoService.deleteUser(paramMap); //
	 * 수정 service resultMsg = "DELETE";
	 * 
	 * }else { resultMsg ="FALSE / 등록에 실패했습니다."; }
	 * 
	 * 
	 * // 결과 값 전송 Map<String, Object> resultMap = new HashMap<String, Object>();
	 * resultMap.put("resultMsg", resultMsg);
	 * 
	 * logger.info("+ End " + className + ".savaList");
	 * 
	 * return resultMap; }
	 * 
	 * }
	 */
}