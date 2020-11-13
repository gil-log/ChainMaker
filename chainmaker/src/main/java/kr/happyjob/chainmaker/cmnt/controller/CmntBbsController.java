package kr.happyjob.chainmaker.cmnt.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.cmnt.model.CmntBbsAtmtFilModel;
import kr.happyjob.chainmaker.cmnt.model.CmntBbsCmtModel;
import kr.happyjob.chainmaker.cmnt.model.CmntBbsModel;
import kr.happyjob.chainmaker.cmnt.service.CmntBbsService;
import kr.happyjob.chainmaker.common.comnUtils.ComnCodUtil;
import kr.happyjob.chainmaker.common.comnUtils.MediaUtils;
import kr.happyjob.chainmaker.system.model.ComnCodUtilModel;

@Controller
@RequestMapping("/cmnt/")
public class CmntBbsController {
	
	@Autowired
	CmntBbsService CmntBbsService;

	//@Autowired
	//CmntMgrService CmntMgrService;
	

	// Root path for file upload 
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	/**
	 * 게시글 초기화면
	 */
	@RequestMapping("cmntBbs.do")
	public String initCmntBbs(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initCmntBbs");

		paramMap.put("ofcId", session.getAttribute("ofcId"));          // 오피스 ID
		paramMap.put("ofcDvsCod", session.getAttribute("ofcDvsCod"));  // 오피스 구분 코드

		List<ComnCodUtilModel> listSaeObjGbn = ComnCodUtil.getComnCod("SAE_OBJ_GBN","M");	// 공유대상구분코드 (M제외)
		//Collections.reverse(listSaeObjGbn); // 오피스 구분 역순으로
		if(!session.getAttribute("ofcDvsCod").toString().equals("M")){
			listSaeObjGbn = ComnCodUtil.getComnCod("SAE_OBJ_GBN","A");// 오피스 구분 코드 (A제외)
		}
		
		//CmntMgrModel listCmntModel  = CmntMgrService.selectCmnt(paramMap);	// 커뮤니티 정보
		
		List<ComnCodUtilModel> listSrchOpt = ComnCodUtil.getComnCod("SRCH_OPT");					// 검색 옵션
		List<ComnCodUtilModel> listLstNum = ComnCodUtil.getComnCod("LST_NUM");					// 리스트 갯수
		// 소속 목록 조회
		paramMap.put("includeM", "Y");  // 공유대상 리스트에 클리어 테크놀로지를 추가하기위해
		logger.info("   - paramMap : " + paramMap);
		
		model.addAttribute("listSrchOpt", listSrchOpt);			// 검색 옵션
		model.addAttribute("listLstNum", listLstNum);			// 리스트 갯수listCmntModel
		model.addAttribute("listSaeObjGbn", listSaeObjGbn);	// 공유대상구분코드
		//model.addAttribute("listCmntModel", listCmntModel);	// 커뮤니티 정보
		
		logger.info("+ End " + className + ".initCmntBbs");

		return "cmnt/cmntBbs";
	}
	
	
	/**
	 * 게시글 목록 조회
	 */
	@RequestMapping("cmntBbsList.do")
	public String listCmntBbs(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listCmntBbs");

		paramMap.put("ofcId", session.getAttribute("ofcId"));          // 오피스 ID
		paramMap.put("ofcDvsCod", session.getAttribute("ofcDvsCod"));  // 오피스 구분 코드
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		logger.info("   - paramMap : " + paramMap);
		
		// 게시글 목록 조회 0depth
		List<CmntBbsModel> listCmntBbsModel = CmntBbsService.listCmntBbs(paramMap);
		
		model.addAttribute("listModel", listCmntBbsModel);
		
		// 게시글 목록 카운트 조회
		int totalCount = CmntBbsService.countListBbs(paramMap);
		model.addAttribute("totalCnt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);
		
		logger.info("+ End " + className + ".listCmntBbs");

		return "/cmnt/cmntBbsList";
	}
	
	/**
	 *  게시글 조회
	 */
	@RequestMapping("selectCmntBbs.do")
	@ResponseBody
	public Map<String, Object> selectCmntBbs(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectCmntBbs");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "사용 가능 합니다.";
		// 게시글 단건 조회
		CmntBbsModel cmntBbsModel = CmntBbsService.selectCmntBbs(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("resultModel", cmntBbsModel);
		
		logger.info("+ End " + className + ".selectCmntBbs");
		
		return resultMap;
	}
	
	
	/**
	 *  게시글 저장 : 신규/업데이트
	 */
	@RequestMapping("saveCmntBbs.do")
	@ResponseBody
	public Map<String, Object> saveCmntBbs(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveCmntBbs");

		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		// 사용자 정보 설정
		paramMap.put("ofc_id", session.getAttribute("ofcId"));
		paramMap.put("usr_sst_id", session.getAttribute("usrSstId"));
		paramMap.put("fst_rgst_sst_id", session.getAttribute("usrSstId"));
		paramMap.put("fnl_mdfr_sst_id", session.getAttribute("usrSstId"));

		logger.info("   - paramMap : " + paramMap);
		
		if ("I".equals(action)) {
			CmntBbsService.insertCmntBbs(paramMap, request); // 게시글 신규 저장 
			
		} else if("U".equals(action)) {
			CmntBbsService.updateCmntBbs(paramMap, request); // 게시글 수정 저장
			
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveCmntBbs");
		
		return resultMap;
	}
	
	/**
	 *  게시글 삭제
	 */
	@RequestMapping("deleteCmntBbs.do")
	@ResponseBody
	public Map<String, Object> deleteCmntBbs(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".deleteCmntBbs");

		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";

		paramMap.put("fnl_mdfr_sst_id", session.getAttribute("usrSstId"));
		logger.info("   - paramMap : " + paramMap);
		// 게시글 삭제
		CmntBbsService.deleteCmntBbs(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteCmntBbs");
		
		return resultMap;
	}
	
	/**
	 * 첨부파일 다운로드
	 */
	@RequestMapping("downloadBbsAtmtFil.do")
	public void downloadBbsAtmtFil(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
	
		logger.info("+ Start " + className + ".downloadBbsAtmtFil");
		logger.info("   - paramMap : " + paramMap);
		
		// 첨부파일 조회
		CmntBbsAtmtFilModel cmntBbsAtmtFilModel = CmntBbsService.selectCmntBbsAtmtFil(paramMap);
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(rootPath+cmntBbsAtmtFilModel.getAtmt_fil_psc_fil_nm()));
		
		response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(cmntBbsAtmtFilModel.getAtmt_fil_lgc_fil_nm(),"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();

		logger.info("+ End " + className + ".downloadBbsAtmtFil");
	}
	
	/**
	 * 게시물 이미지 보기
	 */
	@RequestMapping(value="/selectCmntBbsPoto.do")
	@ResponseBody
	public ResponseEntity <byte []> selectCmntBbsPoto(String bbs_id, String snm) throws Exception {
		
		logger.info("+ Start " + className + ".selectCmntBbsPoto");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bbs_id", bbs_id);
		paramMap.put("snm", snm);
		
		// 파일 단건 조회
		CmntBbsAtmtFilModel cmntBbsAtmtFilModel = CmntBbsService.selectCmntBbsAtmtFil(paramMap);
		
		InputStream in = null;
        ResponseEntity<byte[]> entity = null;
		
		try {

			String fileName = cmntBbsAtmtFilModel.getAtmt_fil_psc_fil_nm();
            MediaType mType = MediaUtils.getMediaType(cmntBbsAtmtFilModel.getFil_ets());

            HttpHeaders headers = new HttpHeaders();
            
            in = new FileInputStream(rootPath + fileName);
            
            if (mType != null) {
                headers.setContentType(mType);
            } else {
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                headers.add("Content-Disposition", "attatchment; filename=\"" + 
                        new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
            }
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
            
        } catch(Exception e) {
        	logger.error(e.toString());
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
        	if (in != null) in.close();
        }

		logger.info("+ End " + className + ".selectCmntBbsPoto");
		
        return entity;
	}
	
	/**
	 * 댓글 목록 조회
	 */
	@RequestMapping("cmntCmtList.do")
	@ResponseBody
	public Map<String, Object> listCmntCmt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".cmntCmtList");
		logger.info("   - paramMap : " + paramMap);
		
		// 댓글 목록 조회
		List<CmntBbsCmtModel> listBbsCmtModel = CmntBbsService.listBbsCmt(paramMap);
		
		logger.info("+ End " + className + ".cmntCmtList");

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("listModel", listBbsCmtModel);
		
		logger.info("+ End " + className + ".insertCmntCmt");
		
		return resultMap;
	}
	
	/**
	 *  댓글 저장
	 */
	@RequestMapping("insertCmntCmt.do")
	@ResponseBody
	public Map<String, Object> insertCmntCmt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".insertCmntCmt");

		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		// 사용자 정보 설정
		paramMap.put("usr_sst_id", session.getAttribute("usrSstId"));
		paramMap.put("fst_rgst_sst_id", session.getAttribute("usrSstId"));
		paramMap.put("fnl_mdfr_sst_id", session.getAttribute("usrSstId"));

		logger.info("   - paramMap : " + paramMap);
		
		CmntBbsService.insertBbsCmt(paramMap); // 댓글 신규 저장 
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".insertCmntCmt");
		
		return resultMap;
	}
	
	/**
	 *  댓글 삭제
	 */
	@RequestMapping("deleteCmntCmt.do")
	@ResponseBody
	public Map<String, Object> deleteCmntCmt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".deleteCmntBbs");

		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		logger.info("   - paramMap : " + paramMap);
		
		CmntBbsService.deleteBbsCmt(paramMap); // 게시글 삭제
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteCmntCmt");
		
		return resultMap;
	}
	
}
