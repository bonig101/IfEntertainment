package kr.or.ddit.controller.entertain;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.entertain.IAuditionService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.entertain.AuditionBoardVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 오디션 일정 수정 및 삭제 컨트롤러(관리자)
 * @author 이수진
 */
@Controller
@Slf4j
@RequestMapping("/entertain/audition")
public class AuditionNoticeModifyController {

	@Inject
	private IAuditionService auditionService;
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/admin/update.do", method = RequestMethod.GET)
	public String auditionUpdateForm(int bfNo, Model model) {
		AuditionBoardVO auditionVO = auditionService.auditionBoardDetail(bfNo);
		model.addAttribute("auditionVO", auditionVO);
		model.addAttribute("bfNo",bfNo);
		log.info("bfNo",bfNo);
		model.addAttribute("status", "u");
		return "admin/entertain/auditionBoardInsert";	
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/admin/update.do", method = RequestMethod.POST)
	public String auditionUpdate(AuditionBoardVO auditionVO, Model model, 
			RedirectAttributes ra, HttpServletRequest req) {
		log.info("auditionVO.getBfNo()",auditionVO.getBfNo());
		
		String goPage = "";
		ServiceResult result = auditionService.updateAudition(req, auditionVO);
		log.info("result",result);
		if(result.equals(ServiceResult.OK)) {
			goPage = "redirect:/entertain/audition/admin/detail.do?bfNo=" + auditionVO.getBfNo();
		} else { 
			model.addAttribute("audition", auditionVO);
			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
			model.addAttribute("status", "u");
			goPage = "admin/entertain/auditionBoardInsert";
		}
		return goPage;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="admin/delete.do", method = RequestMethod.POST)
	public String auditionDelete(int bfNo, Model model, 
			RedirectAttributes ra, HttpServletRequest req) {
		String goPage = "";
		
		ServiceResult result = auditionService.deleteAudition(req, bfNo);
		if(result.equals(ServiceResult.OK)) { 
			goPage = "redirect:/entertain/audition/admin/scheduleList.do";
		} else { 
			goPage = "/entertain/audition/admin/detail.do?bfNo=" + bfNo;
		}
		return goPage;
	}
}
