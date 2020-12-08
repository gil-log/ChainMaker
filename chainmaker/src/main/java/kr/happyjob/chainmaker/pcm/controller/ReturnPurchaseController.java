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
public class ReturnPurchaseController {

	//Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	//Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	private ReturnPurchaseService returnPurchaseService;
	
	@RequestMapping("returnPurchase.do")
	public String returnPurchase(){
		logger.info("구매담당자 _납품업체_반품 지시서 목록");
		
		return "pcm/returnPurchase";
	}
	
	//구매담당자_납품업체_반품 지시서 조회
	@RequestMapping("returnPurchaseList.do")
	public String returnPurchaseList(Model model, @RequestParam Map<String, Object> paramMap){		
		logger.info("returnPurchaseList.do 컨트롤러 => 구매담당자_납품업체_반품 지시서 조회");
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		logger.info("returnPurchaseList.do => paramMap : "+paramMap);
		
		//구매담당자_납품업체_반품 지시서 조회 정보
		List<ReturnPurchaseModel> listReturnPurchase=returnPurchaseService.returnPurchaseList(paramMap);
		model.addAttribute("listReturnPurchase", listReturnPurchase);
		
		//구매담당자_납품업체_반품 지시서 조회 페이징 정보
		int returnPurchaseTotal=returnPurchaseService.countReturnPurchaseList(paramMap);
		model.addAttribute("returnPurchaseTotal", returnPurchaseTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageReturnPurchaseList", currentPage);
		
		return "/pcm/returnPurchaseList";
	}
	
	//구매담당자_납품업체_반품 지시서 단건 조회
	@RequestMapping("returnPurchaseSelect.do")
	@ResponseBody
	public Map<String,Object> returnPurchaseSelect(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("구매담당자 - 제품 반품 단품 목록 => 데이터 전송 // returnPurchaseSelect.do");		
		logger.info("paramMap : "+paramMap);		
		long total_price=0;
		ReturnPurchaseModel returnPurchaseModel = new ReturnPurchaseModel();

		Map<String, Object> resultMap = new HashMap<>();
		
		//구매담당자_납품업체_반품 지시서 단건 조회 정보
		List<ReturnPurchaseModel> listReturnPurchase = returnPurchaseService.returnPurchaseSelect(paramMap);
		
		//발주지시서 상세 내역의 총합 계산
		for(ReturnPurchaseModel rpm:listReturnPurchase){
			total_price+=rpm.getSum_price();
			returnPurchaseModel.setRefund_no(rpm.getRefund_no());
			returnPurchaseModel.setDeli_company(rpm.getDeli_company());
			returnPurchaseModel.setDeli_name(rpm.getDeli_name());
			returnPurchaseModel.setRefund_cd(rpm.getRefund_cd());
		}
		returnPurchaseModel.setTotal_price(total_price);
		
		//구매담당자_납품업체_반품 지시서 단건 조회 정보		
		resultMap.put("returnPurchaseModel", returnPurchaseModel);	
		
		return resultMap;
	}
	
	//구매담당자_납품업체_반품 지시서 단건 상세 조회
	@RequestMapping("returnPurchaseDtlList.do")
	public String returnPurchaseDtlList(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("returnPurchaseDtlList.do 컨트롤러 => 구매담당자_납품업체_반품 지시서 단건 상세 조회");		
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		logger.info("returnPurchaseDtlList.do => paramMap : "+paramMap);		
		
		//구매담당자_납품업체_반품 지시서 단건 상세 조회 정보
		List<ReturnPurchaseModel> modalReturnPurchaseDtlList = returnPurchaseService.returnPurchaseDtlList(paramMap);	
		model.addAttribute("modalReturnPurchaseDtlList", modalReturnPurchaseDtlList);		
		
		//구매담당자_납품업체_반품 지시서 단건 상세 조회 페이징 정보
		int modalReturnPurchaseDtlTotal=returnPurchaseService.countReturnPurchaseDtlList(paramMap);
		model.addAttribute("modalReturnPurchaseDtlTotal", modalReturnPurchaseDtlTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageModalReturnPurchaseDtl", currentPage);
				
		return "/pcm/returnPurchaseDtlList";
	}

	//반품 지시서 메일 전송_납품업체(email)
	@RequestMapping("sendRefundDirection.do")
	@ResponseBody
	public Map<String, Object> sendRefundDirection(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("sendRefundDirection.do 컨트롤러 => 반품 지시서 메일 전송_납품업체(email)");
		
		Map<String, Object> resultMap = new HashMap<>();
		String result="";
		
		//선택한 row의 반품지시서 정보 담기
		List<ReturnPurchaseModel> modalReturnPurchaseDtlList = returnPurchaseService.returnPurchaseDtlList(paramMap);
		
		//해당 row의 반품지시서 반품코드에 따라 수행변경
		//refund_cd=0 이면 반품 지시서 전송
		//refund_cd=1 이면 입금 완료 처리
		if(modalReturnPurchaseDtlList.get(0).getRefund_cd().equals("0")){
			emailSend(modalReturnPurchaseDtlList);
			returnPurchaseService.updateSendRefundDirection(paramMap);
			result="반품지시서 발송이 완료되었습니다.";
			resultMap.put("result", result);
			
		}else if(modalReturnPurchaseDtlList.get(0).getRefund_cd().equals("1")){
			returnPurchaseService.updateConfirmRefundPrice(paramMap);			
			result="반품금액 입금 확인이 완료되었습니다.";
			resultMap.put("result", result);
		}
		logger.info(resultMap.get("result"));
		
		return resultMap;
	}	
//	//반품금액 입금 확인
//	@RequestMapping("confirmRefundPrice.do")
//	@ResponseBody
//	public String confirmRefundPrice(Model model, @RequestParam Map<String, Object> paramMap){
//		logger.info("반품금액 입금 확인 처리");
//		logger.info("paramMap : "+paramMap);
//		String result ="";
//		
//		List<ReturnPurchaseModel> modalReturnPurchaseDtlList = returnPurchaseService.returnPurchaseDtlList(paramMap);
//		logger.info("modalReturnPurchaseDtlList.get(0).getRefund_cd() : "+modalReturnPurchaseDtlList.get(0).getRefund_cd());
//		if(modalReturnPurchaseDtlList.get(0).getRefund_cd().equals("1")){
//			result="Complete Refund Price Confirm";
//			returnPurchaseService.updateConfirmRefundPrice(paramMap);
//		}
//		return result;
//	}	
	
	
	// 메일 전송 메서드
	public String emailSend(List<ReturnPurchaseModel> modalReturnPurchaseDtlList) {
		logger.info("emailSend => modalReturnPurchaseDtlList");
		logger.info(modalReturnPurchaseDtlList.toString());
		
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
				message.setFrom(new InternetAddress("yoodh9044@gmail.com", "ChainMaker 납품업체 반품 지시서", "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			// 메일 받는 사람
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(modalReturnPurchaseDtlList.get(0).getDeli_email()));

			// 메일 제목
			message.setSubject("ChainMaker 납품업체 반품 지시서");
			
			//하단 테이블 정보 출력
			for(ReturnPurchaseModel rpm:modalReturnPurchaseDtlList){
				tbody.append("<tr style="+"'text-align: center;'"+">"
						+ "<td>"+rpm.getPro_name()
						+"\n("+rpm.getPro_no()+")</td>"
						+ "<td>"+rpm.getRefund_qty()+"</td>"
						+ "<td>"+rpm.getPro_deli_price()+"</td>"
						+ "<td>"+rpm.getSum_price()+"</td>"
						+ "<td>"+rpm.getWare_no()+"</td>"
						+ "<td>"+rpm.getWare_name()+"</td>"
						+ "<td>"+rpm.getWare_address()+" "+rpm.getWare_dt_address()+"</td>"
						+ "</tr>");
				total_price+=rpm.getSum_price();
			}
			// 메일 내용			
			content="<html>"
					+"<body>"
					+"<div style="+"'width: 80%; border: 1px solid black; padding: 20px 20px;'"+">"

					//상단테이블
					+"<h1 style="+"'margin-top: 30px;'>반품 지시서</h1>"
					+"<table style="+"'width: 80%; border: 1px solid #000000;'"+">"
					+"<colgroup>"
					+"<col width="+"'60px'"+"/>"
					+"<col width="+"'40px'"+"/>"
					+"<col width="+"'60px'"+"/>"
					+"<col width="+"'70px'"+"/>"
					+"<col width="+"'50px'"+"/>"
					+"<col width="+"'60px'"+"/>"
					+"<col width="+"'40px'"+"/>"
					+"<col width="+"'80px'"+"/>"
					+"</colgroup>"
					+"<tbody>"
					+"<tr style="+"'text-align: center;'"+">"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">반품번호</th>"
					+"<td>"+modalReturnPurchaseDtlList.get(0).getRefund_no()+"</td>"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">납품업체</th>"
					+"<td>"+modalReturnPurchaseDtlList.get(0).getDeli_company()+"</td>"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">담당자</th>"
					+"<td>"+modalReturnPurchaseDtlList.get(0).getDeli_name()+"</td>"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">총액</th>"
					+"<td>"+total_price+"</td>"
					+"</tr>"
					+"</tbody>"
					+"</table>"	
					
					//하단테이블
					+"<h3 style="+"'margin-top: 50px;'>반품 상세 목록</h3>"
					+"<table style="+"'width: 80%; border: 1px solid #000000;'"+">"
					+"<colgroup>"
					+"<col width="+"'6%'"+"/>"
					+"<col width="+"'4%'"+"/>"
					+"<col width="+"'5%'"+"/>"
					+"<col width="+"'5%'"+"/>"
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
		return "ChainMaker 납품업체 반품 지시서 메일 발송";
	}
}

