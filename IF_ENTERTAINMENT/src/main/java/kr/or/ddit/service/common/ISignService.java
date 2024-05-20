package kr.or.ddit.service.common;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.UserVO;

public interface ISignService {

	public ServiceResult idCheck(String user_Id);

	public ServiceResult signup(HttpServletRequest req, UserVO userVO) throws Exception;

//	public String findEmail(UserVO userVO);

	public UserVO findId(UserVO userVO);

	public String findPw(UserVO userVO);

//	public void changePw(UserVO userVO);

	public void changePw(UserVO userVO);

//	public String findEmail(String userId, String userName, String memberTelno);

	// 방문자 관련 
	public void setVisitTotalCount();
	public int getVisitTodayCount();
	public int getVisitTotalCount();

}
