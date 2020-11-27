package kr.happyjob.chainmaker.scm.dao;

import java.util.List;

import kr.happyjob.chainmaker.scm.model.WHInfoDTO;
import kr.happyjob.chainmaker.scm.model.WHInfoVO;
import kr.happyjob.chainmaker.scm.model.WhMngInfoDTO;
import kr.happyjob.chainmaker.scm.model.WhPgAndScKeyWordDTO;

public interface WHInfoDao {
  
  // 전체 창고 정보
  public List<WHInfoVO> whInfoList(WhPgAndScKeyWordDTO whPgAndScKeyWordDTO);
  
  // 조회 목록 수
  public int totalCnt(WhPgAndScKeyWordDTO whPgAndScKeyWordDTO);
  
  // 배송담당자 정보 구하기
  public List<WHInfoVO> whMngInfoList(WhMngInfoDTO whMngInfoDTO);
  
  // 담당자별 창고 정보 구하기
  public List<WHInfoVO> whMngWareInfoList(WHInfoDTO whInfoDTO);
  
  // 창고 정보 등록
  public int insertWhInfo(WHInfoDTO whInfoDTO);
  
  // 창고 정보 수정
  public int updateWhInfo(WHInfoDTO whInfoDTO);
  
  // 창고 정보 삭제 처리
  //public int deleteWhInfo(WHInfoDTO whinfoDTO);
  
  
}
