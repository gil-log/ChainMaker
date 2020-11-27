package kr.happyjob.chainmaker.epc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.epc.dao.EpcInquiryDao;
import kr.happyjob.chainmaker.epc.model.EpcInquiryModel;

@Service
public class EpcInquiryServiceImpl implements EpcInquiryService {

	@Autowired
	EpcInquiryDao inquiryDao;
	
	@Override
	public int inquiryTotalCnt(Map<String, Object> paramMap) throws Exception {
		int totalCnt = inquiryDao.inquiryTotalCnt(paramMap);
		
		return totalCnt;
	}
	
	@Override
	public List<EpcInquiryModel> listInquiry(Map<String, Object> paramMap) throws Exception {
		List<EpcInquiryModel> listInquiry = inquiryDao.listInquiry(paramMap);
		
		return listInquiry;
	}
	
	@Override
	public EpcInquiryModel detailInquiry(Map<String, Object> paramMap) throws Exception {
		EpcInquiryModel detailInquiry = inquiryDao.detailInquiry(paramMap);
		return detailInquiry;
	}
	
	@Override
	public List<EpcInquiryModel> listCategory(Map<String, Object> paramMap) throws Exception {
		List<EpcInquiryModel> listCategory = inquiryDao.listCategory(paramMap);
		return listCategory;
	}
	
	@Override
	public int insertInquiry(Map<String, Object> paramMap) throws Exception {
		int result = inquiryDao.insertInquiry(paramMap);
		return result;
	}
	
	@Override
	public int updateInquiry(Map<String, Object> paramMap) throws Exception {
		int result = inquiryDao.updateInquiry(paramMap);
		return result;
	}
	
	@Override
	public int deleteInquiry(Map<String, Object> paramMap) throws Exception {
		int result = inquiryDao.deleteInquiry(paramMap);
		return result;
	}
}
