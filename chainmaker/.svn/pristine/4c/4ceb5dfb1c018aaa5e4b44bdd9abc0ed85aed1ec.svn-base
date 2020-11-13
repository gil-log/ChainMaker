package kr.happyjob.chainmaker.system.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.system.dao.NoticeDao;
import kr.happyjob.chainmaker.system.model.NoticeModel;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public List<NoticeModel> noticeList(Map<String, Object> paramMap) throws Exception {
		
      List<NoticeModel> noticeList = noticeDao.selectNoticeList(paramMap);
		
		
		return noticeList;
	}

	@Override
	public int noticeTotalCnt(Map<String, Object> paramMap) throws Exception {
		
         int totalCnt = noticeDao.noticeTotalCnt(paramMap);
		
		return totalCnt;
	}

	@Override
	public NoticeModel detailNotice(Map<String, Object> paramMap) throws Exception {
	
		// 상세정보 가져오기 
		NoticeModel detailNotice = noticeDao.detailNotice(paramMap);
				
		return detailNotice;
	}

	@Override
	public int insertNotice(Map<String, Object> paramMap) throws Exception{
       
		int numResult = noticeDao.numPlus();
		paramMap.put("nt_no", numResult); // 번호 여기에 추가 
		int resultCnt = noticeDao.insertNotice(paramMap);
		
		return resultCnt;
	}

	@Override
	public int updateNotice(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = noticeDao.updateNotice(paramMap);
		
		return resultCnt;
	}

	@Override
	public int deleteNotice(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = noticeDao.deleteNotice(paramMap);
		
		return resultCnt;
	}



}
