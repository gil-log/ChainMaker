package kr.happyjob.chainmaker.dlm.service;

import java.util.List;

import kr.happyjob.chainmaker.dlm.model.EPCRefundDetailInfoDTO;
import kr.happyjob.chainmaker.dlm.model.EPCRefundInfoDTO;
import kr.happyjob.chainmaker.dlm.model.RefundInfoRequestDTO;
import kr.happyjob.chainmaker.dlm.model.StockProcessingRequestDTO;
import kr.happyjob.chainmaker.dlm.model.StockProcessingResponseDTO;

public interface RefundBuyerService {
	
		// 기업고객 반품 정보 List 검색, Date, 회사명 검색 
		public List<EPCRefundInfoDTO> getEPCRefundListByRefundDateAndCompanyName (RefundInfoRequestDTO refundInfoRequestDTO) throws Exception;
		
		// 기업고객 반품 정보 List 검색, Date, 회사명 검색  카운팅
		public int countEPCRefundListByRefundDateAndCompanyName (RefundInfoRequestDTO refundInfoRequestDTO) throws Exception;
		
		// 반품 정보 List refund_no 검색
		public List<EPCRefundDetailInfoDTO> getRefundDetailListByRefundNo(RefundInfoRequestDTO refundInfoRequestDTO) throws Exception;
		
		// 반품 정보 List refund_no 검색 카운팅
		public int countRefundDetailListByRefundNo(RefundInfoRequestDTO refundInfoRequestDTO) throws Exception;
		
		// 반품 번호를 가지고 product_io_warehouse 수량 product_warehouse 적용, in_done 변경, 반품_confirm_CD 3적용, 
		public StockProcessingResponseDTO stockInWarehouse(StockProcessingRequestDTO stockProcessingRequestDTO) throws Exception;
		
}
