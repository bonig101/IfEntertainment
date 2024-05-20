package kr.or.ddit.vo.community;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
 * 사용자가 설문을 실시한 내용이 담길 VO
 * @author 홍진영
 */
@Data
public class SurveyVO {
	private int surveyNo;			// 설문실시 번호(시퀀스)
	@DateTimeFormat(pattern = "yy-MM-dd")
	private Date surveyRegdate;		// 설문 실시일
	private int userNo;				// 설문 실시자
	private int sfNo;				// 설문 번호
	
	private List<SurveyResultVO> surveyResultList;
}
