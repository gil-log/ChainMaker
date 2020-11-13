package kr.happyjob.chainmaker.commonbiz.service;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.commonbiz.model.MsgMgmtModel;

@Service
public class MsgMgmtServiceImpl implements MsgMgmtService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	
	@Value("${mail.sender}")
	private String MAIL_SENDER;
	
	@Autowired
	private JavaMailSender mailSender;
	

	/** 메시지 발송 */
	public void sendMsg(Map<String, Object>paramMap) throws Exception {

		// paramMap 종류
		// title       제목
		// cont       내용
		// reciv      받는 사람 이메일 주소
		// sender   보내는 사람 이메일 주소
		
		String title = (String)paramMap.get("title");
		String cont = (String)paramMap.get("cont");
		String[] recivs = paramMap.get("reciv").toString().split(",");
		String sender = paramMap.get("sender").toString();
		
		//System.out.println("---------------------------------------------------- : " + title);
		//System.out.println("---------------------------------------------------- : " + cont);
		
		/* 메시지 내용 조회 */
		MsgMgmtModel msgMgmtModel = new MsgMgmtModel();
		
		for(String reciv:recivs) {
			
			msgMgmtModel.setTo_eml_adrs(reciv);
			msgMgmtModel.setFrom_eml_adr(sender);
			msgMgmtModel.setEml_titl(title);
			msgMgmtModel.setEml_cnts(cont);
			
			/** 메일 발송 */
			sendMail(msgMgmtModel, true);
		}
		
	}
	
	/** 메일 발송 */
	private void sendMail(MsgMgmtModel msgMgmtModel, boolean isHtml) throws Exception {

		String[] arrToAdrs = null;
		
	    try {
	    	
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(msgMgmtModel.getFrom_eml_adr());
			messageHelper.setTo(msgMgmtModel.getTo_eml_adrs());
			//messageHelper.setBcc("");
			messageHelper.setSubject(msgMgmtModel.getEml_titl());
			messageHelper.setText(msgMgmtModel.getEml_cnts(), isHtml);
			mailSender.send(message);
			
	      } catch(Exception e) {
	    	  e.printStackTrace();
	    	  logger.error(msgMgmtModel.getTo_eml_adrs() + "님 메일 발송에 실패하였습니다. 에러메세지 = " + e.getMessage());
	      }
	}
	
}
