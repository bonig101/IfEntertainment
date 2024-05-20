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

import kr.or.ddit.service.entertain.ICompanyNewsService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.entertain.CompanyNewsVO;
import kr.or.ddit.vo.entertain.CompanyNoticeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 기업소식 등록 컨트롤러(관리자)
 * 
 * @author 서어진
 */
@Controller
@Slf4j
@RequestMapping("entertain/company/news")
public class CompanyNewsInsertController {

	@Inject
	private ICompanyNewsService companyNewsService;

	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value = "/form.do", method = RequestMethod.GET)
	public String CompanyNewsForm() {
		return "admin/entertain/CompanyNewsInsert";
	};

	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String CompanyNewsInsert(HttpServletRequest req, CompanyNewsVO companyNewsVO, Model model,
			RedirectAttributes ra) {
		String goPage = "";

		Map<String, String> errors = new HashMap<String, String>();

		if (StringUtils.isBlank(companyNewsVO.getBfTitle())) {
			errors.put("bfTitle", "제목을 입력해주세요.");
		}

		if (StringUtils.isBlank(companyNewsVO.getBfContent())) {
			errors.put("bfContent", "내용을 입력해주세요.");
		}

		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("companyNewsVO", companyNewsVO);
			goPage = "admin/entertain/CompanyNewsInsert";
		} else {
			CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // 로그인
			UserVO userVO = user.getUser();

			if (userVO != null) {
				companyNewsVO.setUserNo(userVO.getUserNo());
				ServiceResult result = companyNewsService.insertCompanyNews(req, companyNewsVO);
				if (result.equals(ServiceResult.OK)) {
					goPage = "redirect:/entertain/company/news/detail.do?bfNo=" + companyNewsVO.getBfNo();
				} else {
					model.addAttribute("message", "서버에러, 다시 시도해주세요!");
					goPage = "admin/entertain/CompanyNewsInsert";
				}

			}
		}
		return goPage;
	}
}
