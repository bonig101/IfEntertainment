package kr.or.ddit.controller.goods;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.controller.community.CommunityMainController;
import kr.or.ddit.service.community.IJoinService;
import kr.or.ddit.service.goods.IGoodsNoticeService;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.community.MainArtistGroupVO;
import kr.or.ddit.vo.entertain.ArtistGroupVO;
import kr.or.ddit.vo.goods.GoodsNoticeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 굿즈샵 메인페이지
 * @author 성이수, 조재훈
 *
 */
@Controller
@Slf4j
@RequestMapping("/goods")
public class GoodsMainController {

	@Inject
	private IGoodsNoticeService goodsService;
	
	@Inject
	private IJoinService joinService;

	/**
	 * 굿즈샵 메인화면을 띄우는 컨트롤러(공지사항 슬라이더, 아티스트 굿즈 리스트)
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String goodsShopMain(Model model) {
		
		List<GoodsNoticeVO> goodsNoticeList = goodsService.selectgoodsNoticeMainList();
		model.addAttribute("goodsNoticeList", goodsNoticeList);
		
        int userNo = 0;
        
		// [스프링 시큐리티] 회원 ID를 스프링 시큐리티 UserDetails 정보에서 가져오기
        if(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
        	CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        	UserVO userVO = user.getUser();
        	model.addAttribute("userNo", userVO.getUserNo());
        userNo = userVO.getUserNo();
        }
		
		List<ArtistGroupVO> mycommunityList = joinService.selectmycommunityList(userNo);
		
		model.addAttribute("mycommunityList", mycommunityList);
		log.info("mycommunityList" + mycommunityList);
		List<ArtistGroupVO> artistList =joinService.goodsShopMainArtist();
		model.addAttribute("artistList", artistList);
		return "goods/goodsMain";
	}
	
	


}
