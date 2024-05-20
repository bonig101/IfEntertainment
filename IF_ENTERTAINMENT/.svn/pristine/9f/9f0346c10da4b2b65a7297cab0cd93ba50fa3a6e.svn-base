package kr.or.ddit.controller.community;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.vo.community.FeedVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 피드 삭제 컨트롤러
 * @author 임민혁
 */
@Controller
@Slf4j
@RequestMapping("/community/feed")
public class FeedDeleteController {

	
	@Inject
	private IFeedService feedService;
	
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value="/feedDelete.do" , method = RequestMethod.POST)
	public ResponseEntity<String> artistDeleteFeed(@RequestBody FeedVO feedVO ) {
		log.info("feedVOfeedVO{}",feedVO);
		
		System.out.println("feedVOfeedVO"+feedVO);
		
		feedService.deleteFeed(feedVO);
		
		
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
	@RequestMapping(value="/delete.do" , method = RequestMethod.POST)
	public ResponseEntity<String> deleteFeed(@RequestBody FeedVO feedVO ) {
	
		feedService.deleteFeed(feedVO);
		
		
		return new ResponseEntity<String>(HttpStatus.OK);
	}
}
