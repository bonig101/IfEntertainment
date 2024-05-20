package kr.or.ddit.service.entertain;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.entertain.IREventVO;
import kr.or.ddit.vo.entertain.IRFileAttachVO;
import kr.or.ddit.vo.entertain.IRFileVO;

public interface IIRService {

	// IR 행사일정
	public ServiceResult insertIREvent(HttpServletRequest req, IREventVO ireventVO);
	public int selectIREventCount(PaginationInfoVO<IREventVO> pagingVO);
	public List<IREventVO> selectIREventList(PaginationInfoVO<IREventVO> pagingVO);
	public IREventVO selectIREvent(int bfNo);
	public ServiceResult updateIREvent(HttpServletRequest req, IREventVO ireventVO);
	public ServiceResult deleteIREvent(HttpServletRequest req, int bfNo);

	// 사용자
	public int selectUserIREventCount(PaginationInfoVO<IREventVO> pagingVO);
	public List<IREventVO> selectUserIREventList(PaginationInfoVO<IREventVO> pagingVO);
	public IREventVO selectUserIREvent(int bfNo);
	
	// IR 파일
	public int selectFileCount(PaginationInfoVO<IRFileVO> pagingVO);
	public List<IRFileVO> selectIRFileList(PaginationInfoVO<IRFileVO> pagingVO);
	public ServiceResult insertIRFile(HttpServletRequest req, IRFileVO irFileVO);
	public IRFileVO selectIRFile(int bfNo);
	public List<IRFileAttachVO> getAttachFile(int bfNo);
	public ServiceResult updateIRFile(HttpServletRequest req, IRFileVO irFileVO, int[] updateFileNos);
	public ServiceResult deleteIRFile(int bfNo, HttpServletRequest req);

	

}
