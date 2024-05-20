package kr.or.ddit.vo.community;

import java.util.List;
import java.util.Map;

import lombok.Data;

/**
 * 한 설문지에 담길 질문들을 담을 VO
 * @author 홍진영
 */
@Data
public class SurveyQuestionVO {
	private int sqNo;			// 질문번호
	private String sqTitle;		// 질문제목
	private String sqType;		// 질문타입
	private int sfNo;			// 설문번호
	
	// 옵션 리스트
	private List<SurveyOptionVO> optionList;
	
	// 옵션에 체크된 카운트 리스트
	private List<Integer> cntList;
	
}


