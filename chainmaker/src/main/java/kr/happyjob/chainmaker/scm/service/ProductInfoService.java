package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.chainmaker.scm.model.DetailCdVO;
import kr.happyjob.chainmaker.scm.model.ProductInfoModel;

public interface ProductInfoService {
	
	List<ProductInfoModel> selectProductInfo(Map<String, Object> paramMap);
	List<DetailCdVO> selectDetailCode();
	int countProductInfo();
	ProductInfoModel selectProductDetail(Map<String, Object> paramMap);
	boolean insertProduct(Map<String, Object> paramMap, MultipartHttpServletRequest request);
	boolean deleteProduct(Map<String, Object> paramMap);
	boolean updateProduct(Map<String, Object> paramMap, MultipartHttpServletRequest request);

}
