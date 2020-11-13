package kr.happyjob.chainmaker.cmnt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;

import kr.happyjob.chainmaker.cmnt.model.CmntBbsAtmtFilModel;
import kr.happyjob.chainmaker.cmnt.model.CmntBbsCmtModel;
import kr.happyjob.chainmaker.cmnt.model.CmntBbsModel;
import kr.happyjob.chainmaker.common.comnUtils.FileUtilModel;

public interface CmntBbsService {
	
	/** 게시글 목록 조회 */
	public List<CmntBbsModel> listCmntBbs(Map<String, Object> paramMap) throws Exception;

	/** 게시글 목록 카운트 조회 */
	public int countListBbs(Map<String, Object> paramMap) throws Exception;
	
	/** 게시글 단건 조회 */
	public CmntBbsModel selectCmntBbs(Map<String, Object> paramMap) throws Exception;
	
	/** 게시글 저장 */
	public int insertCmntBbs(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
	
	/** 게시글 수정 */
	public int updateCmntBbs(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
	
	/** 게시글 삭제 */
	public int deleteCmntBbs(Map<String, Object> paramMap) throws Exception;
	
	/** 게시글 조회수 update */
	public int updateCmntBbsVews(Map<String, Object> paramMap) throws Exception;

	/** 게시글 첨부 목록 조회 */
	public List<CmntBbsAtmtFilModel> listCmntBbsAtmtFil(Map<String, Object>paramMap);
	
	/** 게시글 첨부 단건 조회 */
	public CmntBbsAtmtFilModel selectCmntBbsAtmtFil(Map<String, Object>paramMap) throws Exception;

	/** 게시글 첨부 파일 저장 */
	public int saveCmntBbsAtmtFil(Map<String, Object>paramMap) throws Exception;
	
	/** 게시글 첨부 파일 수정 */
	public int updateCmntBbsAtmtFil(Map<String, Object>paramMap) throws Exception;

	/** 게시글 첨부 파일 단건 삭제 */
	public int deleteCmntBbsAtmtFil(Map<String, Object>paramMap) throws Exception;
	
	/** 게시글 첨부 파일 일괄 삭제 */
	public int deleteAllCmntBbsAtmtFil(Map<String, Object>paramMap) throws Exception;
	
	/** 댓글 조회 */
	public List<CmntBbsCmtModel> listBbsCmt(Map<String, Object> paramMap) throws Exception;
	
	/** 댓글 저장 */
	public int insertBbsCmt(Map<String, Object> paramMap) throws Exception;
	
	/** 댓글 삭제 */
	public int deleteBbsCmt(Map<String, Object> paramMap) throws Exception;
}
