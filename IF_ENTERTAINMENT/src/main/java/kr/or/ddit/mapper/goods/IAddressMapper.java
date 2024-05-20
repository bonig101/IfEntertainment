package kr.or.ddit.mapper.goods;

import java.util.List;

import kr.or.ddit.vo.entertain.NationVO;
import kr.or.ddit.vo.goods.AddressVO;

public interface IAddressMapper {

	public List<AddressVO> addressManaege(String userNo);
	public int addressInsert(AddressVO addressVO);
	public int addressDelete(AddressVO addressVO);
	public int addressDefault(AddressVO addressVO);
	public int addressDefaultUpdate(int maNumber);
	public int addressDefaultInsert(AddressVO addressVO);
	public List<NationVO> nationSelect();
	public int addressUpdate(AddressVO addressVO);

}
