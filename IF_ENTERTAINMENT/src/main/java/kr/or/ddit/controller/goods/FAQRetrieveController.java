package kr.or.ddit.controller.goods;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.goods.IFAQService;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.FaqVO;
import kr.or.ddit.vo.goods.goodsInquiryVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 굿즈샵 FAQ 조회 컨트롤러(사용자/관리자)
 * @author 이수진
 */
@Controller
@Slf4j
@RequestMapping("/goods/faq")
public class FAQRetrieveController {

	@Inject
	private IFAQService faqService;
	
	// 아코디언 css 적용하여 질문 클릭하면 답변 보이도록
	
	// 사용자
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@RequestMapping(value = "/userList.do")
	public String userFaqList(
			@RequestParam(name ="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model
			) {
		
		PaginationInfoVO<FaqVO> pagingVO = new PaginationInfoVO<FaqVO>(5, 5);
		
		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = faqService.selectUserFaqListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<FaqVO> dataList = faqService.selectFaqList(pagingVO);
		pagingVO.setDataList(dataList);
		log.info("dataList {}", dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		
		return "goods/userFaqList";
		
	}
	
	// 관리자
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/admin/list.do")
	public String faqList(
			@RequestParam(name ="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model
			) {
		PaginationInfoVO<FaqVO> pagingVO = new PaginationInfoVO<FaqVO>();
		
		if (StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = faqService.selectAdminFaqListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<FaqVO> dataList = faqService.selecAdminFaqList(pagingVO);
		pagingVO.setDataList(dataList);
		log.info("dataList {}", dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		
		return "admin/goods/faqList";
		
	}
	
}
