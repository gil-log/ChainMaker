package kr.happyjob.chainmaker.scm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.WHInventoryFormModel;

public interface WHInventoryFormDao {

	//창고별 재고 조회
	public List<WHInventoryFormModel> whInventoryList(Map<String, Object> paramMap);
		
	//창고별 재고 조회 목록 카운트
	public int countWHInventoryList(Map<String, Object> paramMap);
	
	//제품별 입출고 내역 (특정 창고의 특정 제품 입출고 내역)
	public List<WHInventoryFormModel> whProductList(Map<String, Object> paramMap);
	
	//제품별 입출고 내역 카운트(특정 창고의 특정 제품 입출고 내역)
	public int countWHProductList(Map<String, Object> paramMap);
}
