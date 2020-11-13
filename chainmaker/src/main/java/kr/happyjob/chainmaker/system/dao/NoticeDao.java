package kr.happyjob.chainmaker.system.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.system.model.NoticeModel;

public interface NoticeDao {
	

	public int noticeTotalCnt(Map<String, Object> paramMap) throws Exception;


	public List<NoticeModel> selectNoticeList(Map<String, Object> paramMap) throws Exception;


	public NoticeModel detailNotice(Map<String, Object> paramMap) throws Exception;


	public int numPlus() throws Exception;

    
	public int insertNotice(Map<String, Object> paramMap) throws Exception;


	public int updateNotice(Map<String, Object> paramMap) throws Exception;


	public int deleteNotice(Map<String, Object> paramMap) throws Exception;

	


}
