package kr.happyjob.chainmaker.ged.dao;

import java.util.List;

import kr.happyjob.chainmaker.ged.model.CompanySalesDetailVO;
import kr.happyjob.chainmaker.ged.model.CompanySalesVO;
import kr.happyjob.chainmaker.ged.model.SalesRequestDTO;

public interface SalesStatusDao {

	// 회사별 매출 큰 범위 리스트 조회
	public List<CompanySalesVO> selectCompanySales (SalesRequestDTO salesRequestDTO);
	
	// 회사별 매출 큰 범위 리스트 카운팅
	public int countCompanySales (SalesRequestDTO salesRequestDTO);
	
	// 회사 이름으로 거래 내역 상세 정보 조회
	public List<CompanySalesDetailVO> selectCompanySalesDetail(SalesRequestDTO salesRequestDTO);
	
	// 회사 이름으로 거래 내역 상세 정보 카운팅
	public int countCompanySalesDetail(SalesRequestDTO salesRequestDTO);
}
