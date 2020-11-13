package kr.happyjob.chainmaker.scm.dao;

import java.util.List;

import kr.happyjob.chainmaker.scm.model.WHInfoDTO;
import kr.happyjob.chainmaker.scm.model.WHInfoVO;
import kr.happyjob.chainmaker.scm.model.WhPgAndScKeyWordDTO;

public interface WHInfoDao {
  
  // 전체 창고 정보
  public List<WHInfoVO> whInfoList(WhPgAndScKeyWordDTO whPgAndScKeyWordDTO);
  
  // 조회 목록 수
  public int totalCnt(WhPgAndScKeyWordDTO whPgAndScKeyWordDTO);
  
}
