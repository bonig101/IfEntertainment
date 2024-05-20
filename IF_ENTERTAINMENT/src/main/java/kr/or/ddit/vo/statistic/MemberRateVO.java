package kr.or.ddit.vo.statistic;

import lombok.Data;

/**
 * 성별 & 연령별 비율 결과를 담기 위한 VO 
 * @author 홍진영
 */
@Data
public class MemberRateVO {
	private String ageGroup;	// 연령대
	private int femaleCount;	// 여성회원 수
	private int maleCount;		// 남성회원 수
	
	private String agId; 		// 아티스트 그룹아이디
	private int totalCount;		// 남성,여성 수
	
	
}
