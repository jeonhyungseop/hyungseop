package kr.or.ddit.cfms.sign.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;
import kr.or.ddit.cfms.head.commons.vo.StipulationVO;
import kr.or.ddit.cfms.sign.service.ISignService;

/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24    진유리         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/sign")
public class signController {
	@Inject
	private ISignService service;
	
	@GetMapping("/stipulation")
	public String stipulationForm() {
		return "commons/sign/stipulation";
	}
	
	@PostMapping("/stipulation")
	public String stipulation() {
		return null;
	}
	
	@GetMapping
	public String signForm(
		@RequestParam(required = false) String clauseService,
		@RequestParam(required = false) String clausePrivacy,
		@RequestParam(required = false, defaultValue = "N") String clauseLocation,
		@RequestParam(required = false, defaultValue = "N") String clausePromotion,
		@RequestParam(required = false) String chk_all,
		Model model, HttpSession session
	) {
		if(clauseService == null || clausePrivacy == null) {
			return "commons/login/login";
		}
		ComCodeGrpVO IdcCode = service.retrieveCodeList("IDC");
		model.addAttribute("IdcCode", IdcCode);
		Map<String, String> stipu = new HashMap<>();
		stipu.put("A0001", clauseService);
		stipu.put("A0002", clausePrivacy);
		stipu.put("B0001", clauseLocation);
		stipu.put("B0002", clausePromotion);
		session.setAttribute("stipu", stipu);
		session.setMaxInactiveInterval(60*5);
		return "commons/sign/sign";
	}
	
	@PostMapping
	public String sign(
		@ModelAttribute HeadquartersVO head
		, Model model, HttpSession session
	) {
		String view = null;
		String message = null;
		StringBuffer code = new StringBuffer();
		code.append("H" + (head.getHead_comnm_em().toUpperCase()).substring(0, 2));
		int number = service.selectNumber(code.toString());
		if(number == 0) {
			code.append("01");
		}else if(0<number && number < 10){
			code.append("0"+(number+1));
		}else if(number < 100) {
			code.append(number+1);
		}
		
		head.setHead_code(code.toString());
		
		List<StipulationVO> StipulationList = new ArrayList<>();
		Map<String, String> stipu = (Map<String, String>) session.getAttribute("stipu");
		if(stipu == null) {
			return "redirect:/login"; 
		}
		for(String key : stipu.keySet()) {
			StipulationVO vo = new StipulationVO();
			vo.setHead_code(code.toString());
			vo.setStplat_code(key);
			vo.setAgre_at(stipu.get(key));
			StipulationList.add(vo);
		}
		head.setStipulationList(StipulationList);
		System.out.println(StipulationList.toArray());
		
		ServiceResult result = service.insertHeadQuarter(head);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/login";
		}else {
			message = "서버 오류";
			view = "commons/sign/sign";
		}
		model.addAttribute("message", message);
		return view;
	}
	
	@GetMapping(value = "/idcheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> idCheck(
		@RequestParam("id") String id
	) {
		Map<String, Object> resultMap = new HashMap<>();
		int check = service.idCheck(id);
		if(check > 0) {
			resultMap.put("result", 'N');
		}else{
			resultMap.put("result", 'Y');
		}
		
		return resultMap;
	}
	
	
	@GetMapping(value = "/bizrnocheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> bizrnoCheck(
		@RequestParam("bizrno") String bizrno
	) {
		Map<String, Object> resultMap = new HashMap<>();
		int check = service.bizrnoCheck(bizrno);
		
		if(check > 0) {
			resultMap.put("result", 'N');
		}else{
			resultMap.put("result", 'Y');
		}
		
		return resultMap;
	}
	
	@GetMapping(value = "/mailauth", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> mailauth(
		@RequestParam("email") String email,
		HttpSession session
	) {
		Map<String, Object> resultMap = new HashMap<>();
//		Random createRandom = new Random();
//		for(int i=0; i<6; i++) {
//			auth.append(createRandom.nextInt(9));
//		}
		char[] keySet = new char[] { 
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 
			'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
			'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
			'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
		};
		StringBuffer auth = new StringBuffer();
		for(int i = 0; i < 6; i++) {
			int idx = (int)(keySet.length * Math.random());
			auth.append(keySet[idx]);
		}
		try {
			EmailSend(email, auth.toString());
			resultMap.put("result", 'Y');
		} catch (MessagingException e) {
			resultMap.put("result", 'N');
		}
		session.setAttribute("auth", auth.toString());
		session.setMaxInactiveInterval(60*5);
		return resultMap;
	}
	
	@PostMapping(value = "/mailauthcheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> mailauthcheck(
		@RequestParam("auth") String auth
		, HttpSession session
	) {
		Map<String, Object> resultMap = new HashMap<>();
		
		if(auth.equals(session.getAttribute("auth"))) {
			resultMap.put("result", 'Y');
		}else{
			resultMap.put("result", 'N');
		}
		
		return resultMap;
	}
	
	private void EmailSend(String email, String text) throws AddressException, MessagingException {
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
		message.setSubject("CFMS로부터 발송된 이메일 인증번호 입니다.");

		StringBuffer buffer = new StringBuffer();
		buffer.append("본인확인 인증번호는 [ ");
		buffer.append("<b><span style='color: rgb(58, 50, 195);'>"+text+"</span></b>");
		buffer.append(" ] 입니다.");
		// Text - 메일 내용 입력
		message.setContent(buffer.toString(), "text/html; charset=UTF-8");

		// send the message - 메일 전송
		Transport.send(message);

		// 성공 여부 출력
		System.out.println("message sent successfully...");
		
	}

}
