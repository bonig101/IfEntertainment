package kr.or.ddit.util;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import kr.or.ddit.service.common.ISignService;
import kr.or.ddit.service.impl.common.SignServiceImpl;

/**
 * 방문자수를 카운팅 하기 위해 HttpSessionListener 인터페이스를 구현한 클래스를 만든다.
 * @author 홍진영
 */
public class SessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
		ISignService signService = new SignServiceImpl();
         
        // 전체 방문자 수 +1
		signService.setVisitTotalCount();
         
        // 오늘 방문자 수
        int todayCount = signService.getVisitTodayCount();
         
        // 전체 방문자 수
        int totalCount = signService.getVisitTotalCount();
         
        HttpSession session = se.getSession();
         
        // 세션 속성에 담아준다.
        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}
}
