package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.chainmaker.scm.model.DetailCdVO;
import kr.happyjob.chainmaker.scm.model.ProductInfoModel;

public interface ProductInfoService {
	
	List<ProductInfoModel> selectProductInfo(Map<String, Object> paramMap);
	List<DetailCdVO> selectDetailCode();
	int countProductInfo(Map<String, Object> paramMap);
	ProductInfoModel selectProductDetail(Map<String, Object> paramMap);
	boolean insertProduct(Map<String, Object> paramMap, HttpServletRequest request);
	boolean deleteProduct(Map<String, Object> paramMap, HttpServletRequest request);
	boolean updateProduct(Map<String, Object> paramMap, HttpServletRequest request);

}
