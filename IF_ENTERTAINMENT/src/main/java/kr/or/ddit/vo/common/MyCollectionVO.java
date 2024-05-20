package kr.or.ddit.vo.common;

import lombok.Data;

/**
 * 나의 달성 컬렉션 정보를 담기위한 VO 
 * @author PC-23
 */
@Data
public class MyCollectionVO {

	private int ctId;				// 컬렉션 아이디
	private String ctName; 			// 컬렉션 명
	private String ctGoal; 			// 컬렉션 달성조건
	
	private String collectionNo;	// 컬렉션 달성 번호
	private String collectionDone;	// 컬렉션 달성 여부
	private String collectionDate;	// 컬렉션 달성일
	private int userNo;				// 사용자 번호
	
}
