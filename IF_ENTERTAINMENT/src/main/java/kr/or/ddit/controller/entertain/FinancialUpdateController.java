package kr.or.ddit.controller.entertain;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.entertain.IFinanceService;
import kr.or.ddit.vo.entertain.FinanceExcelVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 재무재표 업데이트 컨트롤러(관리자)
 * @author 조재훈
 */
@Controller
@Slf4j
@RequestMapping("/entertain/finance")
public class FinancialUpdateController {
	
	// 관리자가 재무재표를 업데이트 하면 테이블에 있는 정보들이 업데이트 되며 새로운 테이블을 그려낸다.
	@Inject
	private IFinanceService financeService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "update.do", method = RequestMethod.GET)
	public String financeList(Model model) {
		List<FinanceExcelVO> list = financeService.excelDown();
		
		
		model.addAttribute("list", list);
		
		return "admin/entertain/finance";
	}
	
}
