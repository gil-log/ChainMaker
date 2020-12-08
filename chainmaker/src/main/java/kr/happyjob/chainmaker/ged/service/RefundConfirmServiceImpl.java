package kr.happyjob.chainmaker.ged.service;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.ged.dao.OrderConfirmDao;
import kr.happyjob.chainmaker.ged.dao.RefundConfirmDao;
import kr.happyjob.chainmaker.ged.model.PurchaseInfoDTO;
import kr.happyjob.chainmaker.ged.model.PurchaseInfoVO;
import kr.happyjob.chainmaker.ged.model.PurchaseRequestDTO;
import kr.happyjob.chainmaker.ged.model.RefundConfirmInfoVO;

@Transactional
@Service("RefundConfirmServiceImpl")
public class RefundConfirmServiceImpl implements RefundConfirmService{

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	private RefundConfirmDao refundConfirmDao;

	//첫화면 목록! 
	@Override
	public List<RefundConfirmInfoVO> selectBeforeApproveRefundList(Map<String, Object> paramMap) throws Exception {
		List<RefundConfirmInfoVO> selectBeforeApproveRefundList = refundConfirmDao.selectBeforeApproveRefundList(paramMap);
		return selectBeforeApproveRefundList;
	}
	//첫 화면 갯수 
	@Override
	public int countBeforeApprovePurchaseList(Map<String, Object> paramMap) {
		int totalCnt = refundConfirmDao.countBeforeApprovePurchaseList(paramMap);
		return totalCnt;
	}
	
	//임원이 반품 승인 버튼 누른다.
	@Override
	public void clickCeoRefundConfirm(Map<String, Object> paramMap) {
		
	refundConfirmDao.updateRefundConfirm(paramMap);
		
	}
	
	
	
	/*@Override
	public List<RefundConfirmInfoVO> (Map<String, Object> paramMap) throws Exception {
		
		
		List<RefundConfirmInfoVO> selectBeforeApproveRefundList = refundConfirmDao.selectBeforeApproveRefundList(refundConfirmInfoVO);
		//List<PurchaseInfoVO> voList = refundConfirmDao.selectBeforeApproveRefundList(refundConfirmInfoVO);
		
		//Iterator<PurchaseInfoVO> iterator = voList.iterator();
		
		//List<PurchaseInfoDTO> dtoList = new LinkedList<>();
		
		while(iterator.hasNext()) {
			PurchaseInfoVO vo = iterator.next();
			PurchaseInfoDTO dto = new PurchaseInfoDTO(vo);
			dtoList.add(dto);
		}
		
		return selectBeforeApproveRefundList;
	}
*/

	/*@Override
	public int countBeforeApprovePurchaseList(RefundConfirmInfoVO refundConfirmInfoVO) {
		
		int totalCount = refundConfirmDao.countBeforeApprovePurchaseList(refundConfirmInfoVO);
		
		return totalCount;
	}*/


	/*@Override
	public void confirmPurchaseByPurchaseNo(PurchaseRequestDTO purchaseRequestDTO) {
		orderConfirmDao.updatePurchaseInfoToConfirmByPurchaseNo(purchaseRequestDTO);
	}*/

}
