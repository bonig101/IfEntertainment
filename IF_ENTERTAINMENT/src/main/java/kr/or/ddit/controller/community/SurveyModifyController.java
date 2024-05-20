package kr.or.ddit.controller.community;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.community.ISurveyService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.community.SurveyFormVO;
import kr.or.ddit.vo.community.SurveyQuestionVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 설문조사 수정 컨트롤러(관리자)
 * @author 홍진영
 */
@Controller
@Slf4j
@RequestMapping("/community/survey")
public class SurveyModifyController {

	@Inject
	private ISurveyService surveyService;
	
	/**
	 * 설문조사 수정 메서드
	 * @param surveyFormVO - 수정 폼에 입력된 정보들
	 * @param req - 설문조사 썸네일 수정 시 필요한 경로를 얻어오기 위함
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/modifySurvey",  method = RequestMethod.POST)
	public ResponseEntity<SurveyFormVO> modifySurvey(SurveyFormVO surveyFormVO,
			HttpServletRequest req) {
		log.info("수정할 surveyFormVO : {}", surveyFormVO.getSfDisplay());
		
		// 게시여부에 체크된 값에 따라 마감여부 컬럼 값을 반대로 세팅해준다
		if(surveyFormVO.getSfDisplay().equals("Y")) {
			surveyFormVO.setSfClos("N");
		} else {
			surveyFormVO.setSfClos("Y");
		}
		ResponseEntity<SurveyFormVO> entity = null ;
		ServiceResult result = surveyService.modifySurvey(surveyFormVO, req);
		if(result.equals(ServiceResult.OK)) {
			// 업데이트에 성공했을 경우 상세정보를 조회하여 다시 리턴해준다.
			SurveyFormVO sfVO = surveyService.selectSurvey(surveyFormVO.getSfNo());
			entity = new ResponseEntity<SurveyFormVO>(sfVO, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<SurveyFormVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/modifyQuestion",  method = RequestMethod.POST)
	public ResponseEntity<SurveyFormVO> modifySurveyQuestion(SurveyQuestionVO surveyQuestionVO) {
		log.info("수정할 surveyQuestionVO : {}", surveyQuestionVO);
		ResponseEntity<SurveyFormVO> entity = null;
		ServiceResult result = surveyService.modifySurveyQuestion(surveyQuestionVO);
		if(result.equals(ServiceResult.OK)) {
			SurveyFormVO sfVO = surveyService.selectSurvey(surveyQuestionVO.getSfNo());
			entity = new ResponseEntity<SurveyFormVO>(sfVO, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<SurveyFormVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/**
	 * 설문 삭제 메서드
	 * @param sfNo 설문 번호를 받아 해당 설문과 엮여있는 질문과 보기문항들을 전부 삭제한다.
	 * @param model
	 * @param ra 설문 삭제 성공 후 일회성 메시지를 담기 위함
	 * @param req
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/delete.do", method = RequestMethod.GET)
	public String deleteSurvey(int sfNo, Model model,
			RedirectAttributes ra, HttpServletRequest req) {
		String goPage = "";
		SurveyFormVO surveyFormVO = surveyService.selectSurvey(sfNo);
		if(surveyFormVO != null) {
			ServiceResult result = surveyService.deleteSurvey(surveyFormVO);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "설문 삭제가 완료되었습니다.");
				goPage = "redirect:/community/survey/list.do";
			} else {
				model.addAttribute("message", "서버에러! 다시 시도해주세요!");
				model.addAttribute("surveyFormVO", surveyFormVO);
				goPage = "admin/community/surveyRegisterForm";
			}
		} else {
			model.addAttribute("message", "서버에러! 다시 시도해주세요!");
			goPage = "/community/survey/detail.do?sfNo=" + sfNo;
		}
		
		return goPage;
	}
	
	/**
	 * 설문조사 마감
	 * @param sfNo
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value="/close.do", method = RequestMethod.GET)
	public ResponseEntity<String> closeSurvey(int sfNo){
		ResponseEntity<String> entity = null;
		ServiceResult result = surveyService.closeSurvey(sfNo);
		if(result.equals(ServiceResult.OK)) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		}
		return entity;
	}
	
}
