package kr.happyjob.chainmaker.epc.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString

public class ProductDetailModel {
	
		
			// 모델번호
			private String pro_cod_num;
			// 장비구분
			private String pro_cod;

			// 제조사
			private String pro_manu_nm;
			
			//상세 코드
			private String detail_code;
			
			//상세 이름
			private String detail_name;
			
	
}
