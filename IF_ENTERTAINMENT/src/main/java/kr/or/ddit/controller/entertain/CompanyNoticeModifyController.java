package kr.or.ddit.controller.entertain;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.entertain.ICompanyNoticeService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.entertain.CompanyNoticeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 기업공지 수정 컨트롤러(관리자)
 * @author 서어진
 */
@Controller
@Slf4j
@RequestMapping("/entertain/company/notice")
public class CompanyNoticeModifyController {

	@Inject
	private ICompanyNoticeService companyNoticeService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/update.do", method = RequestMethod.GET)
	public String CompanyNoticeUpdateForm(int bfNo, Model model) {
		CompanyNoticeVO companyNoticeVO = companyNoticeService.selectCompanyNotice(bfNo);
		model.addAttribute("companyNotice", companyNoticeVO);
		model.addAttribute("status", "u");
		return "admin/entertain/CompanyNoticeInsert";	
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/update.do", method = RequestMethod.POST)
	public String CompanyNoticeUpdate(CompanyNoticeVO companyNoticeVO, Model model, 
			RedirectAttributes ra, HttpServletRequest req) {
		String goPage = "";
		ServiceResult result = companyNoticeService.updateCompanyNotice(req, companyNoticeVO);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/entertain/company/notice/detail.do?bfNo=" + companyNoticeVO.getBfNo();
		} else { 
			model.addAttribute("companyNotice", companyNoticeVO);
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("status", "u");
			goPage = "admin/entertain/CompanyNoticeInsert";
		}
		return goPage;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/delete.do", method = RequestMethod.POST)
	public String CompanyNoticeDelete(int bfNo, Model model, 
			RedirectAttributes ra, HttpServletRequest req) {
		String goPage = "";
		
		ServiceResult result = companyNoticeService.deleteCompanyNotice(req, bfNo);
		if(result.equals(ServiceResult.OK)) { 
			goPage = "redirect:/entertain/company/notice/list.do";
		} else { 
			goPage = "redirect:/entertain/company/notice/detail.do?bfNo=" + bfNo;
		}
		return goPage;
	}
}
