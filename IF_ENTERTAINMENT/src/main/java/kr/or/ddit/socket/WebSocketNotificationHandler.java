package kr.or.ddit.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 웹소켓 알림 관련 핸들러
 * 
 * @author 성이수
 */
@Slf4j
@Component
@RequiredArgsConstructor
@ServerEndpoint(value = "/notiserver/{id}")
public class WebSocketNotificationHandler {
	// 웹 실시간 알림을 처리하기 위한 핸들러
	// 실시간 알림이 필요한 각 분야에서 해당 핸들러 호출하여 실시간 알림 보낼 수 있도록
	// 클라이언트가 서버에 연결할때 호출되는 메서드

	private static Map<String, Session> sessionList = new HashMap<String, Session>();

	// 로그인시 들어온 세션을 map으로 관리
	@OnOpen
	public void handleOpen(Session session, @PathParam("id") String id) {
		log.info("session들어옴 : {}", session);
		// 로그인한 사용자의 아이디를 통해 Connect된 소켓정보를 Map으로 관리
		sessionList.put(id, session);

	}

	// 이벤트가 발생했을때 넘어옴(클라이언트에서 send)
	@OnMessage
	public void handleMessage(String msg, Session session) throws IOException {

		log.info("send된 데이터 {}", msg);

		JsonParser jp = new JsonParser();
		JsonObject eleObj = jp.parse(msg).getAsJsonObject(); // 전체 json 데이터

		log.info("넘어온 json {}", eleObj);
		
		//아티스트 피드 알림 부분 
		List<String> joinedList = new ArrayList<String>();
		if (eleObj.get("type").getAsString().equals("ArtistFeed")) {
			JsonArray feedJoinedList = eleObj.get("receiver").getAsJsonArray();
			for (JsonElement element : feedJoinedList) {
				joinedList.add(element.getAsString());
			}
		}
		
		String type = eleObj.get("type").getAsString(); // 기준이 되는 타입을 꺼냄
		log.info("넘어온 type : {}", type);

		if (type.equals("goodsInquiry")) {
			try {
				inquiry(eleObj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(type.equals("ArtistFeed")){
			try {
				ArtistFeed(joinedList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(type.equals("Collection")){
			try {
				Collection(eleObj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 컬렉션 구매금액 달성에 대한 알림
	 * @param eleObj
	 */
	private void Collection(JsonObject eleObj) {
		log.info("### eleObj : {}", eleObj);

		String userId = eleObj.get("receiver").getAsString();
		log.info("userId : {} ", userId);

		Set<String> keySetList = sessionList.keySet();
		Iterator<String> ite = keySetList.iterator();
		while (ite.hasNext()) {
			String key = ite.next();
			log.info("핸들러에서 뽑은 key : " + key);
			Session sess = sessionList.get(key);
			log.info("세션정보 : " + sess.getId());
			if (key.equals(userId)) {
				try {
					sess.getBasicRemote().sendText("컬렉션 업적이 달성 되었어요!");
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			}
		}
	}

	/**
	 * 아티스트 피드 업로드에 대한 알림
	 * @param joinedList
	 */
	private void ArtistFeed(List<String> joinedList) {
		
		log.info("### eleObj : {}", joinedList);
		
		for (String userId : joinedList) {
			Set<String> keySetList = sessionList.keySet();
			Iterator<String> ite = keySetList.iterator();
			while (ite.hasNext()) {
				String key = ite.next();
				log.info("핸들러에서 뽑은 key : " + key);
				Session sess = sessionList.get(key);
				log.info("세션정보 : " + sess.getId());
				if (key.equals(userId)) {
					try {
						sess.getBasicRemote().sendText("아티스트피드에 새로운 게시글이 등록 되었어요!");
					} catch (Exception e) {
						e.printStackTrace();
					}
					break;
				}
			}
		}
		
	}

	/**
	 * 1:1문의 답변에 대한 알림
	 * 
	 * @param eleObj
	 * @param session
	 */
	private void inquiry(JsonObject eleObj) {

		log.info("### eleObj : {}", eleObj);

		String userId = eleObj.get("userId").getAsString();
		log.info("userId : {} ", userId);

		Set<String> keySetList = sessionList.keySet();
		Iterator<String> ite = keySetList.iterator();
		while (ite.hasNext()) {
			String key = ite.next();
			log.info("핸들러에서 뽑은 key : " + key);
			Session sess = sessionList.get(key);
			log.info("세션정보 : " + sess.getId());
			if (key.equals(userId)) {
				try {
					sess.getBasicRemote().sendText("1:1문의에 답변이 등록되었어요!");
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			}
		}
	}

	@OnClose
	public void handleClose(Session session) {
		sessionList.remove(session);
	}

	@OnError
	public void handleError(Throwable t) {

	}

}
