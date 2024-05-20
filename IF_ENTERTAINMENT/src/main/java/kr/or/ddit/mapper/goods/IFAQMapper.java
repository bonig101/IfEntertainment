package kr.or.ddit.mapper.goods;

import java.util.List;

import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.FaqVO;

public interface IFAQMapper {

	public int selectUserFaqListCount(PaginationInfoVO<FaqVO> pagingVO);

	public List<FaqVO> selectFaqList(PaginationInfoVO<FaqVO> pagingVO);

	public int selectAdminFaqListCount(PaginationInfoVO<FaqVO> pagingVO);

	public List<FaqVO> selecAdminFaqList(PaginationInfoVO<FaqVO> pagingVO);

	public int faqInsert(FaqVO faqVO);

}
