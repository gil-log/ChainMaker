package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;


import kr.happyjob.chainmaker.scm.model.RefundInsVO;

public interface RefundInsService {

	public List<RefundInsVO> refundInsList(Map<String, Object> paramMap) throws Exception;

	public int refundInsTotalCnt(Map<String, Object> paramMap) throws Exception;

}
