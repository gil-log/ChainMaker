package kr.happyjob.chainmaker.epc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/epc/refundrequest.do")
public class RefundRequestController {
	
	@RequestMapping(value="")
	public String getRefundRequestPage() {
		String viewLocation = "/epc/refundRequest";
		return viewLocation;
	}

}
