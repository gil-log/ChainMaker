package kr.happyjob.chainmaker.cmnt.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.chainmaker.cmnt.dao.CmntBbsDao;
import kr.happyjob.chainmaker.cmnt.model.CmntBbsAtmtFilModel;
import kr.happyjob.chainmaker.cmnt.model.CmntBbsCmtModel;
import kr.happyjob.chainmaker.cmnt.model.CmntBbsModel;
import kr.happyjob.chainmaker.common.comnUtils.FileUtil;
import kr.happyjob.chainmaker.common.comnUtils.FileUtilModel;

@Service
public class CmntBbsServiceImpl implements CmntBbsService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();

	// Root path for file upload 
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	// office path for file upload
	@Value("${fileUpload.officePath}")
	private String officePath;
	
	// comment path for file upload
	@Value("${fileUpload.bbsPath}")
	private String bbsPath;
	
	// thumbnail 파일 width
	@Value("${image.resize.with}")
	private int thumWidth;
	
	// 이미지 파일 허용 확장자
	@Value("${image.allow.ext}")
	private String allowExt;
	
	@Autowired
	CmntBbsDao cmntBbsDao;
	
	/** 게시글 목록 조회 */
	public List<CmntBbsModel> listCmntBbs(Map<String, Object> paramMap) throws Exception {
		
		List<CmntBbsModel> listCmnt = cmntBbsDao.listCmntBbs(paramMap);
		for (CmntBbsModel bbsCmtModel : listCmnt) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("bbs_id", bbsCmtModel.getBbs_id());
			// 게시글 첨부파일 조회
			List<CmntBbsAtmtFilModel> listBbsCmtAtmtFilModel = listCmntBbsAtmtFil(map);
			bbsCmtModel.setListBbsCmtAtmtFilModel(listBbsCmtAtmtFilModel);
		}
		return listCmnt;
	}

	/** 게시글 목록 카운트 조회 */
	public int countListBbs(Map<String, Object> paramMap) throws Exception{
		int totalCount = cmntBbsDao.countListBbs(paramMap);
		return totalCount;
	}
	
	/** 게시글 단건 조회 */
	public CmntBbsModel selectCmntBbs(Map<String, Object> paramMap) throws Exception {
		CmntBbsModel CmntModel = cmntBbsDao.selectCmntBbs(paramMap);
		if(paramMap.get("mode").toString().equals("1")){ //단순 게시물 읽기기에만 조회건수 +1 
			updateCmntBbsVews(paramMap); //조회 건수 update;
		}
		
		// 게시글 첨부파일 조회
		List<CmntBbsAtmtFilModel> listBbsCmtAtmtFilModel = listCmntBbsAtmtFil(paramMap);
		CmntModel.setListBbsCmtAtmtFilModel(listBbsCmtAtmtFilModel);
		
		return CmntModel;
	}

	/** 게시글 저장 */
	public int insertCmntBbs(Map<String, Object> paramMap, HttpServletRequest  request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;

		int ret = 0;
		
		// 오피스 ID 발번
		String ofc_id = (String)paramMap.get("ofc_id");
		String usr_sst_id = (String)paramMap.get("usr_sst_id");
		
		// 게시글 ID 발번
		String bbs_id = cmntBbsDao.selectBbsID(paramMap);
		paramMap.put("bbs_id", bbs_id);
		
		// 파일 저장
		// ofc_id = 작성자 id , bbs_id = 게시글 id  , 시스템 id  
		String itemFilePath = bbsPath + File.separator + ofc_id + File.separator + bbs_id + File.separator + usr_sst_id + File.separator;
		FileUtil fileUtil = new FileUtil(multipartHttpServletRequest, rootPath, itemFilePath);
		List<FileUtilModel> listFileUtilModel = fileUtil.uploadFiles();
		
		// 데이터 저장
		try {
			//String cnts = (String)paramMap.get("cnts");
			//System.out.println("cnts : "+cnts);
			//cnts = cnts.replaceAll("bbs_id=\\{1\\}", "bbs_id="+bbs_id); //컨텐츠에 저장된 로컬이미지 경로를 서버이미지 경로로 수정
			//System.out.println("cnts2 : "+cnts);
			//paramMap.put("cnts", cnts);
			
			ret = cmntBbsDao.insertCmntBbs(paramMap);//게시글 저장
			// 제작 코멘트 첨부파일 등록 
			for (FileUtilModel fileUtilModel : listFileUtilModel) {
				//논리파일명
				paramMap.put("atmt_fil_lgc_fil_nm", fileUtilModel.getLgc_fil_nm());
				//물리파일명
				paramMap.put("atmt_fil_psc_fil_nm", fileUtilModel.getPsc_fil_nm());
				//사이즈
				paramMap.put("fil_siz", fileUtilModel.getFil_siz());
				//확장자
				paramMap.put("fil_ets", fileUtilModel.getFil_ets());

				// DB 저장
				ret = cmntBbsDao.saveCmntBbsAtmtFil(paramMap);
			}
		} catch(Exception e) {
			// 파일 삭제
			fileUtil.deleteFiles(listFileUtilModel);
			throw e;
		}
		return ret;
	}
	
	/** 게시글 수정 */
	public int updateCmntBbs(Map<String, Object> paramMap, HttpServletRequest  request) throws Exception {
		int ret=0;
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		
		// 오피스 ID 발번
		String ofc_id = (String)paramMap.get("ofc_id");
		String usr_sst_id = (String)paramMap.get("usr_sst_id");
		// 게시글 ID 발번
		String bbs_id = (String)paramMap.get("bbs_id");
		
		// 파일 저장
		String itemFilePath = bbsPath + File.separator + ofc_id + File.separator + bbs_id + File.separator + usr_sst_id + File.separator;
		FileUtil fileUtil = new FileUtil(multipartHttpServletRequest, rootPath, itemFilePath);
		List<FileUtilModel> listFileUtilModel = fileUtil.uploadFiles();

		// 데이터 저장
		try {
			
			ret = cmntBbsDao.updateCmntBbs(paramMap); // 게시글 수정 	
			for (FileUtilModel fileUtilModel : listFileUtilModel) {
				paramMap.put("atmt_fil_lgc_fil_nm", fileUtilModel.getLgc_fil_nm());
				paramMap.put("atmt_fil_psc_fil_nm", fileUtilModel.getPsc_fil_nm());
				paramMap.put("fil_siz", fileUtilModel.getFil_siz());
				paramMap.put("fil_ets", fileUtilModel.getFil_ets());

				// DB 저장
				ret = cmntBbsDao.saveCmntBbsAtmtFil(paramMap);
				
			}
			
			// 첨부파일 삭제
			String cmnt_file_snm = (String)paramMap.get("bbs_file_snm");
			if (cmnt_file_snm != null && !"".equals(cmnt_file_snm)) {

				List<String> listCmtAtmtSnm = new ArrayList<String>();
				
				StringTokenizer st = new StringTokenizer(cmnt_file_snm, ",");
				while(st.hasMoreTokens()) {
					listCmtAtmtSnm.add(st.nextToken());
				}
				
				// 삭제대상 첨부파일 정보 조회
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("bbs_id", paramMap.get("bbs_id"));
				map.put("listCmtAtmtSnm", listCmtAtmtSnm);
				List<CmntBbsAtmtFilModel> listBbsCmtAtmtFilModel = cmntBbsDao.listCmntBbsAtmtFil(map);

				// 파일 삭제 대상 설정
				List<FileUtilModel> listDeleteFile = new ArrayList<FileUtilModel>();
				for(CmntBbsAtmtFilModel bbsCmtAtmtFilModel : listBbsCmtAtmtFilModel) {
					
					FileUtilModel fileUtilModel = new FileUtilModel();
					fileUtilModel.setPsc_fil_nm(bbsCmtAtmtFilModel.getAtmt_fil_psc_fil_nm());
					listDeleteFile.add(fileUtilModel);
				}
				
				// DB 삭제
				ret = cmntBbsDao.deleteCmntBbsAtmtFil(map);

				// 파일 삭제
				fileUtil.deleteFiles(listDeleteFile);
			}

		} catch(Exception e) {
			// 파일 삭제
			fileUtil.deleteFiles(listFileUtilModel);
			throw e;
		}
		return ret;
	}

	/** 게시글 삭제 */
	public int deleteCmntBbs(Map<String, Object> paramMap) throws Exception {
		int ret=0;
		
		try {
			
			// 삭제대상 제작 코멘트 첨부파일 목록 조회
			List<CmntBbsAtmtFilModel> listBbsCmtAtmtFilModel = cmntBbsDao.listCmntBbsAtmtFil(paramMap);
			
			// 제작 코멘트 첨부파일 DB 삭제
			ret = cmntBbsDao.deleteAllCmntBbsAtmtFil(paramMap);
			
			// 제작 코멘트 삭제
			ret = cmntBbsDao.deleteCmntBbs(paramMap);
			
			/* 첨부파일 삭제 */
			// 파일 삭제 대상 설정
			List<FileUtilModel> listDeleteFile = new ArrayList<FileUtilModel>();
			for(CmntBbsAtmtFilModel bbsCmtAtmtFilModel : listBbsCmtAtmtFilModel) {
				
				FileUtilModel fileUtilModel = new FileUtilModel();
				fileUtilModel.setPsc_fil_nm(bbsCmtAtmtFilModel.getAtmt_fil_psc_fil_nm());
				listDeleteFile.add(fileUtilModel);
			}
			
			// 파일 삭제
			FileUtil fileUtil = new FileUtil();
			fileUtil.deleteFiles(listDeleteFile, rootPath);
			
		} catch(Exception e) {
			throw e;
		}
		
		return ret;
	}
	
	/** 게시글 조회수 update */
	public int updateCmntBbsVews(Map<String, Object> paramMap) throws Exception{
		int ret = cmntBbsDao.updateCmntBbsVews(paramMap);
		return ret;
	}

	/** 게시글 첨부 목록 조회 */
	public List<CmntBbsAtmtFilModel> listCmntBbsAtmtFil(Map<String, Object>paramMap){
		List<CmntBbsAtmtFilModel> cmntBbsAtmtFilModel = cmntBbsDao.listCmntBbsAtmtFil(paramMap);
		return cmntBbsAtmtFilModel;
	}
	
	/** 게시글 첨부 단건 조회 */
	public CmntBbsAtmtFilModel selectCmntBbsAtmtFil(Map<String, Object>paramMap) throws Exception{
		CmntBbsAtmtFilModel cmntBbsAtmtFilModel = cmntBbsDao.selectCmntBbsAtmtFil(paramMap);
		return cmntBbsAtmtFilModel;
	}

	/** 게시글 첨부 파일 저장 */
	public int saveCmntBbsAtmtFil(Map<String, Object>paramMap) throws Exception{
		int ret = cmntBbsDao.saveCmntBbsAtmtFil(paramMap);
		return ret;
	}
	
	/** 게시글 첨부 파일 수정 */
	public int updateCmntBbsAtmtFil(Map<String, Object>paramMap) throws Exception{
		int ret = cmntBbsDao.updateCmntBbsAtmtFil(paramMap);
		return ret;
	}

	/** 게시글 첨부 파일 단건 삭제 */
	public int deleteCmntBbsAtmtFil(Map<String, Object>paramMap) throws Exception{
		int ret = cmntBbsDao.deleteCmntBbsAtmtFil(paramMap);
		return ret;
	}
	
	/** 게시글 첨부 파일 일괄 삭제 */
	public int deleteAllCmntBbsAtmtFil(Map<String, Object>paramMap) throws Exception{
		int ret = cmntBbsDao.deleteAllCmntBbsAtmtFil(paramMap);
		return ret;
	}
	
	/** 댓글 조회 */
	public List<CmntBbsCmtModel> listBbsCmt(Map<String, Object> paramMap) throws Exception{
		List<CmntBbsCmtModel> listCmt = cmntBbsDao.listBbsCmt(paramMap);
		return listCmt;
	}
	
	/** 댓글 저장 */
	public int insertBbsCmt(Map<String, Object> paramMap) throws Exception{
		int ret = cmntBbsDao.insertBbsCmt(paramMap);
		return ret;
	}
	
	/** 댓글 삭제 */
	public int deleteBbsCmt(Map<String, Object> paramMap) throws Exception{
		int ret = cmntBbsDao.deleteBbsCmt(paramMap);
		return ret;
	}
}
