package kr.or.ddit.controller.community;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.community.ICollectionService;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.MyCollectionVO;
import kr.or.ddit.vo.common.UserVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/community")
public class CollectionController {

	@Inject
	private ICollectionService collectionService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value="/myCollection.do", method = RequestMethod.GET)
	public String myCollection(Model model, @RequestParam(name ="ctId", required = false, defaultValue = "1") int ctId) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserVO userVO = user.getUser();
		
		List<MyCollectionVO> collectionList = collectionService.myCollectionList(userVO.getUserNo());
		model.addAttribute("collectionList", collectionList);
		model.addAttribute("ctId", ctId);
		return "commons/myCollection";
	}
	
}
