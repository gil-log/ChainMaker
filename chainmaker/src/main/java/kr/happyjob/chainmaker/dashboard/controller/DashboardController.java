package kr.happyjob.chainmaker.dashboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.supportD.model.NoticeDModel;
import kr.happyjob.chainmaker.supportD.service.NoticeDService;

@Controller
public class DashboardController {
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	@RequestMapping("/dashboard/dashboard.do")
	public String initDashboard(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		
		logger.info("+ Start " + className + ".initDashboard");
		/* ############## set input data################# */
		paramMap.put("loginId", session.getAttribute("loginId")); // 제목
		paramMap.put("userType", session.getAttribute("userType")); // 오피스 구분 //
																	// 코드
		paramMap.put("reg_date", session.getAttribute("reg_date")); // 등록 일자
		logger.info("   - paramMap : " + paramMap);

		String returnType = "/dashboard/dashboardMgr";

		logger.info("+ end " + className + ".initDashboard");

		return returnType;
	}



}
