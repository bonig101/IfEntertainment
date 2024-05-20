package kr.or.ddit.controller.entertain;

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

import kr.or.ddit.service.entertain.IAuditionService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.entertain.AuditionBoardVO;
import kr.or.ddit.vo.entertain.CompanyNoticeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 오디션 일정 등록 컨트롤러(관리자)
 * @author 이수진
 */
@Controller
@Slf4j
@RequestMapping("/entertain/audition")
public class AuditionNoticeInsertController {
	
	@Inject
	private IAuditionService auditionService;
	
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value = "/admin/form.do", method = RequestMethod.GET)
	public String auditionForm() {
		return "admin/entertain/auditionBoardInsert";
	};
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value = "/admin/insert.do", method = RequestMethod.POST)
	public String auditionInsert(HttpServletRequest req, AuditionBoardVO auditionBoardVO, Model model,
			RedirectAttributes ra) {
		String goPage = "";

		Map<String, String> errors = new HashMap<String, String>();

		if (StringUtils.isBlank(auditionBoardVO.getBfTitle())) {
			errors.put("bfTitle", "제목을 입력해주세요.");
		}

		if (StringUtils.isBlank(auditionBoardVO.getBfContent())) {
			errors.put("bfContent", "내용을 입력해주세요.");
		}

		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("auditionBoardVO", auditionBoardVO);
			goPage = "admin/entertain/auditionBoardInsert";
		} else {

			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // 로그인
			UserVO userVO = user.getUser();

			if (userVO != null) {
				auditionBoardVO.setUserNo(userVO.getUserNo());
				ServiceResult result = auditionService.insertAudition(req, auditionBoardVO);
				if (result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "게시글 등록이 성공했습니다!");
					goPage = "redirect:/entertain/audition/admin/detail.do?bfNo=" + auditionBoardVO.getBfNo();
				} else {
					model.addAttribute("message", "서버에러, 다시 시도해주세요!");
					goPage = "admin/entertain/auditionBoardInsert";
				}

			}
		}
		return goPage;
	}
}
