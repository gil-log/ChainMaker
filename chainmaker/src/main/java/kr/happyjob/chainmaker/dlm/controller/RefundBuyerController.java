package kr.happyjob.chainmaker.dlm.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.happyjob.chainmaker.scm.service.WHInventoryFormService;

@Controller
@RequestMapping("/dlm/")
public class RefundBuyerController {

	//Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	//Get class name for logger
	private final String className = this.getClass().toString();
		
	
	//기업고객(발주 지시서 목록)_배송담당자
	@RequestMapping("refundBuyer.do")
	public String whInventoryForm(){
		logger.info("기업고객_반품  지시서 목록_배송담당자 페이지");
		
		return "dlm/refundBuyer";
	}
}
