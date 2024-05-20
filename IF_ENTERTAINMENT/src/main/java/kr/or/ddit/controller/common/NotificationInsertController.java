package kr.or.ddit.controller.common;

import javax.inject.Inject;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.common.INotificationService;
import lombok.extern.slf4j.Slf4j;

/**
 * 웹소켓을 사용한 실시간 알림 / 이메일알림 / SMS 알림
 * @author 성이수
 */
@Controller
@Slf4j
@RequestMapping("")
public class NotificationInsertController {
	// 각 알림이 필요한 부분에서 알림을 보낸 정보를 DB(NOTIFICATION 테이블)에 저장한다.
	// 비동기로 처리해서 리턴되는 페이지는 없고 데이터만 DB에 저장 될 수 있도록
	
	@Inject
	private INotificationService notiService;
	
	
}
