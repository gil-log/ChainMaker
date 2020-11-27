package kr.happyjob.chainmaker.scm.dao;


import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.SupplierInfoModel;

public interface SupplierInfoDao { 
	
	//납품 업체 목록 조회
	public List<SupplierInfoModel> listDelivery(Map<String, Object> paramMap) throws Exception;
	//납품 업체 카운트
	public int totalCntDelivery(Map<String, Object> paramMap) throws Exception;
	//제품 목록 조회
	public List<SupplierInfoModel> listProduct(Map<String, Object> paramMap) throws Exception;
	//제품 목록 카운트
	public int totalCntProduct(Map<String, Object>paramMap) throws Exception;
	//납품 업체 추가
	public int insertDelivery(Map<String, Object> paramMap) throws Exception;
	//납품 업체 수정
	public int updateDelivery(Map<String, Object> paramMap) throws Exception;
	//납품 단건 조회
	public SupplierInfoModel selectDelivery(Map<String, Object> paramMap) throws Exception;
	//납품 업체 삭제
	//public int deleteDelivery(Map<String, Object> paramMap) throws Exception;
	//납품 업체 복원
	//public int recoveryDelivery(Map<String, Object> paramMap) throws Exception;
}