package kr.or.ddit.controller.community;

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

import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.vo.community.FeedCommentVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 피드 댓글 등록 컨트롤러
 * @author 임민혁
 */
@Controller
@Slf4j
@RequestMapping("/community/feed/comment")
public class FeedCommentInsertController {
	// 아티스트가 쓴 댓글을 팬피드 상단에 최신작성일 순으로 배치 
	
	@Inject
	private IFeedService feedService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value="/insert.do", method = RequestMethod.POST)
	public ResponseEntity<String> feedinsert(FeedCommentVO feedComVO, HttpServletRequest req,
			Model model,
			RedirectAttributes ra) {
		log.info("feedComVOfeedComVO",feedComVO);
		if(feedComVO !=null) {
		feedComVO.setFcDelyn("N");
		feedService.insertFeedComment(feedComVO);
		}
		return new ResponseEntity<String>(HttpStatus.OK);
	}
	
}
