package kr.or.ddit.controller.entertain;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.entertain.ICompanyNewsService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.entertain.CompanyNewsVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 기업소식 수정 및 삭제 컨트롤러(관리자) 
 * @author 서어진
 */
@Controller
@Slf4j
@RequestMapping("entertain/company/news")
public class CompanyNewsModifyController {

	@Inject
	private ICompanyNewsService companyNewsService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/update.do", method = RequestMethod.GET)
	public String CompanyNewsUpdateForm(int bfNo, Model model) {
		CompanyNewsVO companyNewsVO = companyNewsService.selectCompanyNews(bfNo);
		model.addAttribute("companyNews", companyNewsVO);
		model.addAttribute("status", "u");
		return "admin/entertain/CompanyNewsInsert";	
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/update.do", method = RequestMethod.POST)
	public String CompanyNoticeUpdate(CompanyNewsVO companyNewsVO, Model model, 
			RedirectAttributes ra, HttpServletRequest req) {
		String goPage = "";
		ServiceResult result = companyNewsService.updateCompanyNews(req, companyNewsVO);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/entertain/company/news/detail.do?bfNo=" + companyNewsVO.getBfNo();
		} else { 
			model.addAttribute("companyNews", companyNewsVO);
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("status", "u");
			goPage = "admin/entertain/CompanyNewsInsert";
		}
		return goPage;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/delete.do", method = RequestMethod.POST)
	public String CompanyNewsDelete(int bfNo, Model model, 
			RedirectAttributes ra, HttpServletRequest req) {
		String goPage = "";
		
		ServiceResult result = companyNewsService.deleteCompanyNews(req, bfNo);
		if(result.equals(ServiceResult.OK)) { 
			goPage = "redirect:/entertain/company/news/list.do";
		} else { 
			goPage = "redirect:/entertain/company/news/detail.do?bfNo=" + bfNo;
		}
		return goPage;
	}
	
}
