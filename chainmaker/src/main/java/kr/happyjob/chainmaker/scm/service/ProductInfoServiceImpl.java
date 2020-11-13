package kr.happyjob.chainmaker.scm.service;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.chainmaker.common.comnUtils.FileUtil;
import kr.happyjob.chainmaker.common.comnUtils.FileUtilModel;
import kr.happyjob.chainmaker.common.comnUtils.NewFileUtil;
import kr.happyjob.chainmaker.scm.dao.ProductInfoDao;
import kr.happyjob.chainmaker.scm.model.DetailCdVO;
import kr.happyjob.chainmaker.scm.model.FileModel;
import kr.happyjob.chainmaker.scm.model.ProductInfoModel;

@Transactional
@Service
public class ProductInfoServiceImpl implements ProductInfoService {

	@Autowired
	ProductInfoDao dao;
	
	// Root path for file upload 
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	@Value("${fileUpload.prducimage}")
	private String prducimage;	
	
	
	@Override
	public List<ProductInfoModel> selectProductInfo(Map<String, Object> paramMap) {
		List<ProductInfoModel> list = dao.selectProductInfo(paramMap);
		return list;
	}
	
	@Override
	public List<DetailCdVO> selectDetailCode() {
		List<DetailCdVO> list = dao.selectDetailCode();
		return list;
	}
	
	@Override
	public int countProductInfo() {
		int count = dao.countProductInfo();
		return count;
	}

	@Override
	public ProductInfoModel selectProductDetail(Map<String, Object> paramMap) {
		ProductInfoModel detail = dao.selectProductDetail(paramMap);
		return detail;
	}

	@Override
	public boolean insertProduct(Map<String, Object> paramMap, MultipartHttpServletRequest request) {
		
		String itemFilePath = prducimage + File.separator; // 파일 구분자(os별로 다르기 때문에 java에서 자동 적용)
		
		NewFileUtil fileUtil = new NewFileUtil(request, rootPath, itemFilePath); //request와 파일저장루트, 디렉토리루트 전달
		
		List<FileModel> fileInfo = null;
		try {
			fileInfo = fileUtil.uploadFiles();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Iterator<FileModel> iter = fileInfo.iterator();
		String file_fname = "";
		String file_ofname = "";
		int file_size = 0;
		
		while(iter.hasNext()) {
			FileModel tempFileInfo = (FileModel)iter.next();
			file_fname = rootPath+tempFileInfo.getFile_fname();
			file_ofname = tempFileInfo.getFile_ofname();
			file_size = tempFileInfo.getFile_size();
		}
		//쿼리 파라미터 값 넣기
		paramMap.put("file_fname", file_fname);
		paramMap.put("file_ofname", file_ofname);
		paramMap.put("file_size", file_size);
		
		dao.insertProdInfo(paramMap);
		dao.insertProdFile(paramMap);
		
		return true;
				
		
	}

	@Override
	public boolean deleteProduct(Map<String, Object> paramMap) {
		int flag = dao.deleteProdInfo(paramMap);
		int flag2 = dao.deleteProdFile(paramMap);

		return true;
	}

	@Override
	public boolean updateProduct(Map<String, Object> paramMap, MultipartHttpServletRequest request) {
	
		
		return true;
	}



}
