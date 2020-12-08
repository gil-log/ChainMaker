package kr.happyjob.chainmaker.dlm.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class StockProcessingResponseDTO {

	private String result;
	private String msg;
}
