package kr.or.ddit.vo.goods;

import lombok.Data;

@Data
public class goodsInquiryVO {
	 private int giNo;
	 private String giType;
	 private String giTitle;
	 private String giContent;
	 private String giRegdate;
	 private String giReply;
	 private String giAnsdate;
	 private int userNo;
	 
	 //문의한 아이디를 불러오기위한 필드
	 private String userId;
}
