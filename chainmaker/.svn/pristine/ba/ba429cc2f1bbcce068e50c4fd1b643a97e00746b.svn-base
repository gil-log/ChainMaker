package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import kr.happyjob.chainmaker.scm.model.SupplierInfoModel;
import kr.happyjob.chainmaker.scm.dao.SupplierInfoDao;



@Service
public class SupplierInfoServiceImpl implements SupplierInfoService{
	
	@Autowired //service에서는 controller,DAO와 연결되어 있다.
	SupplierInfoDao supplierInfoDao;
	
	//납품 업체 목록 조회
	@Override
	public List<SupplierInfoModel> listDelivery(Map<String, Object> paramMap) throws Exception {
												//필요한 값
		List<SupplierInfoModel> listDelivery = supplierInfoDao.listDelivery(paramMap);
		//List는 쇼핑백 <>사이는 봉투 List에 <>내용을 담은 후에 리턴해준다. <> 내용에는 우측항의 Dao의 내용
		//빈 List<SupplierInfoVO> listSupplierInfo 라는 그릇에 supplierInfoDao.listSupplierInfo(paramMap) 라는 계란을 담고 리턴
		return listDelivery;
	}
	//납품 업체 카운트
	@Override
	public int totalCntDelivery(Map<String, Object> paramMap) throws Exception {
		int totalCntDelivery = supplierInfoDao.totalCntDelivery(paramMap);
		return totalCntDelivery;
	}
	//제품 목록 조회
	@Override
	public List<SupplierInfoModel> listProduct(Map<String, Object> paramMap) throws Exception{
		List<SupplierInfoModel> listProduct = supplierInfoDao.listProduct(paramMap);
		
		return listProduct;
	}
	//제품 목록 카운트
	@Override
	public int totalCntProduct(Map<String, Object>paramMap) throws Exception{
		int totalCntProduct = supplierInfoDao.totalCntProduct(paramMap);
		return totalCntProduct;
	}
	//납품 업체 등록
	@Override
	public int insertDelivery(Map<String, Object> paramMap) throws Exception {
		int ret = supplierInfoDao.insertDelivery(paramMap);
		return ret;
	}
	//납품 업체 수정
	@Override
	public int updateDelivery(Map<String, Object> paramMap) throws Exception {
		int ret = supplierInfoDao.updateDelivery(paramMap);
		return ret;
	}
	//납품 업체 단건 조회
	@Override
	public SupplierInfoModel selectDelivery(Map<String, Object> paramMap) throws Exception {
		SupplierInfoModel selectDelivery = supplierInfoDao.selectDelivery(paramMap);
		return selectDelivery;
	}
	//납품 업체 삭제
/*	@Override
	public int deleteDelivery(Map<String, Object> paramMap) throws Exception {
		int ret = supplierInfoDao.deleteDelivery(paramMap);
		return ret;
	}*/
	//납품 업체 복원
/*	@Override
	public int recoveryDelivery(Map<String, Object> paramMap) throws Exception {
		int ret = supplierInfoDao.recoveryDelivery(paramMap);
		return ret;
	}*/
	
	
}
