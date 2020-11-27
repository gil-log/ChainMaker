package kr.happyjob.chainmaker.scm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.scm.model.WHInfoDTO;
import kr.happyjob.chainmaker.scm.model.WhMngInfoDTO;
import kr.happyjob.chainmaker.scm.model.WhPgAndScKeyWordDTO;
import kr.happyjob.chainmaker.scm.service.WHInfoService;

@Controller
@RequestMapping("scm/")
public class WHInfoController {
  
  // Set logger
  private final Logger logger = LogManager.getLogger(this.getClass());
  
  // Get class name for logger
  private final String className = this.getClass().toString();
  
  @Autowired
  private WHInfoService whInfoService;
  
  // 창고 정보 관리 페이지 연결
  @RequestMapping("whinfo.do")
  public String WhInfo() throws Exception {
    
    logger.info("창고 정보 관리 페이지");
    logger.info(" + Start - " + className + ".initWhInfo");
    
    return "scm/whInfo";
  }
  
  // 창고 정보 리스트 
  @RequestMapping(value = "/wh", method = RequestMethod.GET)
  public String listWHInfo(@ModelAttribute WhPgAndScKeyWordDTO whPgAndScKeyWordDTO, Model model) throws Exception {
    
    String viewLocation = "scm/whInfoList";
    
    int currentPage = whPgAndScKeyWordDTO.getCurrentPage();
    int pageSize = whPgAndScKeyWordDTO.getPageSize();
    int pageIndex = (currentPage - 1) * pageSize;
    
    whPgAndScKeyWordDTO.setPageIndex(pageIndex);
    
    List<WHInfoDTO> listWHInfo = whInfoService.whInfoList(whPgAndScKeyWordDTO);
    int totalcnt = whInfoService.totalCnt(whPgAndScKeyWordDTO);
    
    model.addAttribute("listWHInfo", listWHInfo);
    model.addAttribute("totalcnt", totalcnt);
    
    return viewLocation;
  }
  
  // 창고 정보 모달
  @RequestMapping(value = "/whmng", method = RequestMethod.GET)
  @ResponseBody
  public Map<String, Object> listMngInfo(WhMngInfoDTO whMngInfoDTO, @ModelAttribute WHInfoDTO whInfoDTO, String modalCD) throws Exception {
    Map<String, Object> resultMap = new HashMap<String, Object>();
    
    List<WhMngInfoDTO> listMngInfo = whInfoService.whMngInfoList(whMngInfoDTO);
    resultMap.put("listMngInfo", listMngInfo);
    
    List<WHInfoDTO> listMngWareInfo = whInfoService.whMngWareInfoList(whInfoDTO);
    resultMap.put("listMngWareInfo", listMngWareInfo);
    
    logger.info("-------모달코드 - " + modalCD);
    
    resultMap.put("modalCD", modalCD);
    resultMap.put("wareNo", whInfoDTO.getWare_no());
    
    return resultMap;
  }
  
  // 창고 정보 등록 & 수정 & 삭제
  @RequestMapping(value = "/whinfo", method = RequestMethod.POST)
  @ResponseBody
  public Map<String, Object> whInfoControl(String action, @ModelAttribute WHInfoDTO whInfoDTO) throws Exception {
    
    Map<String, Object> resultMap = new HashMap<String, Object>();
    
    String result = "SUCCESS";
    String resultMsg = "등록 되었습니다.";
    int isSuccess = 0;
    
    switch (action) {
      case "produce":
        isSuccess = whInfoService.insertWhInfo(whInfoDTO);
        logger.info("----------- isSuccess = " + isSuccess);
        if (isSuccess <= 0) {
          result = "FALSE";
          resultMsg = "등록에 실패 하였습니다.";
        }
        break;
      
      case "update":
        isSuccess = whInfoService.updateWhInfo(whInfoDTO);
        logger.info("----------- isSuccess = " + isSuccess);
        if (isSuccess > 0) resultMsg = "수정 하였습니다.";
        else {
          result = "FALSE";
          resultMsg = "수정에 실패 하였습니다,";
        }
        break;
      
//      case "delete":
//        isSuccess = whInfoService.deleteWhInfo(whInfoDTO);
//        logger.info("----------- isSuccess = " + isSuccess);
//        if (isSuccess > 0) resultMsg = "삭제에 성공 하였습니다.";
//        else {
//          result = "FALSE";
//          resultMsg = "삭제에 실패 하였습니다.";
//        }
//        break;
      
      default:
        result = "FALSE";
        resultMsg = "잘못된 접근 입니다.";
    }
    
    resultMap.put("result", result);
    resultMap.put("resultMsg", resultMsg);
    
    return resultMap;
  }
  
}
