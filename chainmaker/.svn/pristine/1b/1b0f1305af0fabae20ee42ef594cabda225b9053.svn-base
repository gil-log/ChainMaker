package kr.happyjob.chainmaker.ged.service;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.ged.dao.SalesStatusDao;
import kr.happyjob.chainmaker.ged.model.CompanySalesDTO;
import kr.happyjob.chainmaker.ged.model.CompanySalesDetailDTO;
import kr.happyjob.chainmaker.ged.model.CompanySalesDetailVO;
import kr.happyjob.chainmaker.ged.model.CompanySalesVO;
import kr.happyjob.chainmaker.ged.model.SalesRequestDTO;

@Transactional
@Service("SalesStatusServiceImpl")
public class SalesStatusServiceImpl implements SalesStatusService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private SalesStatusDao salesStatusDao;
	
	@Override
	public List<CompanySalesDTO> getCompanySalesList(SalesRequestDTO salesRequestDTO) {
		List<CompanySalesVO> voList = salesStatusDao.selectCompanySales(salesRequestDTO);
		
		List<CompanySalesDTO> dtoList = new LinkedList<>();
		
		Iterator<CompanySalesVO> iterator = voList.iterator();
		
		while(iterator.hasNext()) {
			CompanySalesVO vo = iterator.next();
			
			CompanySalesDTO dto = new CompanySalesDTO(vo);
			
			dtoList.add(dto);
		}
		
		return dtoList;
	}

	@Override
	public int countCompanySales(SalesRequestDTO salesRequestDTO) {
		int totalCount = salesStatusDao.countCompanySales(salesRequestDTO);
		return totalCount;
	}

	@Override
	public List<CompanySalesDetailDTO> getCompanySalesDetailListByCompanyName(SalesRequestDTO salesRequestDTO) {
		List<CompanySalesDetailVO> voList = salesStatusDao.selectCompanySalesDetail(salesRequestDTO);
		
		List<CompanySalesDetailDTO> dtoList = new LinkedList<>();
		
		Iterator<CompanySalesDetailVO> iterator = voList.iterator();
		
		while(iterator.hasNext()) {
			CompanySalesDetailVO vo = iterator.next();
			
			CompanySalesDetailDTO dto = new CompanySalesDetailDTO(vo);
			
			dtoList.add(dto);
		}
		
		return dtoList;
	}

	@Override
	public int countCompanySalesDetailListByCompanyName(SalesRequestDTO salesRequestDTO) {
		
		int totalCount = salesStatusDao.countCompanySalesDetail(salesRequestDTO);
		
		return totalCount;
	}

}
