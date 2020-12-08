package kr.happyjob.chainmaker.epc.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.epc.model.ShoppingCartModel;
import kr.happyjob.chainmaker.scm.model.UserInfoModel;

public interface ShoppingCartService {
	public List<ShoppingCartModel> listCart(Map<String, Object> paramMap) throws Exception;
	
	public int countListCart(Map<String, Object> paramMap) throws Exception;
	
	public void delcart(Map<String, Object> paramMap) throws Exception;
	
	public void basketUpdateDate(Map<String, Object> paramMap) throws Exception;
	
	public void basketUpdateQty(Map<String, Object> paramMap) throws Exception;
	
	public void basketOrder(Map<String, Object> map) throws Exception;
	
	public int selectSeq(Map<String, Object> paramMap) throws Exception;
	
	public void deleteBasket(Map<String, Object> map) throws Exception;
	
	public UserInfoModel adminBank(Map<String, Object> paramMap) throws Exception;

}
