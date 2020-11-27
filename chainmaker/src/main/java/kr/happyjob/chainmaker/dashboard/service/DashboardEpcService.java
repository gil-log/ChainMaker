package kr.happyjob.chainmaker.dashboard.service;

import java.util.List;

import kr.happyjob.chainmaker.dashboard.model.ProductCategoryDTO;
import kr.happyjob.chainmaker.dashboard.model.SlideProductInfoDTO;
import kr.happyjob.chainmaker.dashboard.model.SlideProductInfoRequestDTO;

public interface DashboardEpcService {

	// 슬라이드쇼 제품 정보 리스트 가져오기
	public List<SlideProductInfoDTO> getSlideProductInfoList(SlideProductInfoRequestDTO slideProductInfoRequestDTO);
	
	// 제품 카테고리 리스트 가져오기
	public List<ProductCategoryDTO> getProductCategoryList();
}
