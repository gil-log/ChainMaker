package kr.happyjob.chainmaker.epc.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.epc.dao.MyPageDAO;
import kr.happyjob.chainmaker.epc.model.MyPageDTO;


@Service
public class MyPageServiceImpl implements MyPageService {
	
	
	@Autowired
	MyPageDAO myPageDao;
	

	//상세 정보 조회
		@Override
		public MyPageDTO detailUser(Map<String, Object> paramMap) throws Exception {
			MyPageDTO detailUser = myPageDao.detailUser(paramMap);
			
			return detailUser;
		}
	
		//회원 정보 업데이트
		
		@Override
		public int upUser(Map<String, Object> paramMap) throws Exception {
			
			int resultCnt = myPageDao.upUser(paramMap);
			
			return resultCnt;
		}
	
		//del 업데이트
		
		@Override
		public int delUser(Map<String, Object> paramMap) throws Exception {
					
			int resultCnt = myPageDao.delUser(paramMap);
					
			return resultCnt;
		}
		
	
}