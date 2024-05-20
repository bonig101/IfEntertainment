package kr.or.ddit.mapper.goods;

import java.util.List;

import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.GoodsNoticeAttachFileVO;
import kr.or.ddit.vo.goods.GoodsNoticeVO;

public interface IGoodsNoticeMapper {
	public int selectGoodsNoticeListCount(PaginationInfoVO<GoodsNoticeVO> pagingVO);
	public List<GoodsNoticeVO> selectgoodsNoticeList(PaginationInfoVO<GoodsNoticeVO> pagingVO);
	public void insertGoodsNoticeFile(GoodsNoticeAttachFileVO goodsNoticeFileVO);
	public int insertGoodsNotice(GoodsNoticeVO goodsNoticeVO);
	public void incrementHit(int bfNo);
	public GoodsNoticeVO selectGoodsNotice(int bfNo);
	public void deleteGoodsNoticeFile(int bfNo);
	public int updateGoodsNotice(GoodsNoticeVO goodsNoticeVO);
	public String selectGoodNoticeThumb(int bfNo);
	public int deleteGoodsNotice(int bfNo);
	
	//굿즈샵 메인 화면 슬라이드 리스트 출력용
	public List<GoodsNoticeVO> selectgoodsNoticeMainList();
}
