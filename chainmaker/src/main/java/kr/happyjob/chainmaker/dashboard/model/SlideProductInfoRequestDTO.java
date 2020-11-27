package kr.happyjob.chainmaker.dashboard.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class SlideProductInfoRequestDTO {

	private String detail_name;
	private String result;
	private String msg;
}
