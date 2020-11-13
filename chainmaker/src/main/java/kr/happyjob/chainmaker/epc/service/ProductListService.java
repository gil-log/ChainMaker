package kr.happyjob.chainmaker.epc.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.epc.model.ProductListModel;

public interface ProductListService {
	
	
	/** 그룹코드 목록 조회 */
	public List<ProductListModel> listProductList(Map<String, Object> paramMap) throws Exception;
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListProductList(Map<String, Object> paramMap) throws Exception;
}
