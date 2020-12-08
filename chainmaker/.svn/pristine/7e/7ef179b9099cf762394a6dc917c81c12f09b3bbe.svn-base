package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.scm.dao.RefundInfoDao;
import kr.happyjob.chainmaker.scm.model.DirectionVO;
import kr.happyjob.chainmaker.scm.model.RefundVO;
import kr.happyjob.chainmaker.scm.model.WarehouseVO;

@Service
public class RefundInfoServiceImpl implements RefundInfoService {

	@Autowired
	RefundInfoDao refundInfoDao;

	// 반품리스트 
	@Override
	public List<RefundVO> selectRefundList(Map<String, Object> paramMap) throws Exception {
		
		List<RefundVO> selectRefundList = refundInfoDao.selectRefundList(paramMap);
		
		return selectRefundList;
	}

	//반품 리스트 갯수 
	@Override
	public int countRefundList(Map<String, Object> paramMap) {
		
		int totalCnt = refundInfoDao.countRefundList(paramMap);
		return totalCnt;
	}
	
	//모달창띄우기 
	@Override
	public RefundVO selectRDocModal(Map<String, Object> paramMap) {
		RefundVO rDocModal = refundInfoDao.selectRDocModal(paramMap);
	
		return rDocModal;
	}
	
	//창고리스트 가져오기 
	@Override
	public List<WarehouseVO> selectWareInfo(Map<String, Object> paramMap) {
		List<WarehouseVO> wareInfo = refundInfoDao.selectWareInfo(paramMap);
		return wareInfo;
	}

	//임원승인 누르면 업데이트 - 2가지 테이블 - 다오 2개호출 
	@Transactional
	@Override
	public void updateRefundWareNo(Map<String, Object> paramMap) {
		refundInfoDao.updateRefundWareNo(paramMap);
		refundInfoDao.updateDirectionRefundWareNo(paramMap);
		refundInfoDao.insertProductIoWarehouse(paramMap);
		
		
	}

	
	
	
	/*@Override
	public void updateRefundConfirmCd(Map<String, Object> paramMap) {
		refundInfoDao.updateRefundConfirmCd(paramMap);
		
	}*/
	
	
	
	
	
	
	
	

	//검색한 리스트
	/*@Override
	public List<RefundVO> selectedRefundList(Map<String, Object> paramMap) {
		
		List<RefundVO> selectRefundList = refundInfoDao.selectRefundList(paramMap);
		
		return selectRefundList;
	}*/

	//검색한 리스트 갯수 
	/*@Override
	public int selectedRefundCnt(Map<String, Object> paramMap) {
		int totalCnt = refundInfoDao.refundListCnt(paramMap);
		return totalCnt;
	}*/




/*	@Override
	public DirectionVO insertDirectionWareNo(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RefundVO insertRefundWareNo(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return null;
	}*/

	/*@Override
	public List<RefundVO> selectedRefundList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectedRefundCnt(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return 0;
	}*/
	
	
	
	
	
}
