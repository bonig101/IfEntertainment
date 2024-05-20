package kr.or.ddit.controller.entertain;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.entertain.IAuditionService;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.entertain.AuditionBoardVO;
import kr.or.ddit.vo.entertain.CompanyNoticeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 오디션 일정 조회 컨트롤러
 * @author 이수진
 */
@Controller
@Slf4j
@RequestMapping("/entertain/audition")
public class AuditionNoticeRetrieveController {

	@Inject
	private IAuditionService auditionService;
	
	@RequestMapping(value = "/scheduleList.do")
	public String auditionScheduleList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		PaginationInfoVO<AuditionBoardVO> pagingVO = new PaginationInfoVO<AuditionBoardVO>();

		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = auditionService.selectNoticeCount(pagingVO);

		pagingVO.setTotalRecord(totalRecord);
//		log.info("currentPagecurrentPagecurrentPage : {} ", currentPage);
//		log.info("totalRecordtotalRecordtotalRecord : {}", totalRecord);

		List<AuditionBoardVO> dataList = auditionService.auditionScheduleList(pagingVO);
		pagingVO.setDataList(dataList);
//		log.info("dataList : {}", dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("sideName", "audition");
		
		return "entertain/auditionScheduleList";
	}
	
	@RequestMapping(value = "/scheduleDetail.do", method = RequestMethod.GET)
	public String auditionScheduleDetail(int bfNo, Model model) {
		AuditionBoardVO auditionBoardVO = auditionService.auditionScheduleDetail(bfNo);
		model.addAttribute("auditionBoard", auditionBoardVO);
		log.info("auditionBoardVO : " + auditionBoardVO);
		return "entertain/auditionScheduleDetail";
		
	}
	
	
	
	@RequestMapping(value = "/admin/scheduleList.do")
	public String adminAuditionScheduleList(
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		PaginationInfoVO<AuditionBoardVO> pagingVO = new PaginationInfoVO<AuditionBoardVO>();

		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = auditionService.selectNoticeCount(pagingVO);

		pagingVO.setTotalRecord(totalRecord);

		List<AuditionBoardVO> dataList = auditionService.auditionScheduleList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("sideName", "audition");
		
		return "admin/entertain/auditionScheduleList";
	}
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/admin/detail.do", method = RequestMethod.GET)
	public String auditionDetail(int bfNo, Model model) {
		AuditionBoardVO auditionBoardVO = auditionService.auditionBoardDetail(bfNo);
		log.info("auditionBoardVO{}",auditionBoardVO);
		model.addAttribute("auditionBoardVO", auditionBoardVO);
		return "admin/entertain/auditionDetail";
	}
	
}
