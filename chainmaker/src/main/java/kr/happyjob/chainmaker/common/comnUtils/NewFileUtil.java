package kr.happyjob.chainmaker.common.comnUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.chainmaker.scm.model.FileModel;

/**
 * 
 * @author edit by.som
 *
 */
public class NewFileUtil {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
		
	// MultipartHttpServletRequest
	private MultipartHttpServletRequest multipartHttpServletRequest;
	
	// root file path
	private String rootFilePath;
	
	// item file path
	private String itemFilePath;	
	
	
	// 이미지 파일 허용 확장자
	@Value("${image.allow.ext}")
	private String allowExt;
	
	
	
	
	public NewFileUtil(MultipartHttpServletRequest multipartHttpServletRequest, String rootFilePath,
			String itemFilePath) {
		super();
		this.multipartHttpServletRequest = multipartHttpServletRequest;
		this.rootFilePath = rootFilePath;
		this.itemFilePath = itemFilePath;
	}

	/** 
	 * 파일 업로드 
	 * @return 저장된 파일 메타 정보
	 */
	public List<FileModel> uploadFiles() throws Exception {
		
		logger.info("   - uploadFiles() started ");
		
		// Return value
		List<FileModel> listFileUtilModel = new ArrayList<FileModel>();
		
		// 디렉토리 생성
		makeDir();
        
        Iterator<String> files = multipartHttpServletRequest.getFileNames();
        
        while(files.hasNext()){
        	
            String uploadFile = files.next();

            MultipartFile multipartFile = multipartHttpServletRequest.getFile(uploadFile);
            String fileDvsCod = multipartFile.getName();
            logger.info("   - fileDvsCod : " + fileDvsCod);

            if (!multipartFile.isEmpty()) {
            	
            	FileModel fileModel = new FileModel();
            
            	String fileName = multipartFile.getOriginalFilename(); // a.jpg
                String fileExtension = fileName.substring(fileName.lastIndexOf(".")+1); //jpg
                String tmpFileName = File.separator + itemFilePath + fileName; // /product/a.jpg
                int fileSize = (int)multipartFile.getSize(); // 532

                File orgFile = new File(rootFilePath+tmpFileName); // /user/filedirectory/product/a.jpg
                logger.info("   - tempFilePath : " + rootFilePath+tmpFileName);
                multipartFile.transferTo(orgFile);
                /*
                 * 11/12 20:52 renameOfFile때문에 파일 업로드가 안됬으니꼭 살펴볼것!!!!!!!!!!!!!!!!
                 * 중복 해결할것!!!!!!
                 */
                //String newFileName = renameOfFile(orgFile, fileName);
                //String newFilePath = File.separator + itemFilePath+newFileName;
                logger.info("   - originalFileName : " + fileName);
                logger.info("   - fileExtension : " + fileExtension);
                fileModel.setFile_ofname(fileName);
                fileModel.setFile_fname(rootFilePath+tmpFileName);
                fileModel.setFile_exts(fileExtension);
                fileModel.setFile_size(fileSize);
                
                
                listFileUtilModel.add(fileModel);
                
            }
        }
        logger.info("   - uploadFiles() finished ");
        return listFileUtilModel;
	}	
	
	/** 
	 * 이미지 파일만 업로드 
	 * @return 저장된 파일 메타 정보
	 * @author som
	 */
	public List<FileModel> uploadImgs() throws Exception {
		
		logger.info("   - uploadFiles() started ");
		
		// Return value
		List<FileModel> listFileUtilModel = new ArrayList<FileModel>();
		
		// 디렉토리 생성
		makeDir();
        
        Iterator<String> files = multipartHttpServletRequest.getFileNames();
        
        while(files.hasNext()){
        	
            String uploadFile = files.next();

            MultipartFile multipartFile = multipartHttpServletRequest.getFile(uploadFile);
            String fileDvsCod = multipartFile.getName();
            logger.info("   - fileDvsCod : " + fileDvsCod);

            if (!multipartFile.isEmpty()) {
            	
            	FileModel fileModel = new FileModel();
            
            	String fileName = multipartFile.getOriginalFilename();
                String fileExtension = fileName.substring(fileName.lastIndexOf(".")+1);
                
                String tmpFileName = itemFilePath + fileName;
                String newFileName = tmpFileName;
                int fileSize = (int)multipartFile.getSize();
                logger.info("   - originalFileName : " + fileName);
                logger.info("   - fileExtension : " + fileExtension);
                logger.info("   - newFileName : " + newFileName);
                fileModel.setFile_ofname(fileName);
                fileModel.setFile_fname(newFileName);
                fileModel.setFile_exts(fileExtension);
                fileModel.setFile_size(fileSize);
                
                
                listFileUtilModel.add(fileModel);
                
                File orgFile = new File(rootFilePath+newFileName);
                multipartFile.transferTo(orgFile);
                
            }
        }
        logger.info("   - uploadFiles() finished ");
        return listFileUtilModel;
	}	
	

	
	/**
	 * 파일 삭제
	 * @param listFileUtilModel
	 * @param uploadFilePath
	 * @throws Exception
	 */
	public void deleteFiles(List<FileUtilModel> listFileUtilModel, String rootFilePath) throws Exception {
		
		this.rootFilePath = rootFilePath;
		deleteFiles(listFileUtilModel);
	}
	
	/**
	 * 파일 삭제
	 * @param listFileUtilModel
	 * @throws Exception
	 */
	public void deleteFiles(List<FileUtilModel> listFileUtilModel) throws Exception {
		
		if (listFileUtilModel != null) {
			for(FileUtilModel fileUtilModel : listFileUtilModel) {
				
				// 원본 파일 삭제
				String pscFilNm = fileUtilModel.getPsc_fil_nm();
				if (pscFilNm != null && !"".equals(pscFilNm)) {
					File file = new File(rootFilePath + pscFilNm);
					if (file.exists()) file.delete();
				}
				
				// 썸네일 파일 삭제
				String smlPscFilNm = fileUtilModel.getSml_psc_fil_nm();
				if (smlPscFilNm != null && !"".equals(smlPscFilNm)) {
					File file = new File(rootFilePath + smlPscFilNm);
					if (file.exists()) file.delete();
				}
			}
		}
	}	
	
	

	/**
	 * 파일명 랜덤 생성
	 * @param File file, String OriginalName
	 * @throws Exception
	 */
    private	String renameOfFile(File file, String originalName) throws Exception{
        // uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
        UUID uuid = UUID.randomUUID();
        // 랜덤생성+파일이름 저장
        String newFileName = uuid.toString()+"_"+originalName;
        File newFile = new File(newFileName);
        if( file.exists() ) {
        	file.renameTo( newFile );
        	return newFileName;
        }
        return null;
        
    }
    
	/**
	 * 디렉토리 생성
	 */
	private void makeDir() {
		
        // 디렉토리 파일 객체 생성
		String uploadFilePath = rootFilePath + itemFilePath;
        File file = new File(uploadFilePath);

        // 경로 생성
        if(!file.isDirectory()){
        	file.mkdirs();
        }
	}    
    

}
