package kr.or.ddit.controller.goods;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.goods.IAddressService;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.entertain.NationVO;
import kr.or.ddit.vo.goods.AddressVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 배송주소와 관련된 기능을 처리하는 컨트롤러
 * @author 조재훈
 *
 */
@Controller
@Slf4j
@RequestMapping("/goods/address")
public class AddressController {
	
	@Inject
	private IAddressService addressService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "manage.do", method = RequestMethod.GET)
	public String addressManage(Model model, String maNumber) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserVO userVO = user.getUser();
		String userNo = userVO.getUserNo() + "";
		
		List<AddressVO> addressList = addressService.addressManaege(userNo);
		List<NationVO> nationList = addressService.nationSelect();
		log.info("addressList" + addressList);
		model.addAttribute("addressList",addressList);
		model.addAttribute("userNo",userNo);
		model.addAttribute("maNumber",maNumber);
		model.addAttribute("nationList",nationList);
		return "goods/addressManage";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "/addressInsert.do" , method=RequestMethod.POST)
	public ResponseEntity<String> addressInsert(@RequestBody AddressVO addressVO) {
		int status = 0;
		log.info("cartVOasdasd ???" + addressVO);
		status = addressService.addressInsert(addressVO);
		
		if (status > 0) { 
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "/addressDelete.do" , method=RequestMethod.POST)
	public ResponseEntity<String> addressDelete(@RequestBody AddressVO addressVO) {
		int status = 0;
		status = addressService.addressDelete(addressVO);
		log.info("addressVO ???" + addressVO);
		log.info("status ???" + status);
		
		if (status > 0) { 
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "/addressUpdate.do" , method=RequestMethod.POST)
	public ResponseEntity<String> addressUpdate(@RequestBody AddressVO addressVO) {
		int status = 0;
		log.info("13324 ???" + addressVO);
		status = addressService.addressUpdate(addressVO);
		
		if (status > 0) { 
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value = "/addressDefault.do" , method=RequestMethod.POST)
	public ResponseEntity<String> addressDefault(@RequestBody AddressVO addressVO) {
		int status = 0;
		log.info("1133333 ???" + addressVO);
		status = addressService.addressDefault(addressVO);
		log.info("113status3333 ???" + status);
		
		if (status > 0) { 
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
}
