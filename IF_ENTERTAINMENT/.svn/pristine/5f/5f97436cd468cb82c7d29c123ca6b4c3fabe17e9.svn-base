package kr.or.ddit.controller.entertain;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.entertain.IIRService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.entertain.IREventVO;
import lombok.extern.slf4j.Slf4j;

/**
 * IR 행사일정 수정 컨트롤러 
 * @author 서어진
 */
@Controller
@Slf4j
@RequestMapping("/entertain/ir")
public class IREventModifyController {

	@Inject
	private IIRService IRService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/update.do", method = RequestMethod.GET)
	public String IREventUpdateForm(int bfNo, Model model) {
		IREventVO ireventVO = IRService.selectIREvent(bfNo);
		model.addAttribute("irevent", ireventVO);
		model.addAttribute("status", "u");
		return "admin/entertain/IREventInsert";	
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/update.do", method = RequestMethod.POST)
	public String IREventUpdate(IREventVO ireventVO, Model model, 
			RedirectAttributes ra, HttpServletRequest req) {
		String goPage = "";
		ServiceResult result = IRService.updateIREvent(req, ireventVO);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/entertain/ir/detail.do?bfNo=" + ireventVO.getBfNo();
		} else { 
			model.addAttribute("irevent", ireventVO);
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("status", "u");
			goPage = "admin/entertain/IREventInsert";
		}
		return goPage;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/delete.do", method = RequestMethod.POST)
	public String IREventDelete(int bfNo, Model model, 
			RedirectAttributes ra, HttpServletRequest req) {
		String goPage = "";
		
		ServiceResult result = IRService.deleteIREvent(req, bfNo);
		if(result.equals(ServiceResult.OK)) { 
			goPage = "redirect:/entertain/ir/list.do";
		} else { 
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "redirect:/entertain/ir/detail.do?bfNo=" + bfNo;
		}
		return goPage;
	}
	
}
