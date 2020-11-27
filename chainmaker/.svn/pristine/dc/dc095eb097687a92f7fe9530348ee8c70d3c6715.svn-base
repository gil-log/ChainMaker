package kr.happyjob.chainmaker.ged.service;

import java.util.List;

import kr.happyjob.chainmaker.ged.model.CompanySalesDTO;
import kr.happyjob.chainmaker.ged.model.CompanySalesDetailDTO;
import kr.happyjob.chainmaker.ged.model.SalesRequestDTO;

public interface SalesStatusService {
	
	// 날짜, 기업 명 검색기능 포함한 회사 매출 정보 큰 범위 리스트
	public List<CompanySalesDTO> getCompanySalesList(SalesRequestDTO salesRequestDTO);

	// 날짜, 기업명 검색기능 포함한 회사 매출 정보 큰 범위 리스트 카운팅
	public int countCompanySales(SalesRequestDTO salesRequestDTO);
	
	// 날짜, 기업명 검색 기능 포함한 상세 회사 매출 정보 리스트
	public List<CompanySalesDetailDTO> getCompanySalesDetailListByCompanyName(SalesRequestDTO salesRequestDTO);
	
	// 날짜, 기업명 검색 기능 포함한 상세 회사 매출 정보 리스트 카운팅
	public int countCompanySalesDetailListByCompanyName(SalesRequestDTO salesRequestDTO);
}
