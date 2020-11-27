package kr.happyjob.chainmaker.scm.service;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.scm.dao.WHInfoDao;
import kr.happyjob.chainmaker.scm.model.WHInfoDTO;
import kr.happyjob.chainmaker.scm.model.WHInfoVO;
import kr.happyjob.chainmaker.scm.model.WhMngInfoDTO;
import kr.happyjob.chainmaker.scm.model.WhPgAndScKeyWordDTO;

@Service
public class WHInfoServiceImpl implements WHInfoService {
  
  @Autowired
  WHInfoDao whInfoDAO;
  
  @Override
  // 전체 창고 정보
  public List<WHInfoDTO> whInfoList(WhPgAndScKeyWordDTO whPgAndScKeyWordDTO) {
    // VO에서 DTO변환 과정
    List<WHInfoVO> whInfoList = whInfoDAO.whInfoList(whPgAndScKeyWordDTO);
    Iterator<WHInfoVO> whIterator = whInfoList.iterator();
    
    List<WHInfoDTO> resultWhInfoDTOList = new LinkedList<WHInfoDTO>();
    
    while (whIterator.hasNext()) {
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
  
  @Override
  // 배송담당자 정보
  public List<WhMngInfoDTO> whMngInfoList(WhMngInfoDTO whMngInfoDTO) {
    // VO에서 DTO변환 과정
    List<WHInfoVO> whMngInfoList = whInfoDAO.whMngInfoList(whMngInfoDTO);
    Iterator<WHInfoVO> whIterator = whMngInfoList.iterator();
    
    List<WhMngInfoDTO> resultWhMngInfoDTOList = new LinkedList<WhMngInfoDTO>();
    
    while (whIterator.hasNext()) {
      WHInfoVO whInfoVO = whIterator.next();
      WhMngInfoDTO resultWhInfoDTO = new WhMngInfoDTO(whInfoVO);
      resultWhMngInfoDTOList.add(resultWhInfoDTO);
    }
    return resultWhMngInfoDTOList;
  }
  
  @Override
  // 담당자별 창고 정보
  public List<WHInfoDTO> whMngWareInfoList(WHInfoDTO whInfoDTO) {
    // VO에서 DTO변환 과정
    List<WHInfoVO> whMngWareInfoList = whInfoDAO.whMngWareInfoList(whInfoDTO);
    Iterator<WHInfoVO> iter = whMngWareInfoList.iterator();
    
    List<WHInfoDTO> resultWhMngWareInfoDTOList = new LinkedList<WHInfoDTO>();
    
    while (iter.hasNext()) {
      WHInfoVO whInfoVO = iter.next();
      WHInfoDTO resultDTO = new WHInfoDTO(whInfoVO);
      resultWhMngWareInfoDTOList.add(resultDTO);
    }
    return resultWhMngWareInfoDTOList;
  }
  
  @Override
  // 창고 정보 등록 - 성공하면 1 이상, 실패하면 0 미만 // 숫자는 insert,update,delete가 성공한 수
  public int insertWhInfo(WHInfoDTO whInfoDTO) {
    return whInfoDAO.insertWhInfo(whInfoDTO);
  }

  @Override
  public int updateWhInfo(WHInfoDTO whInfoDTO) {
    return whInfoDAO.updateWhInfo(whInfoDTO);
  }
 
}
