package kr.happyjob.chainmaker.login.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.login.model.LgnInfoModel;
import kr.happyjob.chainmaker.login.model.UsrMnuAtrtModel;
import kr.happyjob.chainmaker.login.model.UsrMnuChildAtrtModel;

public interface LoginDao {
	
	/** 사용자 로그인 체크*/
	public String checkLogin(Map<String, Object> paramMap);
	
	/** 사용자 로그인 */
	public LgnInfoModel selectLogin(Map<String, Object> paramMap);
	
	/**  사용자 메뉴 권한 */
	public List<UsrMnuAtrtModel> listUsrMnuAtrt(Map<String, Object> paramMap);
	
	/**  사용자 자식 메뉴 권한 */
	public List<UsrMnuChildAtrtModel> listUsrChildMnuAtrt(Map<String, Object> paramMap);
	
	/** 사용자 ID 찾기 */
	public LgnInfoModel selectFindId(Map<String, Object> paramMap);

	/** 사용자 PW 찾기 */
	public LgnInfoModel selectFindPw(Map<String, Object> paramMap);


	
}
