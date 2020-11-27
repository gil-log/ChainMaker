package kr.happyjob.chainmaker.epc.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.epc.model.EpcInquiryModel;


public interface EpcInquiryDao {
	//빌립 담당
	
	// 문의 총 숫자 가져오기
	public int inquiryTotalCnt(Map<String, Object> paramMap) throws Exception;
	
	// 문의 정보 긁어오기
	public List<EpcInquiryModel> listInquiry(Map<String, Object> paramMap) throws Exception;
	
	// 1대1 문의 1건 상세
	public EpcInquiryModel detailInquiry(Map<String, Object> paramMap) throws Exception;
	
	// 카테고리 목록
	public List<EpcInquiryModel> listCategory(Map<String, Object> paramMap) throws Exception;
	
	//문의 등록
	public int insertInquiry(Map<String, Object> paramMap) throws Exception;
	
	//문의 수정
	public int updateInquiry(Map<String, Object> paramMap) throws Exception;
	
	//문의 삭제
	public int deleteInquiry(Map<String, Object> paramMap) throws Exception;
}
