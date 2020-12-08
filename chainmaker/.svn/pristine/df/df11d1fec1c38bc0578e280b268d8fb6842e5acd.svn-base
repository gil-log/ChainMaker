package kr.happyjob.chainmaker.login.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*import kr.happyjob.chainmaker.common.comnUtils.AESCryptoHelper;
import kr.happyjob.chainmaker.common.comnUtils.ComnUtil;*/
import kr.happyjob.chainmaker.login.dao.LoginDao;
import kr.happyjob.chainmaker.login.model.LgnInfoModel;
import kr.happyjob.chainmaker.login.model.UsrMnuAtrtModel;
import kr.happyjob.chainmaker.login.model.UsrMnuChildAtrtModel;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private LoginDao loginDao;
	
	/** 사용자 로그인 체크*/
	public String checkLogin(Map<String, Object> paramMap) throws Exception {
		return loginDao.checkLogin(paramMap);
	}
	
	/** 사용자 로그인 */
	public LgnInfoModel loginProc(Map<String, Object> paramMap) throws Exception {
		String password = paramMap.get("pwd").toString();
		
		//logger.info(" login before password : " + password);
		//AES 방식 암호화
		//password = AESCryptoHelper.encode( ComnUtil.AES_KEY, password);
		
		//logger.info(" login after password : " + password);
		paramMap.put("pwd", password);
		return loginDao.selectLogin(paramMap);
	}
	
	
	/**  사용자 메뉴 권한 */
	public List<UsrMnuAtrtModel> listUsrMnuAtrt(Map<String, Object> paramMap) throws Exception {	
		return loginDao.listUsrMnuAtrt(paramMap);
	}
	

	/**  사용자 자식 메뉴 권한 */
	public List<UsrMnuChildAtrtModel> listUsrChildMnuAtrt(Map<String, Object> paramMap) throws Exception{
		return loginDao.listUsrChildMnuAtrt(paramMap);

	}
	
	/**사용자 회원가입*/
	@Override
	public int registerUser(Map<String, Object> paramMap) throws Exception {
		int ret = loginDao.registerUser(paramMap);
		return ret;
	}
	
	/**loginID 중복체크*/
	@Override
	public int check_loginID(LgnInfoModel model) throws Exception {
		int result = loginDao.check_loginID(model);
		return result;
	}
	
	@Override
	public int check_email(LgnInfoModel model) throws Exception {
		int result = loginDao.check_email(model);
		return result;
	}

	/** 사용자 ID 찾기 */
	public LgnInfoModel selectFindId(Map<String, Object> paramMap) throws Exception{
		System.out.println(loginDao.selectFindId(paramMap));
		return loginDao.selectFindId(paramMap);
	}

	/** 사용자 PW 찾기 */
	public LgnInfoModel selectFindPw(Map<String, Object> paramMap) throws Exception{
/*		String password = paramMap.get("pwd").toString();
		//AES 방식 암호화
		password = AESCryptoHelper.encode( ComnUtil.AES_KEY, password);
		paramMap.put("pwd", password);*/
		return loginDao.selectFindPw(paramMap);
	}
	/** 사용자 PW 찾기 ID 체크*/
	@Override
	public LgnInfoModel registerIdCheck(Map<String, Object> paramMap) throws Exception {
	
		return loginDao.registerIdCheck(paramMap);
	}

	/** select박스 은행 목록*/
	@Override
	public List<LgnInfoModel> selectBankList() {
		List<LgnInfoModel> list = loginDao.selectBankList();
		return list;
	}

	

	


}
