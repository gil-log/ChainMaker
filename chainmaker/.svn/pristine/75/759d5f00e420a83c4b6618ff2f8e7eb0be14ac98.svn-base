package kr.happyjob.chainmaker.epc.service;


import java.util.Iterator;
import java.util.LinkedList;
/*import java.util.Iterator;
import java.util.LinkedList;*/
import java.util.List;
import java.util.Map;

/*import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;*/

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.epc.dao.RefundHistoryDao;
import kr.happyjob.chainmaker.epc.model.RefundHistoryDTO;
/*import kr.happyjob.chainmaker.epc.model.RefundHistoryVO;*/
import kr.happyjob.chainmaker.epc.model.RefundHistoryVO;

@Transactional
@Service("RefundHistoryServiceImpl")
public class RefundHistoryServiceImpl implements RefundHistoryService {

	/*private final Logger logger = LogManager.getLogger(this.getClass());*/
	
	@Autowired
	private RefundHistoryDao refundHistoryDao;
	/*반품 목록 조회*/
	@Override
	public List<RefundHistoryDTO> selectRefundHistory(Map<String, Object> paramMap) {
		
		/*VO값을 DTO로 변환하는 서비스 로직(DTO로 반환하기 위함)*/
		List<RefundHistoryVO> voList = refundHistoryDao.selectRefundHistory(paramMap);
		
		
		List<RefundHistoryDTO> dtoList = new LinkedList<>();
		
		Iterator<RefundHistoryVO> iterator = voList.iterator();
		
		while(iterator.hasNext()){
			RefundHistoryVO vo = iterator.next();
			RefundHistoryDTO dto = new RefundHistoryDTO(vo);
			
			dtoList.add(dto);
		}
		/*List<RefundHistoryVO> voList = refundHistoryDao.selectRefundHistory(paramMap);
		List<RefundHistoryDTO> dtoList = new LinkedList<>();
		Iterator<RefundHistoryVO> iterator = voList.iterator();
		
		while(iterator.hasNext()){
			RefundHistoryVO vo = iterator.next();
			RefundHistoryDTO dto = new RefundHistoryDTO(vo);
			
			dtoList.add(dto);
		}*/
		return dtoList;
	}
	/*반품 목록 카운트*/
	@Override
	public int countRefundHistory(Map<String, Object> paramMap) {
		int totalRefundHistory = refundHistoryDao.totalRefundHistory(paramMap);
		return totalRefundHistory;
	}
	/*반품 목록 단건 조회*/
	@Override
	public List<RefundHistoryDTO> detailRefundHistory(Map<String, Object> paramMap) {
		
		List<RefundHistoryVO> voList = refundHistoryDao.detailRefundHistory(paramMap);
		List<RefundHistoryDTO> dtoList = new LinkedList<>();
		Iterator<RefundHistoryVO> iterator = voList.iterator();
		
		while(iterator.hasNext()){
			RefundHistoryVO vo = iterator.next();
			RefundHistoryDTO dto = new RefundHistoryDTO(vo);
			
			dtoList.add(dto);
		}
		return dtoList;
	}
	/*반품 목록 단건 조회 카운트*/
	@Override
	public int totalDetailRefundHistory(Map<String, Object> paramMap) {
		int totalDetailRefundHistory = refundHistoryDao.totalDetailRefundHistory(paramMap);
		return totalDetailRefundHistory;
	}

}
