package kr.happyjob.chainmaker.epc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.happyjob.chainmaker.epc.model.ShoppingCartModel;
import kr.happyjob.chainmaker.scm.model.UserInfoModel;

public interface ShoppingCartDao {
	
	public List<ShoppingCartModel> listCart(Map<String, Object> paramMap) throws Exception;
	
	public int countListCart(Map<String, Object> paramMap) throws Exception;
	
	public void delcart(Map<String, Object> paramMap) throws Exception;
	// 날짜 변경
	public void basketUpdateDate(Map<String, Object> paramMap) throws Exception;
	// 수량 변경
	public void basketUpdateQty(Map<String, Object> paramMap) throws Exception;
	
	// 장바구니 -> 주문하기
	public void basketOrder(@Param("param") Map<String, Object> list) throws Exception;
	
	// order 테이블 pk seq 구하기
	public int selectSeq(Map<String, Object> paramMap) throws Exception;
	
	public void deleteBasket(@Param("param") Map<String, Object> map) throws Exception;
	
	public UserInfoModel adminBank(Map<String, Object> paramMap) throws Exception;

}
