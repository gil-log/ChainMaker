package kr.happyjob.chainmaker.pcm.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.pcm.model.PurchaseOrderModel;
import kr.happyjob.chainmaker.pcm.service.PurchaseOrderService;

@Controller
@RequestMapping("/pcm/")
public class PurchaseOrderController {

	//Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	//Get class name for logger
	private final String className = this.getClass().toString();

	@Autowired
	private PurchaseOrderService purchaseOrderService;
	
	@RequestMapping("purchaseOrder.do")
	public String purchaseOrder(){
		logger.info("구매담당자 _납품업체_발주 지시서 목록");
		
		return "pcm/purchaseOrder";
	}
	
	//구매담당자_납품업체_발주 지시서 조회
	@RequestMapping("purchaseOrderList.do")
	public String purchaseOrderList(Model model, @RequestParam Map<String, Object> paramMap){		
		logger.info("purchaseOrderList.do 컨트롤러 => 구매담당자 _납품업체_발주 지시서 조회");
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		logger.info("purchaseOrderList.do => paramMap : "+paramMap);
		
		
		//발주 지시서 조회 정보
		List<PurchaseOrderModel> listPurchaseOrder=purchaseOrderService.purchaseOrderList(paramMap);
		model.addAttribute("listPurchaseOrder", listPurchaseOrder);
		
		//발주 지시서 조회 페이징 정보
		int purchaseOrderTotal=purchaseOrderService.countPurchaseOrderList(paramMap);
		model.addAttribute("purchaseOrderTotal", purchaseOrderTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPagePurchaseOrderList", currentPage);
		
		return "/pcm/purchaseOrderList";
	}
	
	//구매담당자_납품업체_발주 지시서 단건 조회
	@RequestMapping("purchaseOrderSelect.do")
	@ResponseBody
	public Map<String,Object> purchaseOrderSelect(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("purchaseOrderSelect.do 컨트롤러 => 구매담당자_납품업체_발주 지시서 단건 조회");		

		Map<String, Object> resultMap = new HashMap<>();
			
		//구매담당자_납품업체_발주 지시서 단건 조회 정보
		PurchaseOrderModel purchaseOrderModel = purchaseOrderService.purchaseOrderSelect(paramMap);
		resultMap.put("purchaseOrderModel", purchaseOrderModel);		
		
		return resultMap;
	}

	//구매담당자_발주 지시서 목록 단건 상세 조회
	@RequestMapping("modalPurchasedtl.do")
	public String modalPurchasedtl(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("modalPurchasedtl.do 컨트롤러 => 구매담당자_발주 지시서 목록 단건 상세 조회");		
		
//		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
//		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
//		int pageIndex=(currentPage-1)*pageSize;
//		
//		paramMap.put("pageIndex", pageIndex);
//		paramMap.put("pageSize", pageSize);
		logger.info("modalPurchasedtl.do 컨트롤러 => paramMap : "+paramMap);		
		
		//구매담당자_발주 지시서 목록 단건 상세 조회 정보
		List<PurchaseOrderModel> modalPurchaseDtlList = purchaseOrderService.purchaseDtlList(paramMap);	
		model.addAttribute("modalPurchaseDtlList", modalPurchaseDtlList);	
		
		//구매담당자_발주 지시서 목록 단건 상세 조회 페이징 정보
		int modalPurchaseDtlTotal=purchaseOrderService.countPurchaseDtlList(paramMap);
		model.addAttribute("modalPurchaseDtlTotal", modalPurchaseDtlTotal);		
//		model.addAttribute("pageSize", pageSize);
//		model.addAttribute("currentPageModalPurchaseDtl", currentPage);
				
		return "/pcm/purchaseOrderDtlList";
	}
	
	//발주서 전송(email)
	@RequestMapping("sendPurchase.do")
	@ResponseBody
	public String sendPurchase(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("sendPurchase.do 컨트롤러 => 발주지시서 메일 전송");
		logger.info("sendPurchase.do => paramMap : "+paramMap);
		String result="";
//		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
//		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
//		int pageIndex=(currentPage-1)*pageSize;
//		
//		paramMap.put("pageIndex", 0);
//		paramMap.put("pageSize", 100);
		
		//발주 지시서 전송을 위한 정보 담기
		List<PurchaseOrderModel> modalPurchaseDtlList = purchaseOrderService.purchaseDtlList(paramMap);	
		PurchaseOrderModel purchase=modalPurchaseDtlList.get(0);	
		
		//메일 전송 및 메일 전송 정보 담기 및 전송 후 DB의 purchase_cd=2로 변경 
		result=RegisterFindIdEmailSend(modalPurchaseDtlList);
		purchaseOrderService.updatePurchaseCD(paramMap);
		
		return result;
	}
	
	// 메일 전송 메서드
	public String RegisterFindIdEmailSend(List<PurchaseOrderModel> modalPurchaseDtlList) {
		String host = "smtp.gmail.com";
		final String username = "yoodh9044@gmail.com";
		final String password = "aielgmhtsuizbuem";
		int port = 465;
		StringBuilder tbody = new StringBuilder();
		String content="";
		long total_price=0;

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
				message.setFrom(new InternetAddress("yoodh9044@gmail.com", "ChainMaker 발주 지시서", "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			// 메일 받는 사람
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(modalPurchaseDtlList.get(0).getDeli_email()));

			// 메일 제목
			message.setSubject("ChainMaker 발주 지시서");
			
			for(PurchaseOrderModel pom:modalPurchaseDtlList){
				tbody.append("<tr style="+"'text-align: center;'"+">"
						+ "<td>"+pom.getPro_name()
						+"\n("+pom.getPro_no()+")</td>"
						+ "<td>"+pom.getPurchase_qty()+"</td>"
						+ "<td>"+pom.getPro_deli_price()+"</td>"
						+ "<td>"+pom.getSum_price()+"</td>"
						+ "<td>"+pom.getWare_no()+"</td>"
						+ "<td>"+pom.getWare_name()+"</td>"
						+ "<td>"+pom.getWare_address()+" "+pom.getWare_dt_address()+"</td>"
						+ "</tr>");				
				total_price+=pom.getSum_price();
			}
			// 메일 내용			
			content="<html>"
					+"<body>"
					+"<div style="+"'width: 80%; border: 1px solid black; padding: 20px 20px;'"+">"

					//상단테이블 1
					+"<h1 style="+"'margin-top: 30px;'>발주 지시서</h1>"
					+"<table style="+"'width: 80%; border: 1px solid #000000;'"+">"
					+"<colgroup>"
					+"<col width="+"'60px'"+"/>"
					+"<col width="+"'40px'"+"/>"
					+"<col width="+"'50px'"+"/>"
					+"<col width="+"'50px'"+"/>"
					+"<col width="+"'60px'"+"/>"
					+"<col width="+"'80px'"+"/>"
					+"</colgroup>"
					+"<tbody>"
					+"<tr style="+"'text-align: center;'"+">"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">발주번호</th>"
					+"<td>"+modalPurchaseDtlList.get(0).getPurchase_no()+"</td>"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">납품업체</th>"
					+"<td>"+modalPurchaseDtlList.get(0).getDeli_company()+"</td>"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">발주날짜</th>"
					+"<td>"+modalPurchaseDtlList.get(0).getPurchase_date()+"</td>"
					+"</tr>"
					+"</tbody>"
					+"</table>"
					
					//상단테이블 2					
					+"<table style="+"'width: 80%; margin-top: 5px; border: 1px solid #000000;'"+">"
					+"<colgroup>"
					+"<col width="+"'50px'"+"/>"
					+"<col width="+"'40px'"+"/>"
					+"<col width="+"'40px'"+"/>"
					+"<col width="+"'60px'"+"/>"
					+"</colgroup>"
					+"<tbody>"
					+"<tr style="+"'text-align: center;'"+">"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">담당자</th>"
					+"<td>"+modalPurchaseDtlList.get(0).getDeli_name()+"</td>"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">총액</th>"
					+"<td>"+total_price+"</td>"
					+"</tr>"
					+"</tbody>"
					+"</table>"	
					
					//하단테이블
					+"<h3 style="+"'margin-top: 50px;'>발주 상세 목록</h3>"
					+"<table style="+"'width: 80%; border: 1px solid #000000;'"+">"
					+"<colgroup>"
					+"<col width="+"'6%'"+"/>"
					+"<col width="+"'4%'"+"/>"
					+"<col width="+"'5%'"+"/>"
					+"<col width="+"'6%'"+"/>"
					+"<col width="+"'4%'"+"/>"
					+"<col width="+"'8%'"+"/>"
					+"<col width="+"'15%'"+"/>"
					+"</colgroup>"
					+"<thead>"
					+"<tr style="+"'background-color: #708090;'"+">"
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>제품</th>"				
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>수량</th>"				
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>납품금액</th>"				
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>합계</th>"				
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>창고번호</th>"				
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>창고이름</th>"				
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>창고주소</th>"				
					+"</tr>"
					+"</thead>"
					+"<tbody>"
					+tbody
					+"</tbody>"
					+"</table>"
					+"</div>"
					+"</body>"
					+"</html>";
			
			message.setContent(content,"text/html;charset=euc-kr");			
			
			Transport.send(message);
			System.out.println("전송완료");

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return "ChainMaker 발주 지시서 메일 전송";
	}
}

