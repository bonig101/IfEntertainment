package kr.or.ddit.service.impl.community;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

import kr.or.ddit.mapper.common.IWebSocketMapper;
import kr.or.ddit.mapper.community.IFeedMapper;
import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.NotificationVO;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.community.MainArtistVO;
import kr.or.ddit.vo.community.MemberNickNameVO;
import kr.or.ddit.vo.goods.GoodsVO;
import kr.or.ddit.vo.community.MainArtistGroupVO;
import kr.or.ddit.vo.community.BanKeywordVO;
import kr.or.ddit.vo.community.CommunityVO;
import kr.or.ddit.vo.community.FeedAttachFileVO;
import kr.or.ddit.vo.community.FeedCommentLikeVO;
import kr.or.ddit.vo.community.FeedCommentVO;
import kr.or.ddit.vo.community.FeedLikeVO;
import kr.or.ddit.vo.community.FeedReportVO;
import kr.or.ddit.vo.community.FeedVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FeedServiceImpl implements IFeedService {

	@Inject
	private IFeedMapper feedMapper;
	
	@Inject
	private IWebSocketMapper websocketMapper;

	@Override
	public int selectFeedListCount(PaginationInfoVO<FeedVO> pagingVO) {
		return feedMapper.selectFeedListCount(pagingVO);
	}

	@Override
	public List<FeedVO> selectFeedList(PaginationInfoVO<FeedVO> pagingVO) {
		return feedMapper.selectFeedList(pagingVO);
	}

	@Override
	public void deleteFeed(FeedVO feedVO) {
		feedMapper.deleteFeed(feedVO);
		log.info("feedVOfeedVOfeedVO"+feedVO);
	}

	@Override
	public FeedVO feedListDetail(int feedNo) {
		return feedMapper.feedListDetail(feedNo);
	}

	@Override
	public ServiceResult insertFeed(HttpServletRequest req, FeedVO feedVO) {
		ServiceResult result = null;
		
		log.info("feedVOfeedVOfeedVO{}",feedVO);
		int status = feedMapper.insertFeed(feedVO);
		if(status > 0) {
			 List<FeedAttachFileVO> fileList = feedVO.getFeedFileList();
			 log.info("feedVOfeedVOfeedVO{}",feedVO.getFeedFileList());
			 log.info("fileList{}",fileList);
			 
			 try {
				 feedUpload(fileList, feedVO.getFeedNo(),feedVO.getFaFilter(), req);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
			 
			 result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	private void feedUpload(List<FeedAttachFileVO> fileList, int feedNo, String faFilter, HttpServletRequest req) {
	    String savePath = "/resources/feed/";
	    
	    if(fileList != null && fileList.size() > 0) {
	        for (FeedAttachFileVO feedFileVO : fileList) {
	            MultipartFile item = feedFileVO.getItem();
	            if (item != null && !item.isEmpty()) {
	                String savedName = UUID.randomUUID().toString();
	                savedName += "_" + item.getOriginalFilename();
	                String saveLocate = req.getServletContext().getRealPath(savePath);
	                File file = new File(saveLocate);
	                if(!file.exists()) {    
	                    file.mkdirs();       
	                }
	                saveLocate += File.separator + savedName; // 실제 업로드할 경로
	                
	                try {
	                    File uploadedFile = new File(saveLocate);
	                    item.transferTo(uploadedFile);
	                    
	                    feedFileVO.setFeedNo(feedNo);
	                    feedFileVO.setFaSavepath(saveLocate);
	                    feedFileVO.setFaSavedname(savedName);
	                    if(faFilter!=null) {
	                    feedFileVO.setFaFilter(faFilter);
	                    }else {
	                    	feedFileVO.setFaFilter("");
	                    }
	                    feedMapper.insertFeedFile(feedFileVO); 
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	    }
	}

	@Override
	public int selectCommentListCount(PaginationInfoVO<FeedCommentVO> pagingVO) {
		return feedMapper.selectCommentListCount(pagingVO);
	}

	@Override
	public List<FeedCommentVO> selectCommentList(PaginationInfoVO<FeedCommentVO> pagingVO) {
		return feedMapper.selectCommentList(pagingVO);
	}

	@Override
	public FeedCommentVO feedCommentListDetail(int fcNo) {
		
		return feedMapper.feedCommentListDetail(fcNo);
	}

	@Override
	public void deleteComment(FeedCommentVO commentVO) {
		log.info("commentVOcommentVO"+commentVO);
		feedMapper.deleteComment(commentVO);
	}

	@Override
	public void updateComment(FeedCommentVO commentVO) {
		feedMapper.updateComment(commentVO);
	}

	@Override
	public List<MainArtistGroupVO> selectArtist() {

		return feedMapper.selectArtist();
	}

	@Override
	public ServiceResult updateFeed(HttpServletRequest req, FeedVO feedVO) {
		ServiceResult result = null;
		int status = feedMapper.updateFeed(feedVO);
		// 수정 성공
		if(status > 0) {	
			List<FeedAttachFileVO> FeedFileList = feedVO.getFeedFileList();
			if(FeedFileList == null) {
				//파일없이 그냥 업로드할때 사진 수정없이 기본
				feedMapper.updateFeed1(feedVO);
			}else {
				
			feedMapper.deleteFeedFile(feedVO.getFeedNo());
			String feedSavedName=feedVO.getFaSavedname();
			
			log.info("###FeedFileList{}",FeedFileList);
			
			log.info("###feedSavedName",feedSavedName);
			try {
				feedUpload(FeedFileList,feedVO.getFeedNo(),feedVO.getFaFilter() , req);
				
				Integer[] delFeedNo = feedVO.getDelFeedNo();
				if(delFeedNo != null) {
					for(int i = 0; i < delFeedNo.length; i++) {
						FeedAttachFileVO FeedAttachFileVO = 
								feedMapper.selectFeedFile(delFeedNo[i]);
						File file = new File(FeedAttachFileVO.getFaSavepath());
						file.delete();	
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
			
			result = ServiceResult.OK;
		}else { 	
			// 수정 실패
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<MainArtistGroupVO> getArtistById(String agId) {
		return feedMapper.getArtistById(agId);
	}


	@Override
	public CommunityVO selectUser(CommunityVO communityVO) {
		log.info("communityVOcommunityVO"+communityVO);
		return feedMapper.selectUser(communityVO);
		
	}

	@Override
	public int comSignUp(CommunityVO comSignUp) {
		return feedMapper.comSignUp(comSignUp);
	}

	@Override
	public void nicSignUp(MemberNickNameVO nickVO) {
		feedMapper.nicSignUp(nickVO);
	}

	@Override
	public List<FeedVO> mainFeedList(String agId, String userType, Integer userNo) {
	   
		FeedVO feedVO = new FeedVO();
		if (userNo == null) {
		    feedVO.setAgId(agId);
		    feedVO.setUserType(userType);
		} else {
			feedVO.setAgId(agId);
		    feedVO.setUserType(userType);
		    feedVO.setUserNo(userNo);
		}
	    System.out.println("feedVOfeedVOfeedVO"+feedVO);
	    return feedMapper.mainFeedList(feedVO);
	}

	@Override
	public List<FeedCommentVO> mainCommentList(int feedNo) {
		
		return feedMapper.mainCommentList(feedNo);
	}

	@Override
	public List<FeedVO> getArtistFeed(String feedNo) {
		return feedMapper.getArtistFeed(feedNo);
	}

	@Override
	public List<FeedVO> getArtistFeedComment(int feedNo) {
		return feedMapper.getArtistFeedComment(feedNo);
	}

	/**
	 * <p>Feed 게시글 조회</p>
	 * - feedNo를 전달받아 해당 Feed 정보를 조회한다.
	 * 
	 * @param feedNo 피드번호
	 * @return feedNo에 해당하는 Feed 게시글 정보
	 */
	@Override
	public FeedVO selectFeed(int feedNo) {
		return feedMapper.selectFeed(feedNo);
	}

	@Override
	public void insertFeedComment(FeedCommentVO feedComVO) {
		
		feedMapper.insertFeedComment(feedComVO);
	}

	@Override
	public void feedReport(FeedReportVO feedReportVO) {
		log.info("FeedReportVO{}",feedReportVO);
		feedReportVO.setReportGubun("0");
		feedMapper.feedReport(feedReportVO);
	}

	@Override
	public void userReport(FeedReportVO feedReportVO) {
		log.info("FeedReportVO{}",feedReportVO);
		feedReportVO.setReportGubun("1");
		feedMapper.feedReport(feedReportVO);
		
	}

	@Override
	public List<FeedVO> artistCommentList(String agId) {
		
		return feedMapper.artistCommentList(agId);
	}

//	@Override
//	public UserVO userTypeSelect(int userNo) {
//		return feedMapper.userTypeSelect(userNo);
//	}

	@Override
	public List<FeedVO> myFeedList(int userNo, String agId) {
		
		
		FeedVO myFeed=new FeedVO();
		myFeed.setUserNo(userNo);
		myFeed.setAgId(agId);
		
		return feedMapper.myFeedList(myFeed);
	}

	@Override
	public List<FeedVO> myCommentList(int userNo, String agId) {
		FeedVO myFeed=new FeedVO();
		myFeed.setUserNo(userNo);
		myFeed.setAgId(agId);
		return feedMapper.myCommentList(myFeed);
	}

	@Override
	public String checkMembership(FeedVO feedVO) {
		return feedMapper.checkMembership(feedVO);
	}

	@Override
	public ServiceResult likePost(int feedNo, int userNo) {
		ServiceResult result = null;
		FeedLikeVO feedLike = new FeedLikeVO();
		feedLike.setFeedNo(feedNo);
		feedLike.setUserNo(userNo);
		if(feedLike !=null) {
			int status =feedMapper.likePost(feedLike);
			if(status >0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}
		return result;
	}

	@Override
	public String alreadyLiked(int feedNo, int userNo) {
		FeedLikeVO feedLike = new FeedLikeVO();
		feedLike.setFeedNo(feedNo);
		feedLike.setUserNo(userNo);
		
		return feedMapper.alreadyLiked(feedLike);
	}

	@Override
	public int getLikeCount(int feedNo) {
		return feedMapper.getLikeCount(feedNo);
	}

	@Override
	public void deleteLike(int feedNo, int userNo) {
		FeedLikeVO feedLike = new FeedLikeVO();
		feedLike.setFeedNo(feedNo);
		feedLike.setUserNo(userNo);
		feedMapper.deleteLike(feedLike);
	}

	@Override
	public String alreadyFeedLiked(int fcNo, int userNo) {
		FeedCommentLikeVO feedCommentLike = new FeedCommentLikeVO();
		feedCommentLike.setFcNo(fcNo);
		feedCommentLike.setUserNo(userNo);
		return feedMapper.alreadyFeedLiked(feedCommentLike);
	}

	@Override
	public void deleteFeedLike(int fcNo, int userNo) {
		FeedCommentLikeVO feedCommentLike = new FeedCommentLikeVO();		
		feedCommentLike.setFcNo(fcNo);
		feedCommentLike.setUserNo(userNo);
		feedMapper.deleteFeedLike(feedCommentLike);
	}

	@Override
	public ServiceResult likefeedPost(int fcNo, int userNo) {
		ServiceResult result = null;
		FeedCommentLikeVO feedCommentLike = new FeedCommentLikeVO();
		feedCommentLike.setFcNo(fcNo);
		feedCommentLike.setUserNo(userNo);
		if(feedCommentLike !=null) {
			int status =feedMapper.likefeedPost(feedCommentLike);
			if(status >0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}
		return result;
	}

	@Override
	public int getCommentLikeCount(int fcNo) {
		return feedMapper.getCommentLikeCount(fcNo);
	}

	@Override
	public MemberNickNameVO checkNickName(String mnNickname) {
		return feedMapper.checkNickName(mnNickname);
	}

	@Override
	public List<GoodsVO> getGoodsList(GoodsVO goodsVO) {
		return feedMapper.getGoodsList(goodsVO);
	}
	@Override
	public List<GoodsVO> getGoodsList1(String agId) {
		
		GoodsVO goodsVO=new GoodsVO();
		goodsVO.setGoodsArtist(agId);
		goodsVO.setGoodsMembership("M");
		return feedMapper.getGoodsList1(goodsVO);
	}

	@Override
	public String selectComment(FeedCommentVO commentVO) {
		return feedMapper.selectComment(commentVO);
	}

	@Override
	public List<MainArtistGroupVO> getArtist() {
		// TODO Auto-generated method stub
		return feedMapper.getArtist();
	}

	@Override
	public List<FeedVO> myFeedList1(int userNo, String agId) {
		FeedVO myFeed=new FeedVO();
		myFeed.setUserNo(userNo);
		myFeed.setAgId(agId);
		
		return feedMapper.myFeedList1(myFeed);
	}
	@Override
	public List<FeedVO> memberShipYn() {
		// TODO Auto-generated method stub
		return feedMapper.memberShipYn();
	}

	@Override
	public UserVO myPwCheck(UserVO userVO) {
		return feedMapper.myPwCheck(userVO);
	}

	@Override
	public List<BanKeywordVO> selectBanKeyword() {
		// TODO Auto-generated method stub
		return feedMapper.selectBanKeyword();
	}

}
