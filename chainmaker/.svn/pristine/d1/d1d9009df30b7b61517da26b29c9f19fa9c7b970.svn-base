package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.scm.dao.ProductInfoDao;
import kr.happyjob.chainmaker.scm.model.ProductInfo;

@Service
public class ProductInfoServiceImpl implements ProductInfoService {

	@Autowired
	ProductInfoDao dao;
	
	@Override
	public List<ProductInfo> selectProductInfo() {
		// TODO Auto-generated method stub
		
		List<ProductInfo> list = dao.selectProductInfo();
		
		return list;
	}
	
	@Override
	public int countProductInfo() {
		// TODO Auto-generated method stub
		
		int count = dao.countProductInfo();
		
		return count;
	}

	@Override
	public ProductInfo selectProductDetail(Map<String, Object> paramMap) {
		ProductInfo detail = dao.selectProductDetail(paramMap);
		return detail;
	}

}
