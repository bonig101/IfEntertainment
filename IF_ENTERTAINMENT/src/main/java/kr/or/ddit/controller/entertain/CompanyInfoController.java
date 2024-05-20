package kr.or.ddit.controller.entertain;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.entertain.ICompanyInfoService;
import lombok.extern.slf4j.Slf4j;

/**
 * 기업소개 컨트롤러
 * @author 이수진
 */
@Controller
@Slf4j
@RequestMapping("/entertain/company")
public class CompanyInfoController {
	
	// 기업 소개
	// 간단히 좌측 사진, 우측 소개글
	
	// 연혁
	// 연도 - 소개
	// 연도 - 소개
	// ...
	
	// 기업위치
	// 1. 다음 지도 API 활용하여 기업 위치 나타내기 (DDIT 좌표 찍기)
	// 2. 연락처, 전화번호, 이메일, 팩스 등 템플릿 맞춰서 이.쁘.게 배치
	
	@Inject
	private ICompanyInfoService companyInfoService;
	
	// 기업소개
	@RequestMapping(value="/info.do", method = RequestMethod.GET)
	public String companyInfo(Model model) {
		model.addAttribute("sideName", "company");
		return "entertain/info";
	}
	
	// 연력
	@RequestMapping(value = "/history.do", method = RequestMethod.GET)
	public String history(Model model) {
		model.addAttribute("sideName", "company");
		return "entertain/history";
	}
	
	// 찾아오는 길
	@RequestMapping(value = "/visit.do", method = RequestMethod.GET)
	public String visit(Model model) {
		model.addAttribute("sideName", "company");
		return "entertain/visit";
	}
	
}
