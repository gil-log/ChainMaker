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
	
	/** 모달창 조회 **/
	@Override
	public ProductListModel selectProductDetail(Map<String, Object> paramMap) {
		ProductListModel detail = productListDao.selectProductDetail(paramMap);
		return detail;
	}
	
	/** 주문기능*/
	public int insertOrder(Map<String, Object> paramMap) throws Exception {
		
		int order = productListDao.insertOrder(paramMap);
		
		return order;
	}
	
	/** 장바구니기능*/
	public int insertBasket(Map<String, Object> paramMap) throws Exception {
		
		int basket = productListDao.insertBasket(paramMap);
		
		return basket;
	}
	
	/** 장바구니 중복 조회 */
	public Integer existBasket(Map<String, Object> paramMap) throws Exception {
		
		int exbasket = productListDao.existBasket(paramMap);
		
		return exbasket;
	}
	
	/** 동적 셀렉트 조회 */
	public List<ProductListModel> selectProduct(Map<String, Object> paramMap) throws Exception {
		
		List<ProductListModel> selectProduct = productListDao.selectProduct(paramMap);
		
		return selectProduct;
	}
	
	/** 동적 셀렉트 상품목록 */
	public List<ProductListModel> selectDetail(Map<String, Object> paramMap) throws Exception {
		
		List<ProductListModel> selectDetail = productListDao.selectDetail(paramMap);
		
		return selectDetail;
	}
	
	@Override
	public ProductListModel adminBank(Map<String, Object> paramMap) throws Exception {
		ProductListModel adminBank = productListDao.adminBank(paramMap);
		
		return adminBank;
	}
}