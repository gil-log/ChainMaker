package kr.happyjob.chainmaker.dashboard.InfService;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.sti.model.InquiryModel;

public  interface InfService {
	/** 1:1문의 목록 조회 */
	public List<InquiryModel> listInquiry(Map<String, Object> paramMap) throws Exception;
	
	/** 1:1문의 목록 카운트 조회 */
	public int countListInquiry(Map<String, Object> paramMap) throws Exception;
}
