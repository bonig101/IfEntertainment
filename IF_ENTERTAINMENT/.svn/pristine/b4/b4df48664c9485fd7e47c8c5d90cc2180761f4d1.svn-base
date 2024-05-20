package kr.or.ddit.mapper.entertain;

import java.util.List;

import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.entertain.CompanyNewsVO;

public interface ICompanyNewsMapper {
	public int selectCompanyNewsCount(PaginationInfoVO<CompanyNewsVO> pagingVO);
	public List<CompanyNewsVO> selectCompanyNewsList(PaginationInfoVO<CompanyNewsVO> pagingVO);
	public CompanyNewsVO selectCompanyNews(int bfNo);
	public int insertCompanyNews(CompanyNewsVO companyNewsVO);
	public int deleteCompanyNews(int bfNo);
	public int updateCompanyNews(CompanyNewsVO companyNewsVO);
	
	// 사용자 
	public int selectUserCompanyNewsCount(PaginationInfoVO<CompanyNewsVO> pagingVO);
	public List<CompanyNewsVO> selectUserCompanyNewsList(PaginationInfoVO<CompanyNewsVO> pagingVO);
	public CompanyNewsVO selectUserCompanyNews(int bfNo);
}
