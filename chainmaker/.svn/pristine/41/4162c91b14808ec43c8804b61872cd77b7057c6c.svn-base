package kr.happyjob.chainmaker.scm.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.happyjob.chainmaker.scm.model.WHInfoDTO;
import kr.happyjob.chainmaker.scm.model.WhPgAndScKeyWordDTO;
import kr.happyjob.chainmaker.scm.service.WHInfoService;

@Controller
@RequestMapping("scm/")
public class WHInfoController {
  
//Set logger
 private final Logger logger = LogManager.getLogger(this.getClass());

 // Get class name for logger
 private final String className = this.getClass().toString();
  
 @Autowired
 private WHInfoService whInfoService;
 
 // 창고 정보 관리 페이지 연결
 @RequestMapping("whinfo.do")
 public String WhInfo() {
   
   logger.info("창고 정보 관리 페이지");
   logger.info(" + Start - " + className + ".initWhInfo");
   
   return "scm/whInfo";
 }
 
 @RequestMapping(value ="/wh", method = RequestMethod.GET)
 public String listWHInfo(@ModelAttribute WhPgAndScKeyWordDTO whPgAndScKeyWordDTO , Model model) {
   
   String viewLocation = "scm/whInfoList";
   
   int currentPage = whPgAndScKeyWordDTO.getCurrentPage();
   int pageSize = whPgAndScKeyWordDTO.getPageSize();
   int pageIndex = (currentPage -1) * pageSize;
   
   whPgAndScKeyWordDTO.setPageIndex(pageIndex);

   List<WHInfoDTO> listWHInfo = whInfoService.whInfoList(whPgAndScKeyWordDTO);
   int totalcnt = whInfoService.totalCnt(whPgAndScKeyWordDTO);
   
   model.addAttribute("listWHInfo", listWHInfo);
   model.addAttribute("totalcnt", totalcnt);
   
   return viewLocation;
 }

 
}
