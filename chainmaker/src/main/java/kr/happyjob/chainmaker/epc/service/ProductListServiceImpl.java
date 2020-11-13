package kr.happyjob.chainmaker.epc.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.epc.dao.ProductListDAO;
import kr.happyjob.chainmaker.epc.model.ProductListModel;


@Service
public class ProductListServiceImpl implements ProductListService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	ProductListDAO productListDao;
	
	/** 그룹코드 목록 조회 */
	public List<ProductListModel> listProductList(Map<String, Object> paramMap) throws Exception {
		
		List<ProductListModel> listProductList = productListDao.listProductList(paramMap);
		
		return listProductList;
	}
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListProductList(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = productListDao.countListProductList(paramMap);
		
		return totalCount;
	}
	
	
}