package kr.or.ddit.mapper.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.goods.goodsInquiryVO;
import kr.or.ddit.vo.statistic.GoodsSalesVO;
import kr.or.ddit.vo.statistic.KeywordVO;
import kr.or.ddit.vo.statistic.MemberRateVO;

public interface IAdminMapper {
	public int selectTodayRegister();
	public int selectYesterdayRegister();
	public long selectTodaySales();
	public long selectYesterdaySales();
	public int selectDeliveryCount();
	public int selectChangeCount();
	public List<goodsInquiryVO> selectInquiryList();
	public void selectInquiryList(String username);
	public int selectInquiryCount();
	public List<KeywordVO> getKeyword();
	public List<MemberRateVO> selectMemberRateList();
	public List<GoodsSalesVO> selectGoodsSalesList();
}
