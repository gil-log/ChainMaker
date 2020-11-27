package kr.happyjob.chainmaker.dashboard.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@EqualsAndHashCode(of= {"detail_code"})
public class ProductCategoryVO {

	private String detail_code;
	private String detail_name;
}
