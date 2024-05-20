package kr.or.ddit.vo.statistic;

import java.util.List;

import kr.or.ddit.vo.goods.GoodsVO;
import lombok.Data;

/**
 * 아티스트별 굿즈 판매액결과를 담기 위한 VO
 * @author 홍진영
 */
@Data
public class GoodsSalesVO {
	private String goodsArtist;			// 아티스트 이름
	private int totalPrice;				// 총 판매가격
	private String orderYear;			// 주문년도
	
	private int maleSales;				// 남성이 구매한 총합
	private int femaleSales;			// 여성이 구매한 총합
	
	private List<GoodsVO> goodsList;	// 아티스트별 판매금액이 높은 아이템 정보를 담기 위한 리스트
}
