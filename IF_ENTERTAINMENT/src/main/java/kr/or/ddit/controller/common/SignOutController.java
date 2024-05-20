package kr.or.ddit.controller.common;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.common.ISignService;
import lombok.extern.slf4j.Slf4j;

/**
 * 로그아웃 컨트롤러
 * @author 홍진영
 */
@Controller
@Slf4j
@RequestMapping("/logout")
public class SignOutController {

	@Inject
	private ISignService signService;
	
}
