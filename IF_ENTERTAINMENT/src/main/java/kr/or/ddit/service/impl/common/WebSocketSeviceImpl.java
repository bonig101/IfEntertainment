package kr.or.ddit.service.impl.common;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.common.IWebSocketMapper;
import kr.or.ddit.service.common.IWebSocketSevice;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.NotificationVO;

@Service
public class WebSocketSeviceImpl implements IWebSocketSevice {
	
	public WebSocketSeviceImpl() {
		System.out.println("WebSocketSeviceImpl  생성자 호출됨....");
	}
	
	@Inject
	private IWebSocketMapper websocketMapper;

	@Override
	public ServiceResult insertInquiry(NotificationVO notificationVO) {
		ServiceResult result = null;
		
		int status = websocketMapper.insertInquiry(notificationVO);
		
		if (status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<NotificationVO> selectAlarmList(String userId) {
		return websocketMapper.selectAlarmList(userId);
	}

	@Override
	public ServiceResult updateReadAlarm(int notiNo) {
		ServiceResult result = null;
		
		int status = websocketMapper.updateReadAlarm(notiNo);
		if (status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<String> selectFeedJoinedList(String agId) {
		return websocketMapper.selectFeedJoinedList(agId);
	}

}
