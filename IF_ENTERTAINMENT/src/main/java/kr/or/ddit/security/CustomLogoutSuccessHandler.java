package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler  {


	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		String outFlag = request.getParameter("outFlag");
		
		String targetUrl = "";
		
		log.info("### outFlag : {}", outFlag);
		
		if(StringUtils.equalsIgnoreCase("g", outFlag)) {
			targetUrl = "/goods/main.do";
		} else if(StringUtils.equalsIgnoreCase("c", outFlag)){
			targetUrl = "/community/main.do";
		} else {
			targetUrl = "/signin.do";
		}
		
		try {
			response.sendRedirect(targetUrl);
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
	}

}
