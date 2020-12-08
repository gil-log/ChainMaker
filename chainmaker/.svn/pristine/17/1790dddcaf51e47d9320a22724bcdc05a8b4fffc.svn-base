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

	//구매담당자_기업고객_반품내역 조회
	@RequestMapping("refundFinalProcessingList.do")
	public String refundFinalProcessingList(Model model, @RequestParam Map<String, Object> paramMap){		
		logger.info("refundFinalProcessingList.do 컨트롤러 => 구매담당자_기업고객_반품내역 조회");
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		logger.info("refundFinalProcessingList.do => paramMap : "+paramMap);
		
		
		//구매담당자_기업고객_반품내역 조회 정보
		List<RefundFinalProcessingModel> listRefundFinalProcessing=refundFinalProcessingService.refundFinalProcessingList(paramMap);				
		model.addAttribute("listRefundFinalProcessing", listRefundFinalProcessing);
		
		//구매담당자_기업고객_반품내역 조회 페이징 정보
		int refundFinalProcessingTotal=refundFinalProcessingService.countRefundFinalProcessingList(paramMap);
		model.addAttribute("refundFinalProcessingTotal", refundFinalProcessingTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageRefundFinalProcessingList", currentPage);
		
		return "/pcm/refundFinalProcessingList";
	}
	
	//구매담당자_기업고객_반품내역 단건 조회
	@RequestMapping("refundFinalProcessingSelect.do")
	@ResponseBody
	public Map<String,Object> refundFinalProcessingSelect(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("refundFinalProcessingSelect.do 컨트롤러 => 구매담당자_기업고객_반품내역 단건 조회");		

		Map<String, Object> resultMap = new HashMap<>();
				
		//구매담당자_기업고객_반품내역 단건 조회 정보
		RefundFinalProcessingModel refundFinalProcessingModel = refundFinalProcessingService.refundFinalProcessingSelect(paramMap);		
		resultMap.put("refundFinalProcessingModel", refundFinalProcessingModel);	
		
		return resultMap;
	}

	//구매담당자_기업고객_반품내역 단건 상세 조회
	@RequestMapping("modalRefundFinalProcessingDtl.do")
	public String refundFinalProcessingDtl(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("modalRefundFinalProcessingDtl.do => 구매담당자_기업고객_반품내역 단건 상세 조회");		
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		logger.info("modalRefundFinalProcessingDtl.do => paramMap : "+paramMap);		
		
		//구매담당자_기업고객_반품내역 단건 상세 조회 정보
		List<RefundFinalProcessingModel> modalRefundFinalProcessingDtlList = refundFinalProcessingService.refundFinalProcessingDtlList(paramMap);	
		model.addAttribute("modalRefundFinalProcessingDtlList", modalRefundFinalProcessingDtlList);		
		
		//구매담당자_기업고객_반품내역 단건 상세 조회 페이징 정보
		int modalRefundFinalProcessingDtlTotal=refundFinalProcessingService.countRefundFinalProcessingDtlList(paramMap);
		model.addAttribute("modalRefundFinalProcessingDtlTotal", modalRefundFinalProcessingDtlTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageModalRefundFinalProcessingDtl", currentPage);
				
		return "/pcm/refundFinalProcessingDtlList";
	}
	
	//반품 지시서 전송_기업고객(email)
	@RequestMapping("sendRefundFinalConfirm.do")
	@ResponseBody
	public String sendRefundFinalConfirm(Model model, @RequestParam Map<String, Object> paramMap){
		logger.info("sendRefundFinalConfirm.do 컨트롤러 => 반품 지시서 메일 전송_기업고객");
		String result="";
		
//		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
//		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
//		int pageIndex=(currentPage-1)*pageSize;
//		
		paramMap.put("pageIndex", 0);
		paramMap.put("pageSize", 100);
//		logger.info("sendRefundFinalConfirm.do => paramMap : "+paramMap);
		
		//메일 전송 및 메일 전송 정보 담기 및 전송 후 DB의 refund_confirm_cd=4로 변경 
		List<RefundFinalProcessingModel> modalRefundFinalProcessingDtlList = refundFinalProcessingService.refundFinalProcessingDtlList(paramMap);
		result=emailSend(modalRefundFinalProcessingDtlList);
		refundFinalProcessingService.updateRefundComplete(paramMap);
		return result;
	}

	// 메일 전송 메서드
	public String emailSend(List<RefundFinalProcessingModel> modalRefundFinalProcessingDtlList) {	
		logger.info("emainSend 메서드 => modalRefundFinalProcessingDtlList : "+modalRefundFinalProcessingDtlList);
		logger.info("emainSend 메서드 => getUser_email : "+modalRefundFinalProcessingDtlList.get(0).getUser_email());
		StringBuilder tbody = new StringBuilder();
		String content="";
		long total_price=0;
		
		String host = "smtp.gmail.com";
		final String username = "yoodh9044@gmail.com";
		final String password = "aielgmhtsuizbuem";
		int port = 465;

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
				message.setFrom(new InternetAddress("yoodh9044@gmail.com", "ChainMaker 반품 처리", "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			// 메일 받는 사람
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(modalRefundFinalProcessingDtlList.get(0).getUser_email()));

			// 메일 제목
			message.setSubject("ChainMaker 반품 처리 완료");
			
			//총액 계산
			
			//하단 테이블의 tbody 목록 출력
			for(RefundFinalProcessingModel rfpm:modalRefundFinalProcessingDtlList){
				tbody.append("<tr style="+"'text-align: center;'"+">"
						+ "<td>"+rfpm.getPro_name()
						+"("+rfpm.getPro_no()+")</td>"
						+ "<td>"+rfpm.getRefund_qty()+"</td>"
						+ "<td>"+rfpm.getPro_price()+"</td>"
						+ "<td>"+rfpm.getSum_price()+"</td>"
						+ "</tr>");
				total_price+=rfpm.getSum_price();
			}
			// 메일 내용			
			content="<html>"
					+"<body>"
					+"<div style="+"'width: 80%; border: 1px solid black; padding: 20px 20px;'"+">"

					//상단테이블
					+"<h1 style="+"'margin-top: 30px;'>반품 신청 내역</h1>"
					+"<table style="+"'width: 80%; border: 1px solid #000000;'"+">"
					+"<colgroup>"
					+"<col width="+"'60px'"+"/>"
					+"<col width="+"'40px'"+"/>"
					+"<col width="+"'80px'"+"/>"
					+"<col width="+"'60px'"+"/>"
					+"<col width="+"'60px'"+"/>"
					+"<col width="+"'80px'"+"/>"
					+"<col width="+"'100px'"+"/>"
					+"<col width="+"'150px'"+"/>"
					+"</colgroup>"
					+"<tbody>"
					+"<tr style="+"'text-align: center;'"+">"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">주문번호</th>"
					+"<td>"+modalRefundFinalProcessingDtlList.get(0).getOrder_no()+"</td>"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">반품신청고객</th>"
					+"<td>"+modalRefundFinalProcessingDtlList.get(0).getUser_company()+"</td>"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">반품총액</th>"
					+"<td>"+total_price+"</td>"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">은행/계좌번호</th>"
					+"<td>"+modalRefundFinalProcessingDtlList.get(0).getUser_bank()+" / "+modalRefundFinalProcessingDtlList.get(0).getUser_account()+"</td>"
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
					+"<col width="+"'8%'"+"/>"
					+"<col width="+"'15%'"+"/>"
					+"</colgroup>"
					+"<thead>"
					+"<tr style="+"'background-color: #708090;'"+">"
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>제품</th>"				
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>수량</th>"				
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>가격</th>"				
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>합계</th>"					
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
		return "ChainMaker 기업고객 반품 완료 메일 발송";
	}
}

