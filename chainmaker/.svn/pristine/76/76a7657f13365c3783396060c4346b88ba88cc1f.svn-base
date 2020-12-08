package kr.happyjob.chainmaker.epc.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.chainmaker.epc.model.ShoppingCartModel;
import kr.happyjob.chainmaker.epc.service.ShoppingCartService;
import kr.happyjob.chainmaker.scm.model.UserInfoModel;


@Controller
@RequestMapping("/epc/")
public class ShoppingCartController {
	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	@RequestMapping("ShoppingCart.do")
	public String shoppingCart(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception
	{
		logger.info("장바구니 페이지");
		return "epc/ShoppingCart";
	}
	
	@RequestMapping("ShoppingCartList.do")
	@ResponseBody
	public Map<String, Object> shoppingCartList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception
	{
		logger.info("+ Start " + className + ".listcart");
		logger.info("   - paramMap : " + paramMap);
		
				
		paramMap.put("loginID", session.getAttribute("loginId")); // 세션에 있는 로그인아이디 put
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		// 장바구니 조회
		List<ShoppingCartModel> listCart = shoppingCartService.listCart(paramMap);
		resultMap.put("listCart", listCart);
		
		// 장바구니 카운트 조회
		int totalCount = shoppingCartService.countListCart(paramMap);
		resultMap.put("totalCount", totalCount);
		
		logger.info("+ End " + className + ".listunstudent");

		return resultMap;
	}
	
	
	// 장바구니 삭제
	@RequestMapping("delCart.do")
	@ResponseBody
	public Map<String, Object> delCart(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".delcart");
		logger.info("   - paramMap : " + paramMap);
		
		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		

		shoppingCartService.delcart(paramMap);

		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".delcart");
		
		return resultMap;
	}
	
	// 날짜 변경
	@RequestMapping("updCart.do")
	@ResponseBody
	public Map<String, Object> basketUpdateDate(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".basketUpdateDate");
		logger.info("   - paramMap : " + paramMap);
		
		String result = "SUCCESS";
		String resultMsg = "날짜 업뎃 되었습니다.";
		
		System.out.println(paramMap);

		shoppingCartService.basketUpdateDate(paramMap);

		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".basketUpdateDate");
		
		return resultMap;
	}
	
	// 수량 변경
		@RequestMapping("updCartQty.do")
		@ResponseBody
		public Map<String, Object> basketUpdateQty(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			logger.info("+ Start " + className + ".basketUpdateQty");
			logger.info("   - paramMap : " + paramMap);
			
			String result = "SUCCESS";
			String resultMsg = "수량이 변경 되었습니다.";
			
			System.out.println(paramMap);

			shoppingCartService.basketUpdateQty(paramMap);

			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
			
			logger.info("+ End " + className + ".basketUpdateQty");
			
			return resultMap;
		}
	
	  //카트에서 주문하기
    @ResponseBody
    @PostMapping(value = "/cartorder.do")
   public Object orderPage(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, ShoppingCartModel cartmodel, Map<String, Object> paramMap ,Model model) throws Exception {
  
    	
    	ArrayList<ShoppingCartModel> list = new ArrayList<ShoppingCartModel>();
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	int order_no = 0;
		String result = "SUCCESS";
		String resultMsg = "주문이 완료되었습니다.";
    	System.out.println("=chArr=");
    	// 장바구니 보낼때
    	for(String bno : chArr) {
    		ShoppingCartModel cartModel = new ShoppingCartModel();
    		cartModel.setBas_no(bno);
    		
    		logger.info("cartModel >> " + cartModel);
    		
    		list.add(cartModel);
    	}
    	
    	logger.info("mybatis list >> " + list);
    	
    	
		// order 테이블 seq 조회
    	
    	Map<String, Object> selectMap = new HashMap<String, Object>();
//    	order_no = shoppingCartService.selectSeq(selectMap);
    	
    	selectMap.put("basNoList", list);
//    	selectMap.put("order_no", order_no);
    	
    	shoppingCartService.basketOrder(selectMap);
    	shoppingCartService.deleteBasket(selectMap);
        
    	System.out.println(list);
    	
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
    	
        return resultMap;
   }
    
	  //카트에서 주문하기
    @ResponseBody
    @PostMapping(value = "/selectBasketDelete.do")
   public Object selectBasketDelete(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, ShoppingCartModel cartmodel, Map<String, Object> paramMap ,Model model) throws Exception {
  
    	
    	ArrayList<ShoppingCartModel> list = new ArrayList<ShoppingCartModel>();
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	int order_no = 0;
		String result = "SUCCESS";
		String resultMsg = "삭제가 완료되었습니다.";
    	System.out.println("=chArr=");
    	// 장바구니 보낼때
    	for(String bno : chArr) {
    		ShoppingCartModel cartModel = new ShoppingCartModel();
    		cartModel.setBas_no(bno);
    		
    		logger.info("cartModel >> " + cartModel);
    		
    		list.add(cartModel);
    	}
    	
    	logger.info("mybatis list >> " + list);
    	
    	
		// order 테이블 seq 조회
    	
    	Map<String, Object> selectMap = new HashMap<String, Object>();
//    	order_no = shoppingCartService.selectSeq(selectMap);
    	
    	selectMap.put("basNoList", list);
//    	selectMap.put("order_no", order_no);
    	
    	shoppingCartService.deleteBasket(selectMap);
        
    	System.out.println(list);
    	
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
    	
        return resultMap;
   }
    
    
    
    /* 회원 상세 정보 뿌리기 */
	@RequestMapping("adminBank.do")
	@ResponseBody
	public Map<String,Object> adminBank(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		  logger.info("+ Start " + className + ".adminBank");
		  logger.info("   - paramMap : " + paramMap);
		  
		String result="";
		
		// 선택된 회원 1건 조회 
		UserInfoModel adminBank = shoppingCartService.adminBank(paramMap);
		//List<CommentsVO> comments = null;
	
		if(adminBank != null) {
			
			result = "SUCCESS";  // 성공시 찍습니다. 
			
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", adminBank); // 리턴 값 해쉬에 담기 
		//resultMap.put("resultComments", comments);
		resultMap.put("resultMsg", result); // success 용어 담기 
		
		System.out.println("결과 글 찍어봅세 " + result);
		System.out.println("결과 글 찍어봅세 " + adminBank);
		
		logger.info("+ End " + className + ".adminBank");
		
		return resultMap;
	}
	
}
