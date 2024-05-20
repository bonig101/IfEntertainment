package kr.or.ddit.service.goods;

import java.util.List;

import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.AddressVO;
import kr.or.ddit.vo.goods.CartVO;
import kr.or.ddit.vo.goods.OrderVO;
import kr.or.ddit.vo.goods.goodsBuyVO;

public interface IGoodsPurchaseService {

	public List<CartVO> cartSelect(String userNo);

	public List<CartVO> selectArtist(List<CartVO> cartList);

	public List<AddressVO> addressSelect(String userNo);

	public String selectUserName(String userNo);

	public int addressInsert(OrderVO orderVO);

	public String selectMaNumber(int userNo);

	public int purchaseInsert(OrderVO orderVO);

	public OrderVO selectTotalOrderPrice(int userNo);

	public int selectAutoOrderListCount(PaginationInfoVO<goodsBuyVO> pagingVO);

	public List<goodsBuyVO> selectAutoOrderList(PaginationInfoVO<goodsBuyVO> pagingVO);

}