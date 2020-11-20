package kr.happyjob.chainmaker.scm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.DeliveryModel;
import kr.happyjob.chainmaker.scm.model.DetailCdVO;
import kr.happyjob.chainmaker.scm.model.FileModel;
import kr.happyjob.chainmaker.scm.model.ProductInfoModel;
import kr.happyjob.chainmaker.scm.model.WHInventoryFormModel;

public interface ProductInfoDao {
	
	public List<ProductInfoModel> selectProductInfo(Map<String, Object> paramMap);
	public List<DetailCdVO> selectDetailCode();
	public List<WHInventoryFormModel> selectWareHouse();
	public List<DeliveryModel> selectDelivery();
	public int countProductInfo(Map<String, Object> paramMap);
	public List<ProductInfoModel> selectProductDetail(Map<String, Object> paramMap);
	public FileModel selectFileInfo(Map<String, Object> paramMap);
	public int insertProdInfo(Map<String, Object> paramMap);
	public int insertProdFile(Map<String, Object> paramMap);
	public int insertProdWareHouse(Map<String, Object> paramMap);
	public int deleteProdFile(Map<String, Object> paramMap);
	public int deleteProdInfo(Map<String, Object> paramMap);
	public int updateProdInfo(Map<String, Object> paramMap);
	public int updateProdFile(Map<String, Object> paramMap);
}
