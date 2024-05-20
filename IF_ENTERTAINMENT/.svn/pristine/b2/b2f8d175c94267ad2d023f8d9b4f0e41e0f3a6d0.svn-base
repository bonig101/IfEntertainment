package kr.or.ddit.service.goods;

import java.util.List;

import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.FaqVO;

public interface IFAQService {

	public int selectUserFaqListCount(PaginationInfoVO<FaqVO> pagingVO);

	public List<FaqVO> selectFaqList(PaginationInfoVO<FaqVO> pagingVO);

	public int selectAdminFaqListCount(PaginationInfoVO<FaqVO> pagingVO);

	public List<FaqVO> selecAdminFaqList(PaginationInfoVO<FaqVO> pagingVO);

	public ServiceResult faqInsert(FaqVO faqVO);

}
