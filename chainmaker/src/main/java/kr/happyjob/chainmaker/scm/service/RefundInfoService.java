package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.RefundVO;


public interface RefundInfoService {

	//혜원담당
	
	public List<RefundVO> selectRefundList(Map<String, Object> paramMap) throws Exception;
	
	/*public int countListUser(Map<String, Object> paramMap) throws Exception;
	public UserInfoModel detailUser(Map<String, Object> paramMap) throws Exception;
	
	public int updateUser(Map<String, Object> paramMap) throws Exception;
	public int deleteUser(Map<String, Object> paramMap) throws Exception;
	public int insertUser(Map<String, Object> paramMap) throws Exception;
	
	public List<UserInfoModel> listChaCD(Map<String, Object> paramMap) throws Exception;*/

	public int refundListCnt(Map<String, Object> paramMap);

	public List<RefundVO> selectedRefundList(Map<String, Object> paramMap);
	
	public int selectedRefundCnt(Map<String, Object> paramMap);
	
	
}
