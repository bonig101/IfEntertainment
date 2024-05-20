package kr.or.ddit.mapper.entertain;

import java.util.List;

import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.entertain.AuditionBoardVO;
import kr.or.ddit.vo.entertain.AuditionRegisterVO;
import kr.or.ddit.vo.entertain.NationVO;

public interface IAuditionMapper {

	public int selectNoticeCount(PaginationInfoVO<AuditionBoardVO> pagingVO);

	public List<AuditionBoardVO> auditionScheduleList(PaginationInfoVO<AuditionBoardVO> pagingVO);

	public AuditionBoardVO auditionScheduleDetail(int bfNo);

	public List<NationVO> nationList();

	public void auditionSupportRegister(AuditionRegisterVO auditionRegisterVO);

	public List<AuditionRegisterVO> auditionRegisterList();

	public AuditionRegisterVO selectSupport(int arNo);

	public int updateSupport(AuditionRegisterVO auditionRegisterVO);

	public void deleteAuditionFile(int arNo);

	public void cancelSupport(AuditionRegisterVO auditionRegisterVO);

	public List<AuditionRegisterVO> auditionSupportCheck(AuditionRegisterVO auditionRegisterVO);

	public int cancelAudition(int arNo);

	public int insertAudition(AuditionBoardVO auditionBoardVO);

	public AuditionBoardVO auditionBoardDetail(int bfNo);


	public int deleteAudition(int bfNo);

	public int updateAudition(AuditionBoardVO auditionVO);




}
