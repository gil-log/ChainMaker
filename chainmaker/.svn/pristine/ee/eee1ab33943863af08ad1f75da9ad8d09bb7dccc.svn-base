package kr.happyjob.chainmaker.epc.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.epc.model.ProductListModel;
import kr.happyjob.chainmaker.scm.model.ProductInfoModel;
import kr.happyjob.chainmaker.scm.model.UserInfoModel;

public interface ProductListService {
	
	
	/** 그룹코드 목록 조회 */
	public List<ProductListModel> listProductList(Map<String, Object> paramMap) throws Exception;
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListProductList(Map<String, Object> paramMap) throws Exception;
	
	/** 모달창 조회 */
	public ProductListModel selectProductDetail(Map<String, Object> paramMap) throws Exception;
	
	/** 주문기능 */
	public int insertOrder(Map<String, Object> paramMap) throws Exception;
	
	/** 장바구니기능 */
	public int insertBasket(Map<String, Object> paramMap) throws Exception;
	
	/** 장바구니 중복조회 */
	public Integer existBasket(Map<String, Object> paramMap) throws Exception;
	
	/** 동적 셀렉트 조회 */
	public List<ProductListModel> selectProduct(Map<String, Object> paramMap) throws Exception;
	
	/** 동적 셀렉트 상품목록*/
	public List<ProductListModel> selectDetail(Map<String, Object> paramMap) throws Exception;
	
	/** 은행 모달*/
	public ProductListModel adminBank(Map<String, Object> paramMap) throws Exception;
}
