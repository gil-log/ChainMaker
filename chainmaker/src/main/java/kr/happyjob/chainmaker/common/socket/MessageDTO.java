package kr.happyjob.chainmaker.common.socket;

import lombok.NoArgsConstructor;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class MessageDTO {

	private String name;
	private String content;
	
}
