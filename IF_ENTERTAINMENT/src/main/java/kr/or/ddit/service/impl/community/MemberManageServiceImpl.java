package kr.or.ddit.service.impl.community;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.community.IMemberManageMapper;
import kr.or.ddit.service.community.IMemberManageService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.community.FeedReportVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberManageServiceImpl implements IMemberManageService {
	
	@Inject
	private IMemberManageMapper memberManageMapper;

	@Override
	public int selectMemberCount(PaginationInfoVO<UserVO> pagingVO) {
		return memberManageMapper.selectMemberCount(pagingVO);
	}

	@Override
	public List<UserVO> memberList(PaginationInfoVO<UserVO> pagingVO) {
		return memberManageMapper.memberList(pagingVO);
	}

	@Override
	public int selectFeedReportCount(PaginationInfoVO<FeedReportVO> pagingVO) {
		return memberManageMapper.selectFeedReportCount(pagingVO);
	}

	@Override
	public List<FeedReportVO> feedReportList(PaginationInfoVO<FeedReportVO> pagingVO) {
		
//		log.info("pagingVO.getStartRow() {}", pagingVO.getStartRow());
//		log.info("pagingVO.getEndRow() {}", pagingVO.getEndRow());
		
		return memberManageMapper.feedReportList(pagingVO);
	}

	@Override
	public void reportState(FeedReportVO feedReportVO) {
		memberManageMapper.reportState(feedReportVO);
	}

	@Override
	public FeedReportVO reportUpdate(FeedReportVO feedReportVO) {
		return memberManageMapper.reportUpdate(feedReportVO);
	}

	@Override
	public void reportUserStop(FeedReportVO reportUser) {
		 memberManageMapper.reportUserStop(reportUser);
		
	}

	@Override
	@Transactional(rollbackFor = {RuntimeException.class, IOException.class})
	public ServiceResult artistInsert(HttpServletRequest req, UserVO userVO) {
		ServiceResult result = null;
			
		try {
			artistInsertFileUpload(userVO.getImgFile(), userVO, req);
			
			memberManageMapper.artistInsert(userVO);
			
			memberManageMapper.artistAuthInsert(userVO.getUserNo());
			result = ServiceResult.OK;
			
		}catch(Exception e) {
			e.printStackTrace();
			result = ServiceResult.FAILED;
		}
//		log.info("resultresultImpl {}", result);
		return result;
	}

	private void artistInsertFileUpload(MultipartFile imgFile, UserVO userVO, HttpServletRequest req) throws Exception {
		
		String savePath = "/resources/upload/artistInsert/";
		
		String saveLocate = null;
		
		if(imgFile != null) {
			String saveName = UUID.randomUUID().toString();
			
			saveName += "_" + userVO.getImgFile().getOriginalFilename();
			
			saveLocate = req.getServletContext().getRealPath(savePath);
			
			File file = new File(saveLocate);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			saveLocate += saveName;
			
			File saveFile = new File(saveLocate);
//			log.info("saveFilesaveFilesaveFile {}", saveFile);
			userVO.getImgFile().transferTo(saveFile);
			
			savePath += saveName;
			
			userVO.setUserProfile(saveName);
		}
	}

	

}
