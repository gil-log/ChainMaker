package kr.happyjob.chainmaker.login.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.happyjob.chainmaker.common.comnUtils.ComnCodUtil;
import kr.happyjob.chainmaker.login.model.LgnInfoModel;
import kr.happyjob.chainmaker.login.model.UsrMnuAtrtModel;
import kr.happyjob.chainmaker.login.service.LoginService;
import kr.happyjob.chainmaker.system.model.ComnCodUtilModel;

@Controller
public class LoginController {

   // 커밋 테스트 됌 -동철
   
   
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
   
   @Autowired
   LoginService loginService;

   /**
    * index 접속 시 로그인 페이지로 이동한다.
    * 
    * @param   Model result - Spring model object
    * @param   Map paramMap - Request Param object
    * @param   HttpServletRequest request - Servlet request object
    * @param   HttpServletResponse response - Servlet response object
    * @param   HttpSession session - Http session Object
    * @return   String - page navigator
    * @throws Exception
    */

   
   
   
   @RequestMapping("login.do")
   public String index(Model result, @RequestParam Map<String, String> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {

      logger.info("+ Start LoginController.login.do");
      List<ComnCodUtilModel> listOfcDvsCod = ComnCodUtil.getComnCod("OFC_DVS_COD","M");   // 오피스 구분 코드 (M제외)
      Collections.reverse(listOfcDvsCod); // 오피스 구분 역순으로
      List<ComnCodUtilModel> listCtrCod = ComnCodUtil.getComnCod("CTR_COD");               // 국가 코드
      List<ComnCodUtilModel> listPnnCtr = ComnCodUtil.getComnCod("PNN_CTR");               // 전화번호 국가
      
      result.addAttribute("listOfcDvsCod", listOfcDvsCod);   // 오피스 구분 코드
      result.addAttribute("listCtrCod", listCtrCod);            // 국가 코드
      result.addAttribute("listPnnCtr", listPnnCtr);            // 전화번호 국가
          logger.info("+ End LoginController.login.do");

      return "/login/login";
   }

   /**
    * 사용자 로그인을 처리한다.
    * 
    * @param   Model result - Spring model object
    * @param   Map paramMap - Request Param object
    * @param   HttpServletRequest request - Servlet request object
    * @param   HttpServletResponse response - Servlet response object
    * @param   HttpSession session - Http session Object
    * @return   String - page navigator
    * @throws Exception
    */
   @RequestMapping("loginProc.do")
   @ResponseBody
   public Map<String, String> loginProc(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {

      logger.info("+ Start LoginController.loginProc.do");
      logger.info("   - ParamMap : " + paramMap);
   
      // 사용자 로그인
      LgnInfoModel lgnInfoModel = loginService.loginProc(paramMap);
      
      String result;
      String resultMsg;
      
      
      if (lgnInfoModel != null) {
         
         result = "SUCCESS";
         resultMsg = "사용자 로그인 정보가 일치 합니다.";
         
         // 사용자 메뉴 권한 조회
         paramMap.put("usr_sst_id", lgnInfoModel.getUsr_sst_id());
         paramMap.put("userType",lgnInfoModel.getMem_author());
         // 메뉴 목록 조회 0depth
         List<UsrMnuAtrtModel> listUsrMnuAtrtModel = loginService.listUsrMnuAtrt(paramMap);
         // 메뉴 목록 조회 1depth
         for(UsrMnuAtrtModel list : listUsrMnuAtrtModel){
            Map<String, Object> resultMapSub = new HashMap<String, Object>();
            resultMapSub.put("lgn_Id", paramMap.get("lgn_Id")); 
            resultMapSub.put("hir_mnu_id", list.getMnu_id());
            resultMapSub.put("userType",lgnInfoModel.getMem_author());
            list.setNodeList(loginService.listUsrChildMnuAtrt(resultMapSub));
         }
         session.setAttribute("loginId",lgnInfoModel.getLgn_id());                     //   로그인 ID
         session.setAttribute("userNm",lgnInfoModel.getUsr_nm());                  // 사용자 성명
         session.setAttribute("usrMnuAtrt", listUsrMnuAtrtModel);
         session.setAttribute("userType", lgnInfoModel.getMem_author());            // 로그린 사용자 권란       A: 관리자       C: 기업회원    D:일반회원
         session.setAttribute("serverName", request.getServerName());
         
      } else {
         
         result = "FALSE";
         resultMsg = "사용자 로그인 정보가 일치하지 않습니다.";
      }
   
            
      Map<String, String> resultMap = new HashMap<String, String>();
      resultMap.put("result", result);
      resultMap.put("resultMsg", resultMsg);
      resultMap.put("serverName", request.getServerName());
      
      logger.info("+ End LoginController.loginProc.do");

      return resultMap;
   }
   
   
   /**
    * 로그아웃
    * @param request
    * @param response
    * @param session
    * @return
    */
   @RequestMapping(value = "/loginOut.do")
   public ModelAndView loginOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
                  
      ModelAndView mav = new ModelAndView();
      session.invalidate();
      mav.setViewName("redirect:/login.do");
      
      return mav;
   }
   
   /**
    *  사용자 id,pw 찾기
    */
   @RequestMapping("selectFindInfo.do")
   @ResponseBody
   public Map<String, Object> selectFindInfo(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
         HttpServletResponse response, HttpSession session) throws Exception {
      
      logger.info("+ Start " + className + ".selectFindInfo");
      
      logger.info("   - paramMap : " + paramMap);
      if(!paramMap.get("cpn_ctr").toString().equals("") && !paramMap.get("cpn_ctr").toString().equals("000")){
         paramMap.put("type", "P");
      }else if(!paramMap.get("eml").toString().equals("")){
         paramMap.put("type", "E");
      }
 
      String result = "SUCCESS";
      String resultMsg = "조회 성공";
      LgnInfoModel resultModel;
      if(paramMap.get("lgn_id") == null){
         // 사용자 id 조회
         resultModel = loginService.selectFindId(paramMap);
      }else{
         // 사용자 pw 조회
         resultModel = loginService.selectFindPw(paramMap);
      }
      
      Map<String, Object> resultMap = new HashMap<String, Object>();
      resultMap.put("result", result);
      resultMap.put("resultMsg", resultMsg);
      resultMap.put("resultModel", resultModel);
      
      logger.info("+ End " + className + ".selectFindInfo");
      
      return resultMap;
   }
   

}