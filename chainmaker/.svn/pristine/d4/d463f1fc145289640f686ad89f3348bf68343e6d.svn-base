package kr.happyjob.chainmaker.dashboard.InfService;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.dashboard.dao.DashInfDao;
import kr.happyjob.chainmaker.dashboard.model.InfModel;
import kr.happyjob.chainmaker.scm.model.FileModel;

@Service
public class infServiceImpl implements  InfService {

	private static final DashInfDao InfDao = null;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	DashInfDao infDao;
	
	/** 1:1문의 목록 조회 */
	public List<InfModel> listInf(Map<String, Object> paramMap) throws Exception {
		
		List<InfModel> istInf = infDao.listInf(paramMap);
		
		return istInf;
	}
	
	/** 1:1문의 목록 카운트 조회 */
	public int countListInf(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = infDao.countListInf(paramMap);
		
		return totalCount;
	}

	@Override
	public InfModel selectInfByInfNo(int notice_no) throws Exception {
			
		return infDao.selectInfByInfNo(notice_no);
	}
	
	// 파일정보 가져오기
	public FileModel selectFile(Map<String, Object> paramMap)throws Exception {
		FileModel selectFile = infDao.selectFile(paramMap);
		return selectFile;
	}
}

