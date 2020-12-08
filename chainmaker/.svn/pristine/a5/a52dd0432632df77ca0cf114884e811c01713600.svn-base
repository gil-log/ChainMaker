package kr.happyjob.chainmaker.dlm.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.dlm.dao.RefundBuyerDao;
import kr.happyjob.chainmaker.dlm.model.EPCRefundDetailInfoDTO;
import kr.happyjob.chainmaker.dlm.model.EPCRefundDetailInfoVO;
import kr.happyjob.chainmaker.dlm.model.EPCRefundInfoDTO;
import kr.happyjob.chainmaker.dlm.model.EPCRefundInfoVO;
import kr.happyjob.chainmaker.dlm.model.ProductInPreVO;
import kr.happyjob.chainmaker.dlm.model.RefundInfoRequestDTO;
import kr.happyjob.chainmaker.dlm.model.StockProcessingRequestDTO;
import kr.happyjob.chainmaker.dlm.model.StockProcessingResponseDTO;

@Transactional
@Service("RefundBuyerServiceImpl")
public class RefundBuyerServiceImpl implements RefundBuyerService {

	@Autowired
	private RefundBuyerDao refundBuyerDao;

	@Override
	public List<EPCRefundInfoDTO> getEPCRefundListByRefundDateAndCompanyName(RefundInfoRequestDTO refundInfoRequestDTO)
			throws Exception {
		
		List<EPCRefundInfoVO> voList = refundBuyerDao.selectEPCRefundListByRefundDateAndCompanyName(refundInfoRequestDTO);
		
		List<EPCRefundInfoDTO> dtoList = new LinkedList<>();
		
		Iterator<EPCRefundInfoVO> iterator = voList.iterator();
		
		while(iterator.hasNext()) {
			EPCRefundInfoVO vo = iterator.next();
			EPCRefundInfoDTO dto = new EPCRefundInfoDTO(vo);
			
			dtoList.add(dto);
		}
		
		return dtoList;
	}

	@Override
	public int countEPCRefundListByRefundDateAndCompanyName(RefundInfoRequestDTO refundInfoRequestDTO)
			throws Exception {
		
		int totalCount = refundBuyerDao.countEPCRefundListByRefundDateAndCompanyName(refundInfoRequestDTO);
		
		return totalCount;
	}

	@Override
	public List<EPCRefundDetailInfoDTO> getRefundDetailListByRefundNo(RefundInfoRequestDTO refundInfoRequestDTO)
			throws Exception {
		
		List<EPCRefundDetailInfoVO> voList = refundBuyerDao.selectRefundDetailListByRefundNo(refundInfoRequestDTO);
		
		List<EPCRefundDetailInfoDTO> dtoList = new LinkedList<>();
		
		Iterator<EPCRefundDetailInfoVO> iterator = voList.iterator();
		
		while(iterator.hasNext()) {
			EPCRefundDetailInfoVO vo = iterator.next();
			EPCRefundDetailInfoDTO dto = new EPCRefundDetailInfoDTO(vo);
			
			dtoList.add(dto);
		}
		
		return dtoList;
	}

	@Override
	public int countRefundDetailListByRefundNo(RefundInfoRequestDTO refundInfoRequestDTO) throws Exception {
		
		int totalCount = refundBuyerDao.countRefundDetailListByRefundNo(refundInfoRequestDTO);
		
		return totalCount;
	}

	@Transactional
	@Override
	public StockProcessingResponseDTO stockInWarehouse(StockProcessingRequestDTO stockProcessingRequestDTO)
			throws Exception {
		
		StockProcessingResponseDTO responseDTO = new StockProcessingResponseDTO();
		
		List<ProductInPreVO> productInPreVOList = refundBuyerDao.selectProductIOInfoByRefundNoAndProIOCD(stockProcessingRequestDTO);
		
		if(productInPreVOList.isEmpty()) {
			responseDTO.setMsg("재고 정보가 일치하지 않습니다.");
			responseDTO.setResult("FAIL");
			
			return responseDTO;
		}
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("productInPreVOList", productInPreVOList);
		
		try {
		refundBuyerDao.updateProWareQtyByProNoAndWareNo(map);
		
		refundBuyerDao.updateProIOCDtoInDoneByRefundNoAndProNoAndWareNo(map);
		
		refundBuyerDao.updateRefundConfirmCDtoThreeByRefundNoAndProNoAndWareNo(map);
		
		responseDTO.setMsg("재고 처리에 성공 하였습니다.");
		responseDTO.setResult("SUCCESS");
		
		}
		catch(Exception e) {
			e.printStackTrace();
			responseDTO.setMsg("재고 처리에 실패 하였습니다.");
			responseDTO.setResult("FAIL");
		}
		return responseDTO;
	}

}
