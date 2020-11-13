package kr.happyjob.chainmaker.commonbiz.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.commonbiz.model.MsgMgmtModel;

public interface MsgMgmtDao {

	/** 메시지 관리 정보 단건 조회 */
	public MsgMgmtModel selectMsgInfo(Map<String, Object>paramMap);
	
	/** 메시지 정보 단건 조회 - 장치제작 완료 */
	public MsgMgmtModel selectMsgInfoPM(Map<String, Object>paramMap);
	
	/** 메시지 정보 단건 조회 - 캐시구매 무통장 입금 신청, 확인 및 결제 취소 */
	public MsgMgmtModel selectMsgInfoC_(Map<String, Object>paramMap);
	
	/** 메시지 정보 단건 조회 - 의뢰서 코멘트 등록 */
	public MsgMgmtModel selectMsgInfoM_(Map<String, Object>paramMap);
	
	/** 의뢰서 담당자 수신정보 조회 */
	public List<MsgMgmtModel> selectToInfoWrqPscg(Map<String, Object>paramMap);
	
	/** 오피스(병원) 담당자 수신정보 조회 */
	public List<MsgMgmtModel> selectToInfoOfc(Map<String, Object>paramMap);
	
	/** 오피스(병원) 담당자 수신정보 조회 - 클리어 캐시 */
	public List<MsgMgmtModel> selectToInfoOfcC_(Map<String, Object>paramMap);
	
	/** 코멘트 수신정보 조회 */
	public List<MsgMgmtModel> selectToInfoOfcM_(Map<String, Object>paramMap);
}


