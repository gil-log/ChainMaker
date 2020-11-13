package kr.happyjob.chainmaker.scm.service;

import java.util.List;

import kr.happyjob.chainmaker.scm.model.WHInfoDTO;
import kr.happyjob.chainmaker.scm.model.WhPgAndScKeyWordDTO;

public interface WHInfoService {
  
  // 전체 창고 정보
  public List<WHInfoDTO> whInfoList(WhPgAndScKeyWordDTO whPgAndScKeyWordDTO);
  
  // 조회 목록 수
  public int totalCnt(WhPgAndScKeyWordDTO whPgAndScKeyWordDTO);
  
}
