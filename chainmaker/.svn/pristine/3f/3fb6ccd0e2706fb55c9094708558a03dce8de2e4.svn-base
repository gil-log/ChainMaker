package kr.happyjob.chainmaker.dlm.controller;

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
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.dlm.model.DeliveryBuyerModel;
import kr.happyjob.chainmaker.dlm.service.DeliveryBuyerService;

@Controller
@RequestMapping("/dlm/")
public class DeliveryBuyerController {
  
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	  
	// Get class name for logger
	private final String className = this.getClass().toString();
  
	@Autowired
	private DeliveryBuyerService deliveryBuyerService;
	
	//배송담당자_기업고객_배송 지시서 목록
	@RequestMapping("deliveryBuyer.do")
	public String deliveryBuyer() {
		logger.info("배송담당자_기업고객_배송 지시서 목록");
		    
		return "dlm/deliveryBuyer";
	}
	  
	//배송담당자_기업고객_배송 지시서 조회
	@RequestMapping("deliveryBuyerList.do")
	public String deliveryBuyerList(Model model, @RequestParam Map<String, Object> paramMap, HttpSession session){		
		logger.info("deliveryBuyerList.do 컨트롤러 => 배송담당자_기업고객_배송 지시서 조회");
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;		
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		//로그인한 배송담당자의 내역 조회를 위한 세션 정보 가져오기
		paramMap.put("deliveryID", session.getAttribute("loginId"));
		logger.info("deliveryBuyerList.do => paramMap : "+paramMap);
		
		//배송담당자_기업고객_배송 지시서 조회 정보
		List<DeliveryBuyerModel> listDeliveryBuyer=deliveryBuyerService.deliveryBuyerList(paramMap);
		model.addAttribute("listDeliveryBuyer", listDeliveryBuyer);
		
		//배송담당자_기업고객_배송 지시서 조회 페이징 정보
		int deliveryBuyerTotal=deliveryBuyerService.countDeliveryBuyerList(paramMap);
		model.addAttribute("deliveryBuyerTotal", deliveryBuyerTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageDeliveryBuyerList", currentPage);
		
		return "/dlm/deliveryBuyerList";
	}
	
	//배송담당자_기업고객_배송 지시서 단건 조회
	@RequestMapping("deliveryBuyerSelect.do")
	@ResponseBody
	public Map<String,Object> deliveryBuyerSelect(Model model, @RequestParam Map<String, Object> paramMap, HttpSession session){
		logger.info("deliveryBuyerSelect.do 컨트롤러 => 배송담당자_기업고객_배송 지시서 단건 조회");
		paramMap.put("deliveryID", session.getAttribute("loginId"));
		logger.info("deliveryBuyerSelect.do => paramMap : "+paramMap);		
	
		Map<String, Object> resultMap = new HashMap<>();	
		
		//배송담당자_기업고객_배송 지시서 단건 조회 정보
		DeliveryBuyerModel deliveryBuyerModel = deliveryBuyerService.deliveryBuyerSelect(paramMap);
		resultMap.put("deliveryBuyerModel", deliveryBuyerModel);
		
		return resultMap;
	}
	
	//배송담당자_기업고객_배송 지시서 단건 상세 조회
	@RequestMapping("deliveryBuyerDtlList.do")
	public String deliveryBuyerDtlList(Model model, @RequestParam Map<String, Object> paramMap, HttpSession session){		
		logger.info("deliveryBuyerDtlList.do 컨트롤러 => 배송담당자_기업고객_배송 지시서 단건 상세 조회");
		
		int currentPage=Integer.parseInt((String) paramMap.get("currentPage"));
		int pageSize=Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex=(currentPage-1)*pageSize;
		
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		paramMap.put("deliveryID", session.getAttribute("loginId"));		
		logger.info("deliveryBuyerDtlList.do => paramMap : "+paramMap);
		
		
		//배송담당자_기업고객_배송 지시서 단건 상세 조회 정보
		List<DeliveryBuyerModel> listDeliveryBuyerDtl=deliveryBuyerService.deliveryBuyerDtlList(paramMap);
		model.addAttribute("listDeliveryBuyerDtl", listDeliveryBuyerDtl);
		
		//배송담당자_기업고객_배송 지시서 단건 상세 조회 페이징 정보
		int modalDeliveryBuyerDtlTotal=deliveryBuyerService.countDeliveryBuyerDtlList(paramMap);
		model.addAttribute("modalDeliveryBuyerDtlTotal", modalDeliveryBuyerDtlTotal);		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageDeliveryBuyerDtlList", currentPage);
		
		return "/dlm/deliveryBuyerDtlList";
	}
	
	//배송 지시서 전송_기업고객(email)
	@RequestMapping("sendDelivery.do")
	@ResponseBody
	public String sendDelivery(Model model, @RequestParam Map<String, Object> paramMap, HttpSession session){
		logger.info("sendDelivery.do 컨트롤러 => 배송 지시서 전송_기업고객(email)");
		
		paramMap.put("deliveryID", session.getAttribute("loginId"));
		paramMap.put("user_name", session.getAttribute("userNm"));
		logger.info("sendDelivery.do => paramMap : "+paramMap);
		
		String result="";
		
		List<DeliveryBuyerModel> listDeliveryBuyerDtl=deliveryBuyerService.deliveryBuyerDtlList(paramMap);		
		logger.info("listDeliveryBuyerDtl : "+listDeliveryBuyerDtl);
		
		//메일 전송 및 DB 정보 수정을 위한 정보 담기
		for(DeliveryBuyerModel dbm:listDeliveryBuyerDtl){
			DeliveryBuyerModel deliveryBuyerModel = new DeliveryBuyerModel();
			deliveryBuyerModel.setOrder_no(dbm.getOrder_no());
			deliveryBuyerModel.setShip_cd(dbm.getShip_cd());
			deliveryBuyerModel.setPro_no(dbm.getPro_no());
			deliveryBuyerModel.setShip_qty(dbm.getShip_qty());
			deliveryBuyerModel.setWare_no(dbm.getWare_no());
			deliveryBuyerModel.setShip_manager(dbm.getShip_manager());
			
			//해당 정보의 ship_cd=waiting의 경우 배송지시서 전송 및 창고 재고 수량 적용
			if(deliveryBuyerModel.getShip_cd().equals("waiting")){			
				paramMap.put("changeCD","loading");
				paramMap.put("pro_io_cd","out_done");
				paramMap.put("ship_cd",deliveryBuyerModel.getShip_cd());
				paramMap.put("pro_no",deliveryBuyerModel.getPro_no());
				paramMap.put("ship_qty",deliveryBuyerModel.getShip_qty());
				paramMap.put("ware_no",deliveryBuyerModel.getWare_no());
				logger.info("deliveryBuyerModel.getShip_cd().equals('waiting') => paramMap : "+paramMap);
				
				logger.info("deliveryBuyerModel.getShip_manager() : "+deliveryBuyerModel.getShip_manager()
								+"\nparamMap.get('user_name') : "+paramMap.get("user_name"));
				
				//로그인 정보와 배송담당자의 정보 확인 후 데이터 변경 진행
				if(deliveryBuyerModel.getShip_manager().equals(paramMap.get("user_name"))){
					emailSend(listDeliveryBuyerDtl);
					deliveryBuyerService.updateDeliveryBuyerShipCD(paramMap);
					deliveryBuyerService.updateDeliveryBuyerProIOCD(paramMap);
					deliveryBuyerService.updateDeliveryBuyerProWareQty(paramMap);
					result="waiting";					
				}
				
			//해당 정보의 ship_cd=loading의 경우 배송 완료 처리			
			}else if(deliveryBuyerModel.getShip_cd().equals("loading")){			
				paramMap.put("changeCD","complete");
				logger.info("deliveryBuyerModel.getShip_cd().equals('loading') => paramMap : "+paramMap);
				
				deliveryBuyerService.updateFinalDeliveryBuyerShipCD(paramMap);
				result="loading";
			}
		}
		return result;
	}	
	// 메일 전송 메서드
	public String emailSend(List<DeliveryBuyerModel> listDeliveryBuyerDtl) {
		logger.info("RegisterFindIdEmailSend => returnOrderDtl");
		logger.info(listDeliveryBuyerDtl.toString());
		
		String host = "smtp.gmail.com";
		final String username = "yoodh9044@gmail.com";
		final String password = "aielgmhtsuizbuem";
		int port = 465;
//		StringBuilder authNum = new StringBuilder();
		String content="";
		StringBuilder tbody = new StringBuilder();
		
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
				message.setFrom(new InternetAddress("yoodh9044@gmail.com", "ChainMaker 기업고객 배송 지시서", "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
	
			// 메일 받는 사람
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(listDeliveryBuyerDtl.get(0).getUser_email()));
	
			// 메일 제목
			message.setSubject("ChainMaker 배송 지시서 전송","utf-8");
			
			for(DeliveryBuyerModel dbm:listDeliveryBuyerDtl){
				tbody.append("<tr style="+"'text-align: center;'"+">"
						+ "<td>"+dbm.getPro_name()
						+"("+dbm.getPro_no()+")</td>"
						+ "<td>"+dbm.getShip_qty()+"</td>"
						+ "<td>"+dbm.getWare_no()+"</td>"
						+ "<td>"+dbm.getWare_name()+"</td>"
						+ "<td>"+dbm.getWare_address()+" "+dbm.getWare_dt_address()+"</td>"
						+ "</tr>");
			}
			// 메일 내용			
			content="<html>"
					+"<body>"
					+"<div style="+"'width: 80%; border: 1px solid black; padding: 20px 20px;'"+">"

					//상단테이블
					+"<h1 style="+"'margin-top: 30px;'>배송 지시서</h1>"
					+"<table style="+"'width: 80%; border: 1px solid #000000;'"+">"
					+"<colgroup>"
					+"<col width="+"'60px'"+"/>"
					+"<col width="+"'40px'"+"/>"
					+"<col width="+"'60px'"+"/>"
					+"<col width="+"'60px'"+"/>"
					+"<col width="+"'100px'"+"/>"
					+"<col width="+"'450px'"+"/>"
					+"</colgroup>"
					+"<tbody>"
					+"<tr style="+"'text-align: center;'"+">"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">주문번호</th>"
					+"<td>"+listDeliveryBuyerDtl.get(0).getOrder_no()+"</td>"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">주문고객</th>"
					+"<td>"+listDeliveryBuyerDtl.get(0).getUser_company()+"</td>"
					+"<th scope="+"'row'"+" style='background-color: #708090;'"+">주문고객 주소</th>"
					+"<td>"+listDeliveryBuyerDtl.get(0).getUser_address()+" "+listDeliveryBuyerDtl.get(0).getUser_dt_address()+"</td>"
					+"</tr>"
					+"</tbody>"
					+"</table>"	
					
					//하단테이블
					+"<h3 style="+"'margin-top: 50px;'>주문 상세 목록</h3>"
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
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>주문번호</th>"				
					+"<th scope="+"'row'"+" style="+"'font-weight: bold;'>수량</th>"				
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
		return "ChainMaker 기업고객 배송 지시서 전송";
	}
}
