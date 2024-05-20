package kr.or.ddit.vo.common;

import lombok.Data;

@Data
public class Noti_TypeVO {

	private int ntNo;
	private String ntSms;
	private String ntEmail;
	private String ntWeb;
	private int userNo;
	private String field;
}
