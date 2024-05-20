package kr.or.ddit.service.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.community.SurveyFormVO;
import kr.or.ddit.vo.community.SurveyQuestionVO;
import kr.or.ddit.vo.community.SurveyResultVO;
import kr.or.ddit.vo.community.SurveyVO;

public interface ISurveyService {
	public ServiceResult insertSurvey(HttpServletRequest req, SurveyFormVO surveyFormVO);
	public int selectSurveyCount(PaginationInfoVO<SurveyFormVO> pagingVO);
	public List<SurveyFormVO> selectSurveyList(PaginationInfoVO<SurveyFormVO> pagingVO);
	public SurveyFormVO selectSurvey(int sfNo);
	public ServiceResult modifySurvey(SurveyFormVO surveyFormVO, HttpServletRequest req);
	public ServiceResult modifySurveyQuestion(SurveyQuestionVO surveyQuestionVO);
	public ServiceResult deleteSurvey(SurveyFormVO surveyFormVO);
	public SurveyFormVO selectSurveyPopup();
	public ServiceResult conductSurvey(SurveyVO surveyVO);
	public ServiceResult closeSurvey(int sfNo);
	public List<SurveyResultVO> getsurveyResultList(int sfNo);
	public ServiceResult popupCheck();
	public ServiceResult finishSurveyAjax();
}
