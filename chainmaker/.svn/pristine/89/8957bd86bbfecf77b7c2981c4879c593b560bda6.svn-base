package kr.happyjob.chainmaker.pcm.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.pcm.model.ReturnOrderModel;
import kr.happyjob.chainmaker.pcm.service.ReturnOrderService;

@Controller
@RequestMapping("/pcm/")
public class ReturnOrderController {

	//Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	//Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	private ReturnOrderService returnOrderService;
	
	@RequestMapping("returnOrder.do")
	public String purchaseOrder(){
		logger.info("구매담당자 - 제품 반품 목록");
		
		return "pcm/returnOrder";
	}
	
	//구매담당자_반품 지시서 목록 조회
	@RequestMapping("returnOrderList.do")
	public String returnOrderList(Model model, @RequestParam Map<String, Object> paramMap){		
		logger.info("구매담당자 - 제품 반품 목록 => 데이터 전송 // returnOrderList.do");
		logger.info("paramMap : "+paramMap);
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		
		//DB의 목록 list에 담아 returnOrderList.jsp로 전달
		List<ReturnOrderModel> listReturnOrder=returnOrderService.returnOrderList(paramMap);
				
		model.addAttribute("listReturnOrder", listReturnOrder);
		
		//DB목록의 total row를 담아 returnOrderList.jsp로 전달
		int returnOrderTotal=returnOrderService.countReturnOrderList(paramMap);
		logger.info("returnOrderList.do ==> listReturnOrder");
		logger.info(listReturnOrder);
		
		
		//페이지 네비게이션 정보
		model.addAttribute("returnOrderTotal", returnOrderTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageReturnOrderList", currentPage);
		
		return "/pcm/returnOrderList";
	}
	
	//구매담당자_발주 지시서 목록 단건 조회
	@RequestMapping("returnOrderSelect.do")
	@ResponseBody
	public Map<String,Object> returnOrderSelect(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("구매담당자 - 제품 반품 단품 목록 => 데이터 전송 // returnOrderSelect.do");		
		logger.info("paramMap : "+paramMap);		

		Map<String, Object> resultMap = new HashMap<>();
				
		ReturnOrderModel returnOrderModel = returnOrderService.returnOrderSelect(paramMap);
		logger.info("returnOrderModel : "+returnOrderModel.toString());
		
		resultMap.put("returnOrderModel", returnOrderModel);		
		
		logger.info("returnOrderSelect.do ==> resultMap.returnOrderModel");
		logger.info(resultMap.get("returnOrderModel").toString());
		
		return resultMap;
	}
	
	//발주서 전송(email)
	@RequestMapping("sendRefund.do")
	@ResponseBody
	public String sendPurchase(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("반품지시서 메일 전송");
		
		ReturnOrderModel returnOrderDtl = returnOrderService.returnOrderSelect(paramMap);
		logger.info("returnOrderDtl : "+returnOrderDtl);		
		
		String result=RegisterFindIdEmailSend(returnOrderDtl);
		returnOrderService.updateRefundCD(paramMap);
		return result;
	}	
	// 메일 전송 메서드
	public String RegisterFindIdEmailSend(ReturnOrderModel returnOrderDtl) {
		logger.info("RegisterFindIdEmailSend => returnOrderDtl");
		logger.info(returnOrderDtl.toString());
		
		String host = "smtp.gmail.com";
		final String username = "yoodh9044@gmail.com";
		final String password = "aielgmhtsuizbuem";
		int port = 465;
		String authNum = null;

		Properties props = System.getProperties();

		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", true);
		props.put("mail.smtp.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true);

		try {
			MimeMessage message = new MimeMessage(session);
			try {
				message.setFrom(new InternetAddress("yoodh9044@gmail.com", "ChainMaker 발주 지시서 입니다.", "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			// 메일 받는 사람
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(returnOrderDtl.getDeli_email()));

			// 메일 제목
			message.setSubject("ChainMaker 반품 지시서 전송");

			// 메일 내용			
			authNum = "@@@ Send Refund Direction @@@";
			
			message.setText(returnOrderDtl.toString());
			Transport.send(message);
			System.out.println("전송완료");

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return authNum;
	}
}

