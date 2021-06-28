package kr.or.ddit.cfms.search.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.search.service.ISearchService;

/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                수정자               수정내용
 * --------     --------    ----------------------
 * 2021.05.30    진유리           최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/search")
public class searchContoller {
	@Inject
	private ISearchService service;
	
	@GetMapping("/id")
	public String idSearchForm() {
		return "commons/search/idSearch";
	}
	
	@PostMapping(value = "/id", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> idSearch(
		@RequestParam String group
		, @RequestParam String name
		, @RequestParam String email
		, @RequestParam String phone
	) {
		Map<String, Object> resultMap = new HashMap<>();
		
		Map<String, String> dataValues = new HashMap<>();
		dataValues.put("group", group);
		dataValues.put("name", name);
		dataValues.put("email", email);
		dataValues.put("phone", phone);
		String id = service.retrieveUser(dataValues);
		
		resultMap.put("id", id);
		return resultMap;
		
	}
	@GetMapping("/pw")
	public String passwordSearchForm() {
		return "commons/search/passwordSearch";
	}
	
	@PostMapping(value = "/pw", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> passwordSearch(
		@RequestParam String group
		, @RequestParam String id
		, @RequestParam String name
		, @RequestParam String email
		, @RequestParam String phone
	) {
		Map<String, Object> resultMap = new HashMap<>();
		
		Map<String, String> dataValues = new HashMap<>();
		dataValues.put("group", group);
		dataValues.put("name", name);
		dataValues.put("email", email);
		dataValues.put("phone", phone);
		
		String saveId = service.retrieveUser(dataValues);
		
		if(id.equals(saveId)) {
			char[] keySet = new char[] { 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 
				'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
				'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
			};
			StringBuffer password = new StringBuffer();
			for(int i = 0; i < 8; i++) {
				int idx = (int)(keySet.length * Math.random());
				password.append(keySet[idx]);
			}
			
			dataValues.put("id", id);
			dataValues.put("password", password.toString());
			
			int cnt = service.changePassword(dataValues);
			
			if(cnt>0) {
				try {
					EmailSend(email, id, password.toString());
					resultMap.put("result", "OK");
				} catch (MessagingException e) {
					resultMap.put("result", "SERVER");
				}
			}else {
				resultMap.put("result", "FAIL");
			}
		}else {
			resultMap.put("result", "NOTEXIST");
		}
		
		return resultMap;
		
	}
	
	private void EmailSend(String email, String id, String text) throws AddressException, MessagingException {
		// 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		final String user = "cfms202011@gmail.com";

		// 패스워드
		final String password = "java1234*";

		// SMTP 서버 정보를 설정한다. (SMTP - simple mail transfer protocol : 간이 우편 전송 프로토콜)
		/*
		 * Properties는 속성 SMTP 프로토콜 공급자로 JavaMail 세션 개체에서 설정할 수있습니다. 
		 * 속성은 항상 문자열로 설정됨. Map처럼 Key - Value 형식으로 삽입 가능, 주로 어플리케이션의 환경 설정과 관련된 속성을 저장. 
		 */
		Properties prop = new Properties();
		prop.setProperty("mail.smtp.starttls.enable", "true");
        prop.setProperty("mail.smtp.port", "465");
        prop.setProperty("mail.smtp.user", "user");
        prop.setProperty("mail.smtp.auth", "true");
        prop.setProperty("mail.smtp.ssl.enable", "false");
        prop.setProperty("mail.session.mail.smtp.auth.mechanisms", "LOGIN");
        prop.setProperty("mail.session.mail.smtp.auth.plain.disable", "false");
        prop.setProperty("mail.session.mail.smtp.starttls.enable", "false");
        prop.put("mail.smtp.host", "smtp.gmail.com"); // 내가 사용할 이메일
		prop.put("mail.smtp.port", 465); // 포트 설정
		prop.put("mail.smtp.auth", "true"); // 인증 설정
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		// 설정한 SMTP 정보를 넘겨줌
		// Session 클래스의 getDefaultInstance() 메소드는 파라미터로 전달받은 Properties에 저장되어 있는
		// 속성값을 사용하여 세션을 생성

		// PasswordAuthentication <= 사용자 명과 패스워드를 위한 리포지터리(repository) / 저장소
		// 매개변수로 사용할 이메일의 아이디와 비밀번호를 입력한다.

		// 세션(session)이란 웹 사이트의 여러 페이지에 걸쳐 사용되는 사용자 정보를 저장하는 방법을 의미합니다.
		// Authenticator는 네트워크 연결을 위해 인증을 얻기 위한 수단으로 사용하는 객체
		Session session = Session.getDefaultInstance(prop,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

		// 메시지 입력을 위한 인스턴스 생성
		MimeMessage message = new MimeMessage(session);

		// ARPA : 방위고등연구계획국 - 약칭으로 아파넷
		// RFC822: Standard for ARPA Internet Text Messages
		// InternetAddress는 syntax RFC822를 사용하는 인터넷이메일 주소를 나타냄
		message.setFrom(new InternetAddress(user));
	
		// 수신자메일주소
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

		// Subject - 제목을 입력
		message.setSubject("CFMS로부터 발송된 비밀번호 메일입니다.");

		StringBuffer buffer = new StringBuffer();
		buffer.append(id+" 회원님의 새로운 비밀번호는 ");
		buffer.append("[ <b><span style='color: rgb(58, 50, 195);'>" + text + "</span></b> ] 입니다.");
		buffer.append("<br>로그인 후 마이페이지를 통해 비밀번호 수정을 부탁드립니다.");
		// Text - 메일 내용 입력
		message.setContent(buffer.toString(), "text/html; charset=UTF-8");

		// send the message - 메일 전송
		Transport.send(message);

		// 성공 여부 출력
		System.out.println("message sent successfully...");
		
	}
}
