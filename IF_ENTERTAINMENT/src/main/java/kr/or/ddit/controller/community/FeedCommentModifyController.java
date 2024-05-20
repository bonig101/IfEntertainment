package kr.or.ddit.controller.community;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.vo.community.FeedCommentVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 피드 댓글 수정 컨트롤러
 * @author 임민혁
 */
@Controller
@Slf4j
@RequestMapping("/community/feed/comment")
public class FeedCommentModifyController {
	
	// 본인이 작성한 댓글만 삭제가 가능하되
	// 관리자는 모든 댓글을 삭제할 수 있도록 권한 설정(스프링 시큐리티)

	@Inject
	private IFeedService feedService;
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value="/updateComment.do" , method = RequestMethod.POST)
	public ResponseEntity<String>updateComment(@RequestBody FeedCommentVO commentVO,Model model){
		System.out.println("commentVOcommentVOcommentVOcommentVO"+commentVO);
		String comment = feedService.selectComment(commentVO);
		feedService.updateComment(commentVO);
		model.addAttribute("comment",comment);
		
		return new ResponseEntity<String>(comment,HttpStatus.OK);
		
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value="/commentDelete.do" , method = RequestMethod.POST)
	public ResponseEntity<String> feedCommentDelete(@RequestBody FeedCommentVO commentVO ) {
		log.info("commentVOcommentVO",commentVO);
		String comment = feedService.selectComment(commentVO);
		feedService.deleteComment(commentVO);
		
		return new ResponseEntity<String>(comment,HttpStatus.OK);
	}
	
	@RequestMapping(value="/update.do" , method = RequestMethod.POST)
	public ResponseEntity<String>adupdateComment(@RequestBody FeedCommentVO commentVO){
		
		feedService.updateComment(commentVO);
		
		return new ResponseEntity<String>(HttpStatus.OK);
		
	}
	
	
	
	@RequestMapping(value="/delete.do" , method = RequestMethod.POST)
	public ResponseEntity<String> deleteComment(@RequestBody FeedCommentVO commentVO ) {

		feedService.deleteComment(commentVO);
		
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
	
}
