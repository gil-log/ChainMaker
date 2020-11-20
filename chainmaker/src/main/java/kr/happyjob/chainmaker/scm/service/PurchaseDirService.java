package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.PurchaseDirectionModel;

public interface PurchaseDirService {
	
	public List<PurchaseDirectionModel>selectDirection(Map<String, Object> paramMap);
	public int countDirection(Map<String, Object> paramMap);
}
