package kr.or.ddit.controller.community;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.community.FeedReportVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 피드 신고 컨트롤러
 * @author 임민혁
 */
@Controller
@Slf4j
@RequestMapping("/community/feed")
public class ReportFeedController {
	// 신고사유 셀렉트 박스에 하드코딩될 내용
	// 1. 이용 가이드라인 위반
	// 2. 선정/폭력성
	// 3. 스팸/광고/도배글
	// 4. 기타
	// 상세 내용도 적을 수 있음 (null 허용 적어도되고 안적어도됨)
	
	@Inject
	private IFeedService feedService;
	
	
	@RequestMapping(value="/feedReport.do", method=RequestMethod.POST)
	public ResponseEntity<String> feedReport(@RequestBody FeedReportVO feedReportVO, Model model){
		if(feedReportVO != null && feedReportVO.getReportType() !=null) {
			feedService.feedReport(feedReportVO);
		}
		
		return new ResponseEntity<String>(HttpStatus.OK);
	}
}
