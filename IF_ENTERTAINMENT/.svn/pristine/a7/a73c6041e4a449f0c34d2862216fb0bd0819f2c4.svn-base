package kr.or.ddit.service.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.GoodsNoticeVO;
import kr.or.ddit.vo.goods.GoodsVO;

public interface IGoodsNoticeService {
	public int selectGoodsNoticeListCount(PaginationInfoVO<GoodsNoticeVO> pagingVO);
	public List<GoodsNoticeVO> selectgoodsNoticeList(PaginationInfoVO<GoodsNoticeVO> pagingVO);
	public ServiceResult insertGoodsNotice(HttpServletRequest req, GoodsNoticeVO goodsNoticeVO);
	public GoodsNoticeVO selectGoodsNotice(int bfNo);
	public ServiceResult updateGoodsNotice(HttpServletRequest req, GoodsNoticeVO goodsNoticeVO);
	public ServiceResult deleteGoodsNotice(HttpServletRequest req, int bfNo);
	
	
	//굿즈샵 메인 화면 슬라이드 리스트 출력용
	public List<GoodsNoticeVO> selectgoodsNoticeMainList();
}
