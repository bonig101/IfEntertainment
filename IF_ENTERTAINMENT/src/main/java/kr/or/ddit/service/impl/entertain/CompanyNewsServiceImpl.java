package kr.or.ddit.service.impl.entertain;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.entertain.ICompanyNewsMapper;
import kr.or.ddit.service.entertain.ICompanyNewsService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.entertain.CompanyNewsVO;
import kr.or.ddit.vo.entertain.CompanyNoticeVO;
import kr.or.ddit.vo.entertain.IREventVO;

@Service
public class CompanyNewsServiceImpl implements ICompanyNewsService {

	@Inject
	private ICompanyNewsMapper companyNewsMapper;

	@Override
	public int selectCompanyNewsCount(PaginationInfoVO<CompanyNewsVO> pagingVO) {
		return companyNewsMapper.selectCompanyNewsCount(pagingVO);
	}

	@Override
	public List<CompanyNewsVO> selectCompanyNewsList(PaginationInfoVO<CompanyNewsVO> pagingVO) {
		return companyNewsMapper.selectCompanyNewsList(pagingVO);
	}

	@Override
	public CompanyNewsVO selectCompanyNews(int bfNo) {
		return companyNewsMapper.selectCompanyNews(bfNo);
	}

	@Override
	public ServiceResult insertCompanyNews(HttpServletRequest req, CompanyNewsVO companyNewsVO) {
		ServiceResult result = null;
		int status = companyNewsMapper.insertCompanyNews(companyNewsVO);
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult updateCompanyNews(HttpServletRequest req, CompanyNewsVO companyNewsVO) {
		ServiceResult result = null;
		int status = companyNewsMapper.updateCompanyNews(companyNewsVO);
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult deleteCompanyNews(HttpServletRequest req, int bfNo) {
		ServiceResult result = null;
		CompanyNewsVO companyNewsVO = companyNewsMapper.selectCompanyNews(bfNo);
		int status = companyNewsMapper.deleteCompanyNews(bfNo);
		if (status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	// 사용자
	@Override
	public int selectUserCompanyNewsCount(PaginationInfoVO<CompanyNewsVO> pagingVO) {
		return companyNewsMapper.selectUserCompanyNewsCount(pagingVO);
	}

	@Override
	public List<CompanyNewsVO> selectUserCompanyNewsList(PaginationInfoVO<CompanyNewsVO> pagingVO) {
		return companyNewsMapper.selectUserCompanyNewsList(pagingVO);
	}

	@Override
	public CompanyNewsVO selectUserCompanyNews(int bfNo) {
		return companyNewsMapper.selectUserCompanyNews(bfNo);
	}
}
