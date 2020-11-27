package kr.happyjob.chainmaker.scm.controller;
import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import kr.happyjob.chainmaker.cmnt.model.CmntBbsAtmtFilModel;
import kr.happyjob.chainmaker.scm.model.FileModel;
import kr.happyjob.chainmaker.scm.model.NoticeModel;
import kr.happyjob.chainmaker.scm.service.NoticeService;


@Controller
@RequestMapping("/scm/")
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	private final static String rootPath = "c://notice/";
	
	/* 자유게시판 -초기화면 */
	@RequestMapping("noticeMgr.do")
	public String initNotice(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".initNotice");
		logger.info("   - paramMap : " + paramMap);
		
		// 로그인해서 리스트를 먼저 뿌린다.
		model.addAttribute("writer", session.getAttribute("loginId"));
		// 작성 초기 단계에서 쓰려고 미리 뿌린다.
		// System.out.println("writer : " + session.getAttribute("loginId"));
		
		logger.info("+ End " + className + ".initNotice");
		
		return "scm/notice";
	}
	
	
	/* 공지사항 리스트 뿌리기 */
	@RequestMapping("noticeList.do")
	public String noticeList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		    logger.info("+ Start " + className + ".noticeList");
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
			List<NoticeModel> noticeList = noticeService.noticeList(paramMap);
			model.addAttribute("noticeList", noticeList);
			
			// 목록 숫자 추출하여 보내기 
			int totalCnt = noticeService.noticeTotalCnt(paramMap);
			model.addAttribute("totalCnt", totalCnt);
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPage",currentPage);
			
			//System.out.println("자 컨트롤러에서 값을 가지고 jsp로 갑니다~ : " + freeboardlist.size());
			logger.info("+ End " + className + ".noticeList");
			
		return "scm/noticeList";	
	}
	
	/* 공지사항 상세 정보 뿌리기 */
	@RequestMapping("detailNoticeList.do")
	@ResponseBody
	public Map<String,Object> detailList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		  logger.info("+ Start " + className + ".detailList");
		  logger.info("   - paramMap : " + paramMap);
		  
		String result="";
		
		// 선택된 게시판 1건 조회 
		NoticeModel detailNotice = noticeService.detailNotice(paramMap);
		//List<CommentsVO> comments = null;
		
		//파일 1건 조회
		FileModel selectFile = noticeService.selectFile(paramMap);
		
		if(detailNotice != null) {
			
			result = "SUCCESS";  // 성공시 찍습니다. 
			
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detailNotice); // 리턴 값 해쉬에 담기 
		
		if(selectFile != null) {
			resultMap.put("result2", selectFile); // 리턴 값 해쉬에 담기 
		}else {
			resultMap.put("result2", "NOT"); // 리턴 값 해쉬에 담기 
		}
		//resultMap.put("resultComments", comments);
		resultMap.put("resultMsg", result); // success 용어 담기 
		
		System.out.println("결과 글 찍어봅세 " + result);
		System.out.println("결과 글 찍어봅세 " + detailNotice);
		System.out.println("결과 글 찍어봅세 " + selectFile);
		
		logger.info("+ End " + className + ".detailList");
		
		return resultMap;
	}
	
	
	
	/* 공지사항 등록하기 */
	@RequestMapping("noticeSave.do")
	@ResponseBody
	public Map<String,Object> savaList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println("저장키를 먹나요~~~~?? : " + paramMap.toString());
		
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
			noticeService.insertNotice(paramMap,request); // 저장 service
			resultMsg = "SUCCESS";
			
		}else if("U".equals(action)) {
			noticeService.updateNotice(paramMap,request); // 수정 service
			resultMsg = "UPDATE";
			
		}else if("D".equals(action)) {
			noticeService.deleteNotice(paramMap); // 수정 service
			resultMsg = "DELETE";
			
		}else {
			resultMsg ="FALSE / 등록에 실패했습니다.";
		}
		
		
		// 결과 값 전송
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", resultMsg);
		
		return resultMap;
	}
	
	@RequestMapping("fileDown.do")
	public void downloadBbsAtmtFil(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
	
		logger.info("+ Start " + className + ".downloadBbsAtmtFil");
		logger.info("   - paramMap : " + paramMap);
		
		// 첨부파일 조회
		FileModel selectFile = noticeService.selectFile(paramMap);
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(rootPath+selectFile.getFile_new_name()));
		
		response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(selectFile.getFile_ofname(),"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();

		logger.info("+ End " + className + ".fileDown");
	}
	
	
	
	
	

}
