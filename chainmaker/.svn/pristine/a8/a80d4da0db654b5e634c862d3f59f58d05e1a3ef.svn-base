package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import kr.happyjob.chainmaker.scm.model.FileModel;
import kr.happyjob.chainmaker.scm.model.NoticeModel;

public interface NoticeService {

	public List<NoticeModel> noticeList(Map<String, Object> paramMap) throws Exception;

	public int noticeTotalCnt(Map<String, Object> paramMap) throws Exception;

	public NoticeModel detailNotice(Map<String, Object> paramMap) throws Exception;

	public int insertNotice(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;

	public int updateNotice(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;

	public int deleteNotice(Map<String, Object> paramMap) throws Exception;

	//파일 조회
	public FileModel selectFile(Map<String, Object> paramMap) throws Exception;

}
