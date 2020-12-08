package kr.happyjob.chainmaker.epc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.epc.dao.ShoppingCartDao;
import kr.happyjob.chainmaker.epc.model.ShoppingCartModel;
import kr.happyjob.chainmaker.scm.model.UserInfoModel;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	
	@Autowired
	ShoppingCartDao cartDao;

	@Override
	public List<ShoppingCartModel> listCart(Map<String, Object> paramMap) throws Exception {
		List<ShoppingCartModel> listCart = cartDao.listCart(paramMap);
		return listCart;
	}

	@Override
	public int countListCart(Map<String, Object> paramMap) throws Exception {
		int totalCnt = cartDao.countListCart(paramMap);
		
		return totalCnt;
	}
	
	@Override
	public void delcart(Map<String, Object> paramMap) throws Exception {
		cartDao.delcart(paramMap);
		return;
		
	}
	
	@Override
	public void basketUpdateDate(Map<String, Object> paramMap) throws Exception {
		cartDao.basketUpdateDate(paramMap);
		
	}
	
	@Override
	public void basketUpdateQty(Map<String, Object> paramMap) throws Exception {
		cartDao.basketUpdateQty(paramMap);
		
	}

	@Override
	public void basketOrder(Map<String, Object> map) throws Exception {
		cartDao.basketOrder(map);
	}
	
	@Override
	public int selectSeq(Map<String, Object> paramMap) throws Exception {
		int seq = cartDao.selectSeq(paramMap);
		return seq;
	}
	
	@Override
	public void deleteBasket(Map<String, Object> map) throws Exception {
		cartDao.deleteBasket(map);
		
	}
	
	@Override
	public UserInfoModel adminBank(Map<String, Object> paramMap) throws Exception {
		UserInfoModel adminBank = cartDao.adminBank(paramMap);
		
		return adminBank;
	}
}
