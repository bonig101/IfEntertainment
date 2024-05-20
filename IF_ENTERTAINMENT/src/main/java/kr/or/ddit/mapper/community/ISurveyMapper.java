package kr.or.ddit.mapper.community;

import java.util.List;

import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.community.SurveyFormVO;
import kr.or.ddit.vo.community.SurveyOptionVO;
import kr.or.ddit.vo.community.SurveyQuestionVO;
import kr.or.ddit.vo.community.SurveyResultVO;
import kr.or.ddit.vo.community.SurveyVO;

public interface ISurveyMapper {
	public int insertSurvey(SurveyFormVO surveyFormVO);
	public int insertSurveyQuestion(SurveyQuestionVO surveyQuestionVO);
	public void insertSurveyOption(SurveyOptionVO surveyOptionVO);
	public int selectSurveyCount(PaginationInfoVO<SurveyFormVO> pagingVO);
	public List<SurveyFormVO> selectSurveyList(PaginationInfoVO<SurveyFormVO> pagingVO);
	public SurveyFormVO selectSurvey(int sfNo);
	public int modifySurvey(SurveyFormVO surveyFormVO);
	public int modifySurveyQuestion(SurveyQuestionVO surveyQuestionVO);
	public void modifySurveyOption(SurveyOptionVO surveyOptionVO);
	public void deleteSurveyOption(int sqNo);
	public int deleteSurveyQuestion(int sfNo);
	public int deleteSurvey(int sfNo);
	public SurveyFormVO selectSurveyPopup();
	public int conductSurvey(SurveyVO surveyVO);
	public void insertSurveyResult(SurveyResultVO surveyResultVO);
	public int closeSurvey(int sfNo);
	public List<SurveyResultVO> getsurveyResultList(int sfNo);
	public Integer popupCheck();
	public int finishSurveyAjax();
}
