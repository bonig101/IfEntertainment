package kr.or.ddit.vo.community;

import lombok.Data;

/**
 * 한 질문에 담길 옵션(보기)들을 담을 VO
 * @author 홍진영
 */
@Data
public class SurveyOptionVO {
	private int soNo;			// 옵션번호
	private String soContent;	// 옵션내용
	private int sqNo;			// 질문번호
	
	private int cnt;
}
