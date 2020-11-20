package kr.happyjob.chainmaker.scm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.PurchaseDirectionModel;

public interface PurchaseDirDao {

	List<PurchaseDirectionModel> selectDirection(Map<String, Object> paramMap);
	int countDirection(Map<String, Object> paramMap);
}
