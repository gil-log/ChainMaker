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

import kr.happyjob.chainmaker.pcm.model.PurchaseOrderModel;
import kr.happyjob.chainmaker.pcm.model.ReturnPurchaseModel;
import kr.happyjob.chainmaker.pcm.service.ReturnPurchaseService;

@Controller
@RequestMapping("/pcm/")
public class ReturnPurchseController {

	//Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	//Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	private ReturnPurchaseService returnPurchaseService;
	
	@RequestMapping("returnPurchase.do")
	public String returnPurchase(){
		logger.info("구매담당자 - 제품 반품 목록");
		
		return "pcm/returnPurchase";
	}
	
	//구매담당자_반품 지시서 목록 조회
	@RequestMapping("returnPurchaseList.do")
	public String returnPurchaseList(Model model, @RequestParam Map<String, Object> paramMap){		
		logger.info("구매담당자 - 제품 반품 목록 => 데이터 전송 // returnPurchaseList.do");
		logger.info("paramMap : "+paramMap);
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		
		logger.info("paramMap : "+paramMap);
		//DB의 목록 list에 담아 returnPurchaseList.jsp로 전달
		List<ReturnPurchaseModel> listReturnPurchase=returnPurchaseService.returnPurchaseList(paramMap);
				
		model.addAttribute("listReturnPurchase", listReturnPurchase);
		
		//DB목록의 total row를 담아 returnPurchaseList.jsp로 전달
		int returnPurchaseTotal=returnPurchaseService.countReturnPurchaseList(paramMap);
		logger.info("returnPurchaseList.do ==> listReturnPurchase");
		logger.info(listReturnPurchase);
		
		
		//페이지 네비게이션 정보
		model.addAttribute("returnPurchaseTotal", returnPurchaseTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageReturnPurchaseList", currentPage);
		
		return "/pcm/returnPurchaseList";
	}
	
	//구매담당자_발주 지시서 목록 단건 조회
	@RequestMapping("returnPurchaseSelect.do")
	@ResponseBody
	public Map<String,Object> returnPurchaseSelect(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("구매담당자 - 제품 반품 단품 목록 => 데이터 전송 // returnPurchaseSelect.do");		
		logger.info("paramMap : "+paramMap);		
		int total_price=0;
		ReturnPurchaseModel returnPurchaseModel = new ReturnPurchaseModel();

		Map<String, Object> resultMap = new HashMap<>();
		
		List<ReturnPurchaseModel> listReturnPurchase = returnPurchaseService.returnPurchaseSelect(paramMap);
		logger.info("returnPurchaseModel.get(0) : "+listReturnPurchase.get(0).toString());
//		logger.info("returnPurchaseModel.get(1) : "+listReturnPurchase.get(1).toString());
		logger.info("returnPurchaseModel.size() : "+listReturnPurchase.size());
		
		for(ReturnPurchaseModel rpm:listReturnPurchase){
			total_price+=rpm.getSum_price();
			returnPurchaseModel.setRefund_no(rpm.getRefund_no());
			returnPurchaseModel.setDeli_company(rpm.getDeli_company());
			returnPurchaseModel.setDeli_name(rpm.getDeli_name());
			returnPurchaseModel.setRefund_cd(rpm.getRefund_cd());
		}
		returnPurchaseModel.setTotal_price(total_price);
		logger.info("total_price : "+returnPurchaseModel.getTotal_price());
		
		resultMap.put("returnPurchaseModel", returnPurchaseModel);		
		logger.info("returnPurchaseSelect.do ==> resultMap.returnPurchaseModel");
		logger.info(resultMap.get("returnPurchaseModel").toString());
		
		return resultMap;
	}
	
	//구매담당자_반품 지시서 디테일 목록 조회
	@RequestMapping("returnPurchaseDtlList.do")
	public String returnPurchaseDtlList(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("구매담당자 - 제품 반품 단품 목록 => 데이터 전송 // returnPurchaseDtlList.do");		
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		//DB의 목록 list에 담아 modalPurchaseDtlList.jsp로 전달
		List<ReturnPurchaseModel> modalReturnPurchaseDtlList = returnPurchaseService.returnPurchaseDtlList(paramMap);	
		model.addAttribute("modalReturnPurchaseDtlList", modalReturnPurchaseDtlList);		
		
		//DB목록의 total row를 담아 purchaseOrderList.jsp로 전달
		int modalReturnPurchaseDtlTotal=returnPurchaseService.countReturnPurchaseDtlList(paramMap);
		logger.info("returnPurchaseDtlList.do ==> modalReturnPurchaseDtlList");
		logger.info(modalReturnPurchaseDtlList);
		
		
		//페이지 네비게이션 정보
		model.addAttribute("modalReturnPurchaseDtlTotal", modalReturnPurchaseDtlTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageModalReturnPurchaseDtl", currentPage);
				
		return "/pcm/returnPurchaseDtlList";
	}

	//발주서 전송(email)
	@RequestMapping("sendRefundDirection.do")
	@ResponseBody
	public String sendRefundDirection(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("반품지시서 메일 전송");
		
		List<ReturnPurchaseModel> modalReturnPurchaseDtlList = returnPurchaseService.returnPurchaseDtlList(paramMap);
		logger.info("modalReturnPurchaseDtlList : "+modalReturnPurchaseDtlList);		
		
		String result=emailSend(modalReturnPurchaseDtlList);
		returnPurchaseService.updateSendRefundDirection(paramMap);
		return result;
	}	
	//반품금액 입금 확인
	@RequestMapping("confirmRefundPrice.do")
	@ResponseBody
	public String confirmRefundPrice(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("반품금액 입금 확인 처리");
		logger.info("paramMap : "+paramMap);
		String result ="";
		
		List<ReturnPurchaseModel> modalReturnPurchaseDtlList = returnPurchaseService.returnPurchaseDtlList(paramMap);
		logger.info("modalReturnPurchaseDtlList.get(0).getRefund_cd() : "+modalReturnPurchaseDtlList.get(0).getRefund_cd());
		if(modalReturnPurchaseDtlList.get(0).getRefund_cd().equals("1")){
			result="Complete Refund Price Confirm";
			returnPurchaseService.updateConfirmRefundPrice(paramMap);
		}
		return result;
	}	
	
	
	// 메일 전송 메서드
	public String emailSend(List<ReturnPurchaseModel> modalReturnPurchaseDtlList) {
		logger.info("emailSend => modalReturnPurchaseDtlList");
		logger.info(modalReturnPurchaseDtlList.toString());
		
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
				message.setFrom(new InternetAddress("yoodh9044@gmail.com", "ChainMaker 반품 지시서 입니다.", "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			// 메일 받는 사람
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(modalReturnPurchaseDtlList.get(0).getDeli_email()));

			// 메일 제목
			message.setSubject("ChainMaker 반품 지시서 전송");

			// 메일 내용			
			authNum = "@@@ Send Refund Direction @@@";
			
			message.setText(modalReturnPurchaseDtlList.toString());
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

