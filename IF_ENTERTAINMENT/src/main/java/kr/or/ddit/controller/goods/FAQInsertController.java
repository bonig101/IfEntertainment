package kr.or.ddit.controller.goods;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

import kr.or.ddit.service.goods.IFAQService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.goods.FaqVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 굿즈샵 FAQ 등록 컨트롤러(관리자)
 * @author 이수진
 */
@Controller
@Slf4j
@RequestMapping("/goods/faq")
public class FAQInsertController {

	@Inject
	private IFAQService faqService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/admin/faqInsert.do", method = RequestMethod.POST)
	public String faqInsert(FaqVO faqVO, Model model, RedirectAttributes ra) {
		String goPage = "";
		
		Map<String, String> errors = new HashMap<String, String>();
		
		if(StringUtils.isBlank(faqVO.getBfTitle())) {
			errors.put("bfTitle", "제목을 입력해주세요.");
		}
		if(StringUtils.isBlank(faqVO.getBfContent())) {
			errors.put("bfContent", "내용을 입력해주세요.");
		}
		
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("faqVO", faqVO);
			goPage = "admin/goods/faqList";
		}else {
			ServiceResult result = faqService.faqInsert(faqVO);
			log.info("resultresult {}", result);
			
			if(result.equals(ServiceResult.OK)) {
//				ra.addFlashAttribute("message", "등록 성공");
				goPage = "redirect:/goods/faq/admin/list.do";
			}else {
				model.addAttribute("message", "등록 실패");
				goPage = "redirect:/goods/faq/admin/list.do";
			}
		}
		log.info("faqVO.getUserNo() {}",faqVO.getUserNo());
		log.info("faqVO.getUserId() {}",faqVO.getUserId());
		return goPage;
		
	}
	
}
