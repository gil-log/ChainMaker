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
import kr.happyjob.chainmaker.pcm.model.RefundFinalProcessingModel;
import kr.happyjob.chainmaker.pcm.service.RefundFinalProcessingService;

@Controller
@RequestMapping("/pcm/")
public class RefundFinalProcessingController {

	//Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	//Get class name for logger
	private final String className = this.getClass().toString();

	@Autowired
	private RefundFinalProcessingService refundFinalProcessingService;
	
	@RequestMapping("refundFinalProcessing.do")
	public String  refundFinalProcessing(){
		logger.info("구매담당자_기업고객_반품내역관리");
		
		return "/pcm/refundFinalProcessing";
	}

	//구매담당자_발주 지시서 목록 조회
	@RequestMapping("refundFinalProcessingList.do")
	public String refundFinalProcessingList(Model model, @RequestParam Map<String, Object> paramMap){		
		logger.info("구매담당자_기업고객_반품내역 목록 조회 => 데이터 전송");
		logger.info("paramMap : "+paramMap);
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		
		//DB의 목록 list에 담아 refundFinalProcessingList.jsp로 전달
		List<RefundFinalProcessingModel> listRefundFinalProcessing=refundFinalProcessingService.refundFinalProcessingList(paramMap);
				
		model.addAttribute("listRefundFinalProcessing", listRefundFinalProcessing);
		
		//DB목록의 total row를 담아 refundFinalProcessingList.jsp로 전달
		int refundFinalProcessingTotal=refundFinalProcessingService.countRefundFinalProcessingList(paramMap);
		logger.info("refundFinalProcessingList.do ==> listRefundFinalProcessing");
		logger.info(listRefundFinalProcessing);
		
		
		//페이지 네비게이션 정보
		model.addAttribute("refundFinalProcessingTotal", refundFinalProcessingTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageRefundFinalProcessingList", currentPage);
		
		return "/pcm/refundFinalProcessingList";
	}
	
	//구매담당자_발주 지시서 목록 단건 조회
	@RequestMapping("refundFinalProcessingSelect.do")
	@ResponseBody
	public Map<String,Object> refundFinalProcessingSelect(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("구매담당자_기업고객_반품내역 목록 단건 조회 => 데이터 전송");		

		Map<String, Object> resultMap = new HashMap<>();
				
		RefundFinalProcessingModel refundFinalProcessingModel = refundFinalProcessingService.refundFinalProcessingSelect(paramMap);
		
		resultMap.put("refundFinalProcessingModel", refundFinalProcessingModel);		
		
		logger.info("refundFinalProcessingSelect.do ==> resultMap.refundFinalProcessingModel");
		logger.info(resultMap.get("refundFinalProcessingModel"));
		
		return resultMap;
	}

	//구매담당자_발주 지시서 목록 디테일 목록 조회
	@RequestMapping("modalRefundFinalProcessingDtl.do")
	public String refundFinalProcessingDtl(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("구매담당자_기업고객_반품내역 디테일 목록 조회 => 데이터 전송");		
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		//DB의 목록 list에 담아 modalPurchaseDtlList.jsp로 전달
		List<RefundFinalProcessingModel> modalRefundFinalProcessingDtlList = refundFinalProcessingService.refundFinalProcessingDtlList(paramMap);	
		model.addAttribute("modalRefundFinalProcessingDtlList", modalRefundFinalProcessingDtlList);		
		
		//DB목록의 total row를 담아 purchaseOrderList.jsp로 전달
		int modalRefundFinalProcessingDtlTotal=refundFinalProcessingService.countRefundFinalProcessingDtlList(paramMap);
		logger.info("modalRefundFinalProcessingDtl.do ==> modalPurchaseDtlList");
		logger.info(modalRefundFinalProcessingDtlList);
		
		
		//페이지 네비게이션 정보
		model.addAttribute("modalRefundFinalProcessingDtlTotal", modalRefundFinalProcessingDtlTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageModalRefundFinalProcessingDtl", currentPage);
				
		return "/pcm/refundFinalProcessingDtlList";
	}
	
	//발주서 전송(email)
	@RequestMapping("sendRefundFinalConfirm.do")
	@ResponseBody
	public String sendRefundFinalConfirm(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("구매담당자_기업고객_반품처리 완료 메일 발송");
		logger.info("paramMap : "+paramMap);
		String result="";
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", 0);
		paramMap.put("pageSize", 100);
		
		List<RefundFinalProcessingModel> modalRefundFinalProcessingDtlList = refundFinalProcessingService.refundFinalProcessingDtlList(paramMap);	
		logger.info("sendRefundFinalConfirm.do => modalRefundFinalProcessingDtlList : "+modalRefundFinalProcessingDtlList);
		
		
		result=emailSend(modalRefundFinalProcessingDtlList);
		refundFinalProcessingService.updateRefundComplete(paramMap);
		return result;
	}

	// 메일 전송 메서드
	public String emailSend(List<RefundFinalProcessingModel> modalRefundFinalProcessingDtlList) {	
		logger.info("emainSend 메서드 => modalRefundFinalProcessingDtlList : "+modalRefundFinalProcessingDtlList);
		logger.info("emainSend 메서드 => getUser_email : "+modalRefundFinalProcessingDtlList.get(0).getUser_email());
//		String test =modalRefundFinalProcessingDtlList.toString();
		
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
				message.setFrom(new InternetAddress("yoodh9044@gmail.com", "ChainMaker 반품 처리 완료 메일 입니다.", "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			// 메일 받는 사람
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(modalRefundFinalProcessingDtlList.get(0).getUser_email()));

			// 메일 제목
			message.setSubject("ChainMaker 반품 처리 완료");

			// 메일 내용			
			authNum = "@@@ Send Refund Complete @@@";
			
//			for(RefundFinalProcessingModel refundFinalProcessingModel:modalRefundFinalProcessingDtlList){			
//				message.setText(refundFinalProcessingModel.toString());
//				
//			}
			message.setText(modalRefundFinalProcessingDtlList.toString());
			
			Transport.send(message);
			System.out.println("전송완료");

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return authNum;
//		return test;
	}
}

