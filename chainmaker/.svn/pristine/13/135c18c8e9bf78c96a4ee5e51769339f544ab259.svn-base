package kr.happyjob.chainmaker.epc.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.epc.model.ProductListModel;


public interface ProductListDAO {

	/** 그룹코드 목록 조회 */
	public List<ProductListModel> listProductList(Map<String, Object> paramMap);
	
	/** 그룹코드 목록 조회 */
	public List<ProductListModel> searchProductList(Map<String, Object> paramMap);
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListProductList(Map<String, Object> paramMap);
	
	/** 모달창 조회 **/
	public ProductListModel selectProductDetail(Map<String, Object> paramMap);
	
	/** 주문기능 */
	public int insertOrder(Map<String, Object> paramMap);
	
	/** 장바구니기능 */
	public int insertBasket(Map<String, Object> paramMap);
	
	/** 장바구니 중복 조회 */
	public Integer existBasket(Map<String, Object> paramMap);
	
	/** 동적 셀렉트 조회 */
	public List<ProductListModel> selectProduct(Map<String, Object> paramMap);

	/** 동적 셀렉트 상품목록  */
	public List<ProductListModel> selectDetail(Map<String, Object> paramMap);
	
	/** 은행 모달 */
	public ProductListModel adminBank(Map<String, Object> paramMap) throws Exception;
	
}
