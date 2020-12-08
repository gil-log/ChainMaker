package kr.happyjob.chainmaker.epc.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.epc.model.MyPageDTO;

public interface MyPageService {
	
	public MyPageDTO detailUser(Map<String, Object> paramMap) throws Exception;
	
	public int upUser(Map<String, Object> paramMap) throws Exception;

	public int delUser(Map<String, Object> paramMap) throws Exception;
}
