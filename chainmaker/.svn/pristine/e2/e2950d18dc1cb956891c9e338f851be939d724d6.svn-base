package kr.happyjob.chainmaker.dashboard.controller;

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

import kr.happyjob.chainmaker.supportD.model.NoticeDModel;
import kr.happyjob.chainmaker.supportD.service.NoticeDService;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

	@Autowired
	NoticeDService noticeDService;

	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	@RequestMapping("/dashboard.do")
	public String initDashboard(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		
		
		logger.info("+ Start " + className + ".initDashboard");
		/* ############## set input data################# */
		paramMap.put("loginId", session.getAttribute("loginId")); // 제목
		paramMap.put("userType", session.getAttribute("userType")); // 오피스 구분 //
																	// 코드
		paramMap.put("reg_date", session.getAttribute("reg_date")); // 등록 일자
		logger.info("   - paramMap : " + paramMap);

		String returnType = "/dashboard/dashboardMgr";

		logger.info("+ end " + className + ".initDashboard");

		return returnType;
	}

	/* 공지사항 리스트 뿌리기 */
	@RequestMapping("noticeList.do")
	public String noticeList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("공지사항 리스트 호출");
		logger.info("+ Start " + className + ".noticeList");
		logger.info("   - paramMap : " + paramMap);
		// System.out.println("param에서 넘어온 값을 찍어봅시다.: " + paramMap);

		// jsp페이지에서 넘어온 파람 값 정리 (페이징 처리를 위해 필요)
		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재페이지
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex = (currentPage - 1) * pageSize;

		// 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		paramMap.put("loginId", session.getAttribute("loginId"));
		System.out.println("잘 찎히니 ? : " + session.getAttribute("loginId"));

		// 서비스 호출
		List<NoticeDModel> noticeList = noticeDService.noticeList(paramMap);
		model.addAttribute("noticeList", noticeList);
		System.out.println("노티스 톡톡 : " + noticeList);

		// 목록 숫자 추출하여 보내기
		int totalCnt = noticeDService.noticeTotalCnt(paramMap);
		model.addAttribute("totalCnt", totalCnt);

		// System.out.println("자 컨트롤러에서 값을 가지고 jsp로 갑니다~ : " +
		// freeboardlist.size());
		logger.info("+ End " + className + ".noticeList");

		return "supportD/noticeListD";
	}

	/* 공지사항 상세 정보 뿌리기 */
	@RequestMapping("detailNoticeList.do")
	@ResponseBody
	public Map<String, Object> detailList(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		// System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		logger.info("+ Start " + className + ".detailList");
		logger.info("   - paramMap : " + paramMap);
		String result = "";

		// 선택된 게시판 1건 조회
		NoticeDModel detailNotice = noticeDService.detailNotice(paramMap);
		// List<CommentsVO> comments = null;

		if (detailNotice != null) {

			/*
			 * comments = qnaService.selectComments(paramMap); // 댓글 가지고오기
			 * if(comments != null) { System.out.println("댓글도 소환완료!"); }
			 */
			result = "SUCCESS"; // 성공시 찍습니다.

		} else {
			result = "FAIL / 불러오기에 실패했습니다."; // null이면 실패입니다.
		}

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detailNotice); // 리턴 값 해쉬에 담기
		// resultMap.put("resultComments", comments);
		resultMap.put("resultMsg", result); // success 용어 담기

		System.out.println("결과 글 찍어봅세1 " + result);
		System.out.println("결과 글 찍어봅세 2" + detailNotice);

		logger.info("+ End " + className + ".detailList");

		return resultMap;
	}

}