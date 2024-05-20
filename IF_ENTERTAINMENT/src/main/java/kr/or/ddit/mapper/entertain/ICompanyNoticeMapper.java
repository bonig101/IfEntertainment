package kr.or.ddit.mapper.entertain;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.entertain.CompanyNoticeVO;

public interface ICompanyNoticeMapper {
	public int insertCompanyNotice(CompanyNoticeVO companyNoticeVO);
	public int selectCompanyNoticeCount(PaginationInfoVO<CompanyNoticeVO> pagingVO);
	public List<CompanyNoticeVO> selectCompanyNoticeList(PaginationInfoVO<CompanyNoticeVO> pagingVO);
	public CompanyNoticeVO selectCompanyNotice(int bfNo);
	public int updateCompanyNotice(CompanyNoticeVO companyNoticeVO);
	public int deleteCompanyNotice(int bfNo);
	
	// 사용자
	public int selectUserCompanyNoticeCount(PaginationInfoVO<CompanyNoticeVO> pagingVO);
	public List<CompanyNoticeVO> selectUserCompanyNoticeList(PaginationInfoVO<CompanyNoticeVO> pagingVO);
	public CompanyNoticeVO selectUserCompanyNotice(int bfNo);

	// 이전 다음
	/* public ArrayList<CompanyNoticeVO> selectPrevAndNextPost(int bfNo); */
}
