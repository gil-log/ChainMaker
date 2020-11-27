package kr.happyjob.chainmaker.sti.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.sti.model.InquiryByInqNoModel;
import kr.happyjob.chainmaker.sti.model.InquiryModel;

public interface InquiryDao {

	/** 1:1문의 목록 조회 */
	public List<InquiryModel> listInquiry(Map<String, Object> paramMap) throws Exception;
	
	/** 1:1문의 목록 카운트 조회 */
	public int countListInquiry(Map<String, Object> paramMap) throws Exception;
			
	//문의 번호로 문의 정보 가져오기
	public InquiryByInqNoModel selectInquiryByInqNo(int inq_no) throws Exception;
	
	//1:1 문의 답변 저장
	public	int insertInquiryAns(Map<String, Object> paramMap) throws Exception;
	
	//1:1 문의 답변여부
	public int answerONX(Map<String, Object> paramMap) throws Exception;
	
	//1:1 문의 답변 삭제
	public int inqAnsDel(Map<String, Object> paramMap) throws Exception;
}
