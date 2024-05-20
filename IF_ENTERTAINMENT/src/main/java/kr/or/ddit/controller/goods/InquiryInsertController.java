 package kr.or.ddit.controller.goods;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.goods.IInquiryService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.goods.GoodsNoticeVO;
import kr.or.ddit.vo.goods.goodsInquiryVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 굿즈샵 1대1 문의 등록 컨트롤러(사용자/관리자)
 * @author 성이수/서어진
 */
@Controller
@Slf4j
@RequestMapping("/goods/inquiry")
public class InquiryInsertController {
	
	@Inject
	private IInquiryService inquiryService;
	
	// 사용자는 질문등록

	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public String goodsInquiryForm(Model model) {
		return "goods/goodsInquiryInsert";
	}

	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String goodsInquiryInsert(Model model, goodsInquiryVO goodsInquiryVO, HttpServletRequest req,
			RedirectAttributes ra) {

		String goPage = "";

		Map<String, String> errors = new HashMap<String, String>();

		if (StringUtils.isBlank(goodsInquiryVO.getGiTitle())) {
			errors.put("giTitle", "제목을 입력해주세요.");
		}

		if (StringUtils.isBlank(goodsInquiryVO.getGiContent())) {
			errors.put("giContent", "내용을 입력해주세요.");
		}

		if (StringUtils.isBlank(goodsInquiryVO.getGiType())) {
			errors.put("giType", "문의 유형을 선택해주세요.");
		}

		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("goodsInquiry", goodsInquiryVO);
			goPage = "goods/goodsInquiryInsert";
		} else {

			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserVO userVO = user.getUser();
			goodsInquiryVO.setUserNo(userVO.getUserNo());

			ServiceResult result = inquiryService.goodsInquiryInsert(req, goodsInquiryVO);

			if (result.equals(ServiceResult.OK)) {

				goPage = "redirect:/goods/inquiry/userlist.do";
			} else {
				goPage = "goods/goodsInquiryVO";
			}
		}
		return goPage;
	}
	
	// 관리자는 답변 등록
   
	/**
	 * 관리자가 답변 등록을 처리하는 컨트롤러
	 * @param goodsInquiryVO
	 * @param ra
	 * @param model
	 * @return
	 */
   	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/answer.do", method = RequestMethod.POST)
	public String answergoodsInquiry(goodsInquiryVO goodsInquiryVO, 
			RedirectAttributes ra, Model model) {
		ServiceResult result = inquiryService.updateInquiry(goodsInquiryVO);
		
		if (result.equals(ServiceResult.OK)) {
			//ra.addFlashAttribute("message", "게시글 수정이 완료되었습니다.");
		}else {
			model.addAttribute("answer", goodsInquiryVO);
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
		}
		return "redirect:/goods/inquiry/list.do";
	}
	
}
