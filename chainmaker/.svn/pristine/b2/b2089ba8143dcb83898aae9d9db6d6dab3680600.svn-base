package kr.happyjob.chainmaker.scm.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/scm/")
public class WHInfoFormController {
  
//Set logger
 private final Logger logger = LogManager.getLogger(this.getClass());

 // Get class name for logger
 private final String className = this.getClass().toString();
 
 //창고 정보 관리 페이지 연결
 @RequestMapping("WhInfoForm.do")
 public String WhInfoForm() {
   logger.info("창고 정보 관리 페이지");
   
   return "scm/WhInfoForm";
 }
}
