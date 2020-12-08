package kr.happyjob.chainmaker.scm.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.chainmaker.common.comnUtils.AbsolutePath;
import kr.happyjob.chainmaker.common.comnUtils.FileUtil;
import kr.happyjob.chainmaker.common.comnUtils.FileUtilModel;
import kr.happyjob.chainmaker.common.comnUtils.NewFileUtil;
import kr.happyjob.chainmaker.scm.dao.ProductInfoDao;
import kr.happyjob.chainmaker.scm.model.DeliveryModel;
import kr.happyjob.chainmaker.scm.model.DetailCdVO;
import kr.happyjob.chainmaker.scm.model.FileModel;
import kr.happyjob.chainmaker.scm.model.ProductInfoModel;
import kr.happyjob.chainmaker.scm.model.WHInventoryFormModel;


@Service
public class ProductInfoServiceImpl implements ProductInfoService {

	@Autowired
	ProductInfoDao dao;
	
	// Root path for file upload 
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	// Virtual Root Path for file upload (Web Module)
	@Value("${fileUpload.virtualRootPath}")
	private String virtualRootPath;
	
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
	public List<WHInventoryFormModel> selectWareHouse() {
		List<WHInventoryFormModel> list = dao.selectWareHouse();
		return list;
	}
	
	@Override
	public List<DeliveryModel> selectDelivery() {
		List<DeliveryModel> list = dao.selectDelivery();
		return list;
	}
	
	@Override
	public int countProductInfo(Map<String, Object> paramMap) {
		int count = dao.countProductInfo(paramMap);
		return count;
	}

	@Override
	public List<ProductInfoModel> selectProductDetail(Map<String, Object> paramMap) {
		List<ProductInfoModel> detail = dao.selectProductDetail(paramMap);
		return detail;
	}
	
	@Transactional
	@Override
	public boolean insertProduct(Map<String, Object> paramMap, HttpServletRequest request) {
		
		String itemFilePath = prducimage + File.separator; // 파일 구분자(os별로 다르기 때문에 java에서 자동 적용)
		
		NewFileUtil fileUtil = new NewFileUtil(request, rootPath, virtualRootPath, itemFilePath); //request와 파일저장루트, 디렉토리루트 전달
		
		List<FileModel> fileInfo = null;
		try {
			fileInfo = fileUtil.uploadFiles();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Iterator<FileModel> iter = fileInfo.iterator();

		String file_server_path = "";	
		String file_local_path = "";
		String file_new_name = "";
		String file_ofname = "";
		int file_size = 0;
		
		//단일 파일 업로드 이므로 1번만 돌아감
		while(iter.hasNext()) {
			FileModel tempFileInfo = (FileModel)iter.next();
			file_server_path = tempFileInfo.getFile_server_path();
			file_local_path = tempFileInfo.getFile_local_path();
			file_new_name = tempFileInfo.getFile_new_name();
			file_ofname = tempFileInfo.getFile_ofname();
			file_size = tempFileInfo.getFile_size();
		}
		//쿼리 파라미터 값 넣기
		paramMap.put("file_server_path", file_server_path);
		paramMap.put("file_local_path", file_local_path);
		paramMap.put("file_new_name", file_new_name);
		paramMap.put("file_ofname", file_ofname);
		paramMap.put("file_size", file_size);
		
		dao.insertProdInfo(paramMap);
		dao.insertProdFile(paramMap);
		dao.insertProdWareHouse(paramMap);
		
		return true;
				
		
	}
	@Transactional
	@Override
	public boolean deleteProduct(Map<String, Object> paramMap, HttpServletRequest request) {
		
		List<FileModel> listFileUtilModel = new ArrayList<FileModel>(); //빈 리스트 생성 (한번에 많은 파일 삭제 대비용으로)
		String itemFilePath = prducimage + File.separator; //
		NewFileUtil fileUtil = new NewFileUtil(request, rootPath, virtualRootPath, itemFilePath);
		FileModel fModel = dao.selectFileInfo(paramMap);
		listFileUtilModel.add(fModel);
		try {
			fileUtil.deleteFiles(listFileUtilModel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int flag = dao.deleteProdInfo(paramMap);
		int flag2 = dao.deleteProdFile(paramMap);
		return true;
	}

	@Override
	public boolean updateProduct(Map<String, Object> paramMap, HttpServletRequest request) {
	
		
		return true;
	}



}
