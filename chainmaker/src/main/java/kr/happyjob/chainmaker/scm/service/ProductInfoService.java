package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.chainmaker.scm.model.DeliveryModel;
import kr.happyjob.chainmaker.scm.model.DetailCdVO;
import kr.happyjob.chainmaker.scm.model.ProductInfoModel;
import kr.happyjob.chainmaker.scm.model.WHInventoryFormModel;

public interface ProductInfoService {
	
	List<ProductInfoModel> selectProductInfo(Map<String, Object> paramMap);
	List<DetailCdVO> selectDetailCode();
	List<WHInventoryFormModel> selectWareHouse();
	List<DeliveryModel> selectDelivery();	
	int countProductInfo(Map<String, Object> paramMap);
	List<ProductInfoModel> selectProductDetail(Map<String, Object> paramMap);
	boolean insertProduct(Map<String, Object> paramMap, HttpServletRequest request);
	boolean deleteProduct(Map<String, Object> paramMap, HttpServletRequest request);
	boolean updateProduct(Map<String, Object> paramMap, HttpServletRequest request);


}
