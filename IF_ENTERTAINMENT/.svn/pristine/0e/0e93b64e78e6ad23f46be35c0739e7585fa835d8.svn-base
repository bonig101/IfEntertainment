package kr.or.ddit.service.impl.common;

import java.util.Random;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import kr.or.ddit.service.common.IMailSendService;



@Component
public class MailSendService implements IMailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber; 
	private String randomPassword;
	
		public void makeRandomNumber() {
			// 난수의 범위 111111 ~ 999999 (6자리 난수)
			Random r = new Random();
			int checkNum = r.nextInt(888888) + 111111;
			authNumber = checkNum;
		}
		
		
		public void makeRandomPw() {
			String uuid = UUID.randomUUID().toString();
	        
	        String randomPw = uuid.replace("-", "").substring(0, 8).toUpperCase();

	        randomPassword = randomPw;
		}
		
		public String joinEmail(String email) {
			makeRandomNumber();
			String setFrom = ".com"; 
			// email-config에 설정한 자신의 이메일 주소를 입력 
			String toMail = email;
			String title = "회원 가입 인증 이메일 입니다.";
			// 이메일 제목 

			String content = "<div class=\"container\" style=\"width: 80%; margin: 0 auto;\">" +
				    "<div class=\"header\" style=\"background-color: #007bff; color: #fff; padding: 20px; text-align: center; border-top-left-radius: 10px; border-top-right-radius: 10px;\">" +
				        "<h1 style=\"font-size: 24px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);\">홈페이지를 방문해주셔서 감사합니다.</h1>" +
				    "</div>" +
				    "<div class=\"content\" style=\"padding: 20px; color: #333;\">" +
				        "<p class=\"email-info\" style=\"font-size: 18px; margin-bottom: 15px;\">회원 가입 인증 이메일입니다.</p>" +
				        "<p style=\"font-size: 16px; margin-bottom: 15px;\">인증 번호는 <strong style=\"color: #0000FF;\">" + authNumber + "</strong>입니다.</p>" +
				        "<p style=\"font-size: 16px; margin-bottom: 15px;\">해당 인증번호를 인증번호 확인란에 기입하여 주세요.</p>" +
				    "</div>" +
				    "<div class=\"footer\" style=\"background-color: #f4f4f4; padding: 20px; text-align: center; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;\">" +
				        "<p style=\"font-size: 14px;\">이 이메일은 자동으로 생성되었습니다. 문의 사항이 있으시면 저희에게 연락해주세요.</p>" +
				    "</div>" +
				"</div>";


			//이메일 내용 삽입
			mailSend(setFrom, toMail, title, content);
			return Integer.toString(authNumber);
		}
		
		//이메일 전송 메소드fazi rmze lwpj funv
		public void mailSend(String setFrom, String toMail, String title, String content) { 
			MimeMessage message = mailSender.createMimeMessage();
			// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
				helper.setText(content,true);
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		
		public String findPassword(String email) {
	        makeRandomPw();
	        String toMail = email; 
	        String title = "비밀번호 찾기 이메일입니다."; // 이메일 제목

	        // 이메일 내용 작성 (임시 비밀번호 포함)
	        String content = "<div class=\"container\" style=\"width: 80%; margin: 0 auto;\">" +
	                "<div class=\"header\" style=\"background-color: #007bff; color: #fff; padding: 20px; text-align: center; border-top-left-radius: 10px; border-top-right-radius: 10px;\">" +
	                    "<h1 style=\"font-size: 24px; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);\">비밀번호 찾기 이메일입니다.</h1>" +
	                "</div>" +
	                "<div class=\"content\" style=\"padding: 20px; color: #333;\">" +
	                    "<p class=\"email-info\" style=\"font-size: 18px; margin-bottom: 15px;\">임시 비밀번호가 발급되었습니다.</p>" +
	                    "<p style=\"font-size: 16px; margin-bottom: 15px;\">임시 비밀번호는 <strong style=\"color: #0000FF;\">" + randomPassword + "</strong>입니다.</p>" +
	                    "<p style=\"font-size: 16px; margin-bottom: 15px;\">로그인 후 비밀번호를 변경해주세요.</p>" +
	                "</div>" +
	                "<div class=\"footer\" style=\"background-color: #f4f4f4; padding: 20px; text-align: center; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;\">" +
	                    "<p style=\"font-size: 14px;\">이 이메일은 자동으로 생성되었습니다. 문의 사항이 있으시면 저희에게 연락해주세요.</p>" +
	                "</div>" +
	            "</div>";

	        // 이메일 전송
	        mailSend1(toMail, title, content);
	        return randomPassword; 
	    }

		private void mailSend1(String toMail, String title, String content) {
			MimeMessage message = mailSender.createMimeMessage();
			// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
				helper.setTo(toMail);
				helper.setSubject(title);
				// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
				helper.setText(content,true);
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
			

}