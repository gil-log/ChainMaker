package kr.happyjob.chainmaker.scm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.DetailCdVO;
import kr.happyjob.chainmaker.scm.model.FileModel;
import kr.happyjob.chainmaker.scm.model.ProductInfoModel;

public interface ProductInfoDao {
	
	public List<ProductInfoModel> selectProductInfo(Map<String, Object> paramMap);
	public List<DetailCdVO> selectDetailCode();
	public int countProductInfo(Map<String, Object> paramMap);
	public ProductInfoModel selectProductDetail(Map<String, Object> paramMap);
	public FileModel selectFileInfo(Map<String, Object> paramMap);
	public int insertProdInfo(Map<String, Object> paramMap);
	public int insertProdFile(Map<String, Object> paramMap);
	public int deleteProdFile(Map<String, Object> paramMap);
	public int deleteProdInfo(Map<String, Object> paramMap);
	public int updateProdInfo(Map<String, Object> paramMap);
	public int updateProdFile(Map<String, Object> paramMap);
}
