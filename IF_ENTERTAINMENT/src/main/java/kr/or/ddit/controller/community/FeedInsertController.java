package kr.or.ddit.controller.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.common.IWebSocketSevice;
import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.NotificationVO;
import kr.or.ddit.vo.community.FeedAttachFileVO;
import kr.or.ddit.vo.community.FeedVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 피드 등록 컨트롤러
 * @author 임민혁
 */
@Controller
@Slf4j
@RequestMapping("/community/feed")
public class FeedInsertController {
	
	@Inject
	private IFeedService feedService;
	
	@Inject
	private IWebSocketSevice webSocketService;
	
	// 아티스트는 피드를 등록할 때 멤버십 전용만 보이게 할지 여부를 체크할 수 있다.
	
	// 아티스트가 피드를 등록할 경우 해당 커뮤니티에 가입된 사용자 들에게 실시간 알림을 전송한다.(성이수) 

	
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value="/insert.do", method = RequestMethod.POST)
	public ResponseEntity<?> feedinsert(FeedVO feedVO, HttpServletRequest req) {
		
		System.out.println("feedVOfeedVOfeedVOfeedVO123"+feedVO);
		String userType = feedVO.getUserType();
		if ("2".equals(userType)) {
		    feedVO.setFeedType("1");
		    feedVO.setFeedDelyn("N");
		} else {
		    feedVO.setFeedType("2");
		    feedVO.setFeedDelyn("N");
		}
		
	    ServiceResult result = feedService.insertFeed(req, feedVO);
	    
	    //아티스트 커뮤니티에 가입된 아이디를 불러오는 리스트
	    List<String> FeedJoinedList = webSocketService.selectFeedJoinedList(feedVO.getAgId());
	    
	    NotificationVO notiVO = new NotificationVO();
	    for (String userId : FeedJoinedList) {
	    	String agId = feedVO.getAgId();
	    	notiVO.setNotiSender(agId);
	    	notiVO.setNotiReciever(userId);
	    	notiVO.setNotiType(feedVO.getType());
	    	notiVO.setNotiUrl("/community/artist?agId="+agId+"&userType=3");
	    	notiVO.setNotiContent("아티스트 피드에 새로운 게시글이 등록 되었습니다.");
	    	
	    	result = webSocketService.insertInquiry(notiVO);
		}
	    
		Map<String, Object> response = new HashMap<>();
	    if(result.equals(ServiceResult.OK)) {
	    	response.put("FeedJoinedList", FeedJoinedList);
	        response.put("message", "게시글 등록이 성공했습니다!");
	        response.put("redirectUrl", "/community/artist?agId=" + feedVO.getAgId());
	    } else {
	        response.put("error", "서버에러, 다시 시도해주세요!");
	    }

	    return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	
//	
//	@RequestMapping(value="/insert.do",method = RequestMethod.POST)
//	public String feedinsert(FeedVO feedVO, Model model,
//			RedirectAttributes ra, HttpServletRequest req) {
//		
//			log.info("Received FeedVO: {}",feedVO);
//			String goPage ="";
//
//				
//				
////				CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
////				UserVO userVO = user.getUser();
//				if(true) {
////				if(userVO != null) { 
////					FeedVO.setUserNo(userVO.getUserNo());
//					//임시 하드코딩
//					feedVO.setFeedType("1");
//					feedVO.setFeedDelyn("N");
//					log.info("Received FeedVO: {}",feedVO);
//					
//					ServiceResult result = feedService.insertFeed(req, feedVO);
//					if(result.equals(ServiceResult.OK)) {
//						ra.addFlashAttribute("message", "게시글 등록이 성공했습니다!");
//						goPage = "redirect:/community/artist?agId="+feedVO.getAgId();
//					} else {
//						model.addAttribute("message", "서버에러, 다시 시도해주세요!");
//						model.addAttribute("FeedVO", feedVO);
//						goPage = "/communuty/artist?agId="+feedVO.getAgId();
//					}
//				} 
//			return goPage;
//		}
//	
//	
	
	@RequestMapping(value="/upload.do",method = RequestMethod.GET)
	public String feedFile(FeedAttachFileVO file) {
		return "admin/community/insert";
	}
	

	
	
	@RequestMapping(value="/upload.do",method = RequestMethod.POST)
	public String feedFileInsert(FeedVO feedVO, Model model,
			RedirectAttributes ra, HttpServletRequest req
			) {
		String goPage ="";
		
		log.info("넘어온 FeedVO : " + feedVO);
		
		List<FeedAttachFileVO> feedList = new ArrayList<FeedAttachFileVO>();
		
		feedList.add(new FeedAttachFileVO(feedVO.getFeedFile()));
		
		feedVO.setFeedFileList(feedList);
		
		Map<String, String> errors = new HashMap<String, String>();
		
		
		if(errors.size() > 0) { 
			model.addAttribute("errors", errors);
			model.addAttribute("FeedVO", feedVO);
			goPage = "admin/community/insert";
			
		} else { 
			
			
//			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//			UserVO userVO = user.getUser();
			if(true) {
//			if(userVO != null) { 
//				FeedVO.setUserNo(userVO.getUserNo());
				//임시 하드코딩
				feedVO.setUserNo(30);
				feedVO.setFeedMembership("0");
				feedVO.setFeedType("1");
				feedVO.setAgId("5");
				feedVO.setFeedDelyn("N");
				
				
				ServiceResult result = feedService.insertFeed(req, feedVO);
				if(result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "게시글 등록이 성공했습니다!");
					goPage = "redirect:/community/feed/admin/list.do";
				} else {
					model.addAttribute("message", "서버에러, 다시 시도해주세요!");
					model.addAttribute("FeedVO", feedVO);
					goPage = "admin/communuty/insert";
				}
			} else {
				ra.addFlashAttribute("message", "로그인 후에 사용 가능합니다!");
				goPage="redirect:/signin.do";
			}
		}
		
		return goPage;
	}
}
