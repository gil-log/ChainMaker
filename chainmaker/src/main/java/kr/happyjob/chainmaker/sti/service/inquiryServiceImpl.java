package kr.happyjob.chainmaker.sti.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.sti.dao.InquiryDao;
import kr.happyjob.chainmaker.sti.model.InquiryByInqNoModel;
import kr.happyjob.chainmaker.sti.model.InquiryModel;

@Service
public class inquiryServiceImpl implements  InquiryService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	InquiryDao inquiryDao;
	
	/** 1:1문의 목록 조회 */
	public List<InquiryModel> listInquiry(Map<String, Object> paramMap) throws Exception {
		
		List<InquiryModel> istInquiry = inquiryDao.listInquiry(paramMap);
		
		return istInquiry;
	}
	
	/** 1:1문의 목록 카운트 조회 */
	public int countListInquiry(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = inquiryDao.countListInquiry(paramMap);
		
		return totalCount;
	}

	@Override
	public InquiryByInqNoModel selectInquiryByInqNo(int inq_no) throws Exception {
		return inquiryDao.selectInquiryByInqNo(inq_no);
	}

	@Override
	public int insertInquiryAns(Map<String, Object> paramMap) throws Exception {
		return inquiryDao.insertInquiryAns(paramMap) ;
	}

	@Override
	public int answerONX(Map<String, Object> paramMap) throws Exception {
		return inquiryDao.answerONX(paramMap);
	}

	@Override
	public int inqAnsDel(Map<String, Object> paramMap) throws Exception {
		return inquiryDao.inqAnsDel(paramMap);
	}
	
}
