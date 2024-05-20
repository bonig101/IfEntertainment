package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.common.IWebSocketSevice;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.NotificationVO;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/socket")
@Slf4j
public class WebSocketController {
	
	@Inject
	private IWebSocketSevice webSocketService;
	
	@ResponseBody
	@RequestMapping(value="/selectCommunityJoinid.do", method = RequestMethod.GET)
	public ResponseEntity<List<String>> selectFeedJoined(String agId){
	
		List<String> FeedJoinedList = webSocketService.selectFeedJoinedList(agId);
		
		log.info("FeedJoinedList : {}", FeedJoinedList);
		
		return new ResponseEntity<List<String>>(FeedJoinedList, HttpStatus.OK);
	}
	
	
	/**
	 * 아티스트 피드에 대한 알림 insert컨트롤러
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/ArtistFeedinsertAlarm.do", method = RequestMethod.POST)
	public ResponseEntity<String> ArtistalarmEvent(@RequestBody Map<String, Object> map){
		
		log.info("agId : {} ", map.get("agId"));
		log.info("type : {} ", map.get("type"));
		
		NotificationVO notiVO = new NotificationVO();
		
		
		List<String> joindidList = (List<String>) map.get("receiver");
		
		log.info("@@joindidList  : {}", joindidList);
		
		ServiceResult result = null;
		String agId = (String) map.get("agId");
		for (String joindId : joindidList) {
			notiVO.setNotiSender((String) map.get("agId"));
			notiVO.setNotiReciever(joindId);
			notiVO.setNotiType((String) map.get("type"));
			notiVO.setNotiUrl("/community/artist?agId="+ agId);
			notiVO.setNotiContent("아티스트 피드에 새로운 게시글이 등록 되었습니다.");
			
			result = webSocketService.insertInquiry(notiVO);
		}
		return new ResponseEntity<String>(result.toString(), HttpStatus.OK);
	}
	
	/**
	 * 1:1문의 답변에 대한 알림 insert컨트롤러
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/insertAlarm.do", method = RequestMethod.POST)
	public ResponseEntity<String> alarmEvent(@RequestBody Map<String, String> map){
		
		NotificationVO notiVO = new NotificationVO();
		notiVO.setNotiSender("admin001");
		notiVO.setNotiReciever(map.get("userId"));
		notiVO.setNotiType(map.get("type"));
		notiVO.setNotiUrl("/goods/inquiry/userlist.do");
		String status = map.get("status");
		if (status.equals("등록")) {
			notiVO.setNotiContent("1:1문의 답변이 등록되었습니다.");
		} else {
			notiVO.setNotiContent("1:1문의 답변이 수정되었습니다.");
		}
		ServiceResult result = webSocketService.insertInquiry(notiVO);
		return new ResponseEntity<String>(result.toString(), HttpStatus.OK);
	}
	
	/**
	 * 읽지 않은 알림 리스트를 불러오는 컨트롤러
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/selectAlarm.do", method = RequestMethod.GET)
	public ResponseEntity<List<NotificationVO>> selectAlarmList(String userId){
		
		List<NotificationVO> AlarmList = webSocketService.selectAlarmList(userId);
		
		return new ResponseEntity<List<NotificationVO>>(AlarmList, HttpStatus.OK);
	}
	
	/**
	 * 알림 리스트 클릭시 읽음 처리 되는 컨트롤러
	 * @param notiNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/updateReadAlarm.do", method = RequestMethod.POST)
	public  ResponseEntity<ServiceResult> updateReadAlarm(int notiNo){
		
		ResponseEntity<ServiceResult> entity = null;
		
		ServiceResult result = webSocketService.updateReadAlarm(notiNo);

		if (result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<ServiceResult>(ServiceResult.OK, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<ServiceResult>(ServiceResult.FAILED, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}