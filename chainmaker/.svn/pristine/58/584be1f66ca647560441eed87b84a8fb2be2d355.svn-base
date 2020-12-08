package kr.happyjob.chainmaker.dashboard.InfService;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.dashboard.model.InfModel;
import kr.happyjob.chainmaker.scm.model.FileModel;
import kr.happyjob.chainmaker.sti.model.InquiryByInqNoModel;
import kr.happyjob.chainmaker.sti.model.InquiryModel;

public  interface InfService {
	/** 1:1문의 목록 조회 */
	public List<InfModel> listInf(Map<String, Object> paramMap) throws Exception;
	
	/** 1:1문의 목록 카운트 조회 */
	public int countListInf(Map<String, Object> paramMap) throws Exception;
	
	// 공지사항 번호로 문의 정보 가져오기
	public InfModel selectInfByInfNo(int notice_no) throws Exception;
	
	//파일 조회
	public FileModel selectFile(Map<String, Object> paramMap) throws Exception;
}


