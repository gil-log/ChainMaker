package kr.happyjob.chainmaker.scm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.cmnt.model.CmntBbsAtmtFilModel;
import kr.happyjob.chainmaker.scm.model.FileModel;
import kr.happyjob.chainmaker.scm.model.NoticeModel;

public interface NoticeDao {

	public int noticeTotalCnt(Map<String, Object> paramMap) throws Exception;

	public List<NoticeModel> selectNoticeList(Map<String, Object> paramMap) throws Exception;

	public NoticeModel detailNotice(Map<String, Object> paramMap) throws Exception;

	public int numPlus() throws Exception;

	public int insertNotice(Map<String, Object> paramMap) throws Exception;

	public int insertNoticeFile(Map<String, Object> paramMap) throws Exception;

	public int updateHit(Map<String, Object> paramMap) throws Exception;

	public int updateNotice(Map<String, Object> paramMap) throws Exception;

	public int deleteNotice(Map<String, Object> paramMap) throws Exception;
	
	//파일 조회
	public FileModel selectFile(Map<String, Object> paramMap);
	
	//파일 삭제
	public int deleteFile(Map<String, Object> paramMap);
}
