package kr.happyjob.chainmaker.login.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.login.model.LgnInfoModel;
import kr.happyjob.chainmaker.login.model.UsrMnuAtrtModel;
import kr.happyjob.chainmaker.login.model.UsrMnuChildAtrtModel;



public interface LoginService {
	
	/** 사용자 로그인 체크*/
	public String checkLogin(Map<String, Object> paramMap) throws Exception;
	
	/** 사용자 로그인 */
	public LgnInfoModel loginProc(Map<String, Object> paramMap) throws Exception;
	
	/** 사용자 메뉴 권한 */
	public List<UsrMnuAtrtModel> listUsrMnuAtrt(Map<String, Object> paramMap) throws Exception;
	
	/**  사용자 자식 메뉴 권한 */
	public List<UsrMnuChildAtrtModel> listUsrChildMnuAtrt(Map<String, Object> paramMap) throws Exception;
	
	/** 사용자 회원가입*/
	public int registerUser(Map<String, Object> paramMap) throws Exception;
	
	/*loginID 중복체크*/
	public int check_loginID(LgnInfoModel model) throws Exception;
	
	/*이메일 중복체크*/
	public int check_email(LgnInfoModel model) throws Exception;
	
	/** 사용자 ID 찾기 */
	public LgnInfoModel selectFindId(Map<String, Object> paramMap) throws Exception;

	/** 사용자 PW 찾기 */
	public LgnInfoModel selectFindPw(Map<String, Object> paramMap) throws Exception;
	
	/** 사용자 PW 찾기 ID 체크*/
	public LgnInfoModel registerIdCheck(Map<String, Object> paraMap) throws Exception;
	
	/** select 박스 은행 목록*/
	List<LgnInfoModel> selectBankList();

}
