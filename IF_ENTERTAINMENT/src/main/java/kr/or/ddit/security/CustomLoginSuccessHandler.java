package kr.or.ddit.security;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	private RequestCache requestCache = new HttpSessionRequestCache();
	
//	@Inject
//	private IAdminService adminService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("## Login Success");
		
		User customUser = (User) authentication.getPrincipal();
		
		// 인증이 완료된 사용자 ID 꺼내기
		log.info("## username : " + customUser.getUsername());
		// 인증이 완료된 사용자 PW 꺼내기
		log.info("## password : " + customUser.getPassword());
		// 인증이 완료된 사용자 권한 꺼내기
		log.info("## getAuthorities : " + customUser.getAuthorities());
		
		Collection<GrantedAuthority> authorities = customUser.getAuthorities();
		boolean adminAuth = false;
		for (GrantedAuthority authority : authorities) {
		    if (authority.getAuthority().equals("ROLE_ADMIN")) {
		        adminAuth = true;
		        break;
		    }
		}
		
		// 세션에 등록되어 있는 인증 과정에서 발생한 에러 정보를 삭제
		clearAuthenticationAttribute(request);
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String targetUrl = "/community/main.do";
		
		System.out.println("==========================================");
		log.info("savedRequest : {}", savedRequest);
		log.info("requestCache : {}", request.getAuthType());
		log.info("requestCache flag: {}", request.getParameter("flag"));
		
		String flag = request.getParameter("flag");
		
		if (adminAuth) { // 'ROLE_ADMIN' 권한이 있는 경우 
			targetUrl = "/admin"; // admin main페이지로 보낸다
		} else {	// 일반 유저 로그인인 경우
			if (savedRequest != null) {
				targetUrl = savedRequest.getRedirectUrl();
			} else {
				// 타겟 정보가 존재하지 않고 굿즈샵에서 로그인한 경우 굿즈샵 메인으로 보냄
				if (StringUtils.equalsIgnoreCase("g", flag)) { 
					targetUrl = "/goods/main.do";
				  // 타겟 정보가 존재하지 않고 커뮤니티에서 로그인한 경우 커뮤니티 메인으로 보냄	
				} else if (StringUtils.equalsIgnoreCase("c", flag)) { 
					targetUrl = "/community/main.do";
				}
			}
		}
		log.info("Login Success targetUrl : {}", targetUrl);
		response.sendRedirect(targetUrl);

	}

	private void clearAuthenticationAttribute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session == null) {
			return;
		}
		
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

}
