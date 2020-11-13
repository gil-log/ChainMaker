package kr.happyjob.chainmaker.scm.service;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.scm.dao.WHInfoDao;
import kr.happyjob.chainmaker.scm.model.WHInfoDTO;
import kr.happyjob.chainmaker.scm.model.WHInfoVO;
import kr.happyjob.chainmaker.scm.model.WhPgAndScKeyWordDTO;

@Service
public class WHInfoServiceImpl implements WHInfoService {
  
  @Autowired
  WHInfoDao whInfoDAO;
  
  @Override
  // 전체 창고 정보 
  public List<WHInfoDTO> whInfoList(WhPgAndScKeyWordDTO whPgAndScKeyWordDTO) {
    //VO에서 DTO변환 과정
    List<WHInfoVO> whInfoList = whInfoDAO.whInfoList(whPgAndScKeyWordDTO);
    Iterator<WHInfoVO> whIterator = whInfoList.iterator();
    
    List<WHInfoDTO> resultWhInfoDTOList = new LinkedList<WHInfoDTO>();
    
    while(whIterator.hasNext()) {
      WHInfoVO whInfoVO = whIterator.next();
      WHInfoDTO resultWhInfoDTO = new WHInfoDTO(whInfoVO);
      resultWhInfoDTOList.add(resultWhInfoDTO);
    }
    return resultWhInfoDTOList;
  }
  
  @Override
  // 조회 목록 수
  public int totalCnt(WhPgAndScKeyWordDTO whPgAndScKeyWordDTO) {
    return whInfoDAO.totalCnt(whPgAndScKeyWordDTO);
  }
}
