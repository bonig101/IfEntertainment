package kr.or.ddit.service.entertain;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.entertain.CompanyNewsVO;

public interface ICompanyNewsService {
	public int selectCompanyNewsCount(PaginationInfoVO<CompanyNewsVO> pagingVO);
	public List<CompanyNewsVO> selectCompanyNewsList(PaginationInfoVO<CompanyNewsVO> pagingVO);
	public CompanyNewsVO selectCompanyNews(int bfNo);
	public ServiceResult insertCompanyNews(HttpServletRequest req, CompanyNewsVO companyNewsVO);
	public ServiceResult updateCompanyNews(HttpServletRequest req, CompanyNewsVO companyNewsVO);
	public ServiceResult deleteCompanyNews(HttpServletRequest req, int bfNo);
	
	// 사용자
	public int selectUserCompanyNewsCount(PaginationInfoVO<CompanyNewsVO> pagingVO);
	public List<CompanyNewsVO> selectUserCompanyNewsList(PaginationInfoVO<CompanyNewsVO> pagingVO);
	public CompanyNewsVO selectUserCompanyNews(int bfNo);
}
