package kr.or.ddit.mapper.goods;

import java.util.List;

import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.goodsInquiryVO;

public interface IInquiryMapper {
	public int selectInquiryListCount(PaginationInfoVO<goodsInquiryVO> pagingVO);
	public List<goodsInquiryVO> selectInquiryList(PaginationInfoVO<goodsInquiryVO> pagingVO);
	public goodsInquiryVO selectInquiry(int giNo);
	public int updateInquiry(goodsInquiryVO goodsInquiryVO);
	
	// 사용자
	public int selectUserInquiryListCount(PaginationInfoVO<goodsInquiryVO> pagingVO);
	public List<goodsInquiryVO> selectUserInquiryList(PaginationInfoVO<goodsInquiryVO> pagingVO);
	public goodsInquiryVO selectUserInquiry(int giNo);
	public int goodsInquiryInsert(goodsInquiryVO goodsInquiryVO);
}
