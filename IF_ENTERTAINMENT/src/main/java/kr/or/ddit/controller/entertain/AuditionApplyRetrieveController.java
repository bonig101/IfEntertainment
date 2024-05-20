package kr.or.ddit.controller.entertain;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.entertain.IAuditionService;
import kr.or.ddit.vo.entertain.AuditionRegisterVO;
import kr.or.ddit.vo.entertain.NationVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 오디션 신청내역 조회 컨트롤러(사용자/관리자)
 * @author 이수진
 */
@Controller
@Slf4j
@RequestMapping("/entertain/audition")
public class AuditionApplyRetrieveController {
	// 철저히 비회원 전용
	
	@Inject
	private IAuditionService auditionService;
	
	@RequestMapping(value = "/auditionSupportCheckForm.do", method = RequestMethod.GET)
	public String auditionSupportCheckForm(Model model) {
		model.addAttribute("sideName", "audition");
		return "entertain/auditionSupportCheckForm";
	}
	
	@RequestMapping(value = "/auditionSupportCheck.do", method = RequestMethod.POST)
	public String auditionSupportCheck(AuditionRegisterVO auditionRegisterVO, Model model) {
		
		List<AuditionRegisterVO> arList = auditionService.auditionSupportCheck(auditionRegisterVO);
		model.addAttribute("auditionRegisterVO", auditionRegisterVO);
		log.info("resultresult {}", arList);
		if(arList != null) {
			model.addAttribute("arList", arList);
			model.addAttribute("sideName", "audition");
			return "entertain/auditionSupportList";
		}else {
			model.addAttribute("message", "입력하신 정보가 존재하지 않습니다.");
			model.addAttribute("sideName", "audition");
			return "entertain/auditionSupportCheckForm";
		}
	}
	
	@RequestMapping(value = "/auditionSupportList.do", method = RequestMethod.GET)
	public String auditionSupportList(Model model) {
		List<AuditionRegisterVO> auditionRegisterList = auditionService.auditionSupportList();
		model.addAttribute("auditionRegisterList", auditionRegisterList);
//		log.info("auditionRegisterList {}",auditionRegisterList);
		model.addAttribute("sideName", "audition");
		return "entertain/auditionSupportList";
	}
	
	@RequestMapping(value = "/auditionSupportDetail.do", method = RequestMethod.GET)
	public String auditionSupportDetail(int arNo, Model model) {
		AuditionRegisterVO auditionRegisterVO = auditionService.selectSupport(arNo);
		model.addAttribute("auditionRegisterVO", auditionRegisterVO);
		
		List<NationVO> nationList = auditionService.nationList();
		model.addAttribute("nationList", nationList);
		model.addAttribute("sideName", "audition");
//		log.info("auditionRegisterVO {}", auditionRegisterVO);
//		log.info("nationList {}", nationList);
		return "entertain/auditionSupportDetail";
	}
	
	@RequestMapping(value = "/auditionSupportDetail.do", method = RequestMethod.POST)
	public void auditionSupportCancel(AuditionRegisterVO auditionRegisterVO, Model model) {
		log.info("auditionRegisterVO {}", auditionRegisterVO.getArNo());
		auditionService.cancelSupport(auditionRegisterVO);
	}
	
}
