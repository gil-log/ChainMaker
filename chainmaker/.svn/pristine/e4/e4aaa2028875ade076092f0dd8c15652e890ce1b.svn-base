package kr.happyjob.chainmaker.scm.service;

import java.util.List;

import kr.happyjob.chainmaker.scm.model.WHInfoDTO;
import kr.happyjob.chainmaker.scm.model.WHInfoVO;
import kr.happyjob.chainmaker.scm.model.WhMngInfoDTO;
import kr.happyjob.chainmaker.scm.model.WhPgAndScKeyWordDTO;

public interface WHInfoService {
  
  // 전체 창고 정보
  public List<WHInfoDTO> whInfoList(WhPgAndScKeyWordDTO whPgAndScKeyWordDTO) throws Exception;
  
  // 조회 목록 수
  public int totalCnt(WhPgAndScKeyWordDTO whPgAndScKeyWordDTO) throws Exception;
  
  // 배송담당자 정보 구하기
  public List<WhMngInfoDTO> whMngInfoList(WhMngInfoDTO whMngInfoDTO) throws Exception;
  
  // 배송담당자별 창고 정보 구하기
  public List<WHInfoDTO> whMngWareInfoList(WHInfoDTO whInfoDTO) throws Exception;

  // 창고 정보 등록
  public int insertWhInfo(WHInfoDTO whInfoDTO) throws Exception;
  
  // 창고 정보 수정
  public int updateWhInfo(WHInfoDTO whInfoDTO) throws Exception;
  
  // 창고 정보 삭제 처리
  //public int deleteWhInfo(WHInfoDTO whinfoDTO) throws Exception;
  
}
