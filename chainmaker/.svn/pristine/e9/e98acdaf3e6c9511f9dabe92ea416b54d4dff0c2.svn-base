package kr.happyjob.chainmaker.dlm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.dlm.model.EPCRefundDetailInfoVO;
import kr.happyjob.chainmaker.dlm.model.EPCRefundInfoVO;
import kr.happyjob.chainmaker.dlm.model.ProductInPreVO;
import kr.happyjob.chainmaker.dlm.model.RefundInfoRequestDTO;
import kr.happyjob.chainmaker.dlm.model.StockProcessingRequestDTO;

public interface RefundBuyerDao {

	// 기업고객 반품 정보 List 검색, Date, 회사명 검색 
	public List<EPCRefundInfoVO> selectEPCRefundListByRefundDateAndCompanyName (RefundInfoRequestDTO refundInfoRequestDTO) throws Exception;
	
	// 기업고객 반품 정보 List 검색, Date, 회사명 검색  카운팅
	public int countEPCRefundListByRefundDateAndCompanyName (RefundInfoRequestDTO refundInfoRequestDTO) throws Exception;
	
	// 반품 정보 List refund_no 검색
	public List<EPCRefundDetailInfoVO> selectRefundDetailListByRefundNo(RefundInfoRequestDTO refundInfoRequestDTO) throws Exception;
	
	// 반품 정보 List refund_no 검색 카운팅
	public int countRefundDetailListByRefundNo(RefundInfoRequestDTO refundInfoRequestDTO) throws Exception;
	
	// refund_no, pro_io_cd를 가지고  Product_io_warehouse 정보 List 가져오기
	public List<ProductInPreVO> selectProductIOInfoByRefundNoAndProIOCD(StockProcessingRequestDTO stockProcessingRequestDTO) throws Exception;
	
	// product_warehouse 실수량 적용하기
	public void updateProWareQtyByProNoAndWareNo (Map<String, Object> map) throws Exception;
	
	// refund_no, pro_no, ware_no를 가지고 product_IO_warehouse in_pre 에서 in_done으로 변경하기
	public void updateProIOCDtoInDoneByRefundNoAndProNoAndWareNo(Map<String, Object> map) throws Exception;
	
	// refund_no, pro_no, ware_no를 가지고 refund_confirm_cd 3으로 변경하기
	public void updateRefundConfirmCDtoThreeByRefundNoAndProNoAndWareNo(Map<String, Object> map) throws Exception;
	
}
