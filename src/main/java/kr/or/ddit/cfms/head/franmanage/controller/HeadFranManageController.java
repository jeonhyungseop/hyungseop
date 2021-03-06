package kr.or.ddit.cfms.head.franmanage.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.View;
import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.franmanage.service.IHeadFranManageService;
import kr.or.ddit.cfms.view.ExcelDownloadViewWithJxls;

/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 19      작성자명       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/franmanage")
public class HeadFranManageController {
	@Inject
	private IHeadFranManageService service;
	
	@Inject
	private WebApplicationContext container;
	
	@GetMapping
	public String franManageList(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@RequestParam(value ="selector", required = false, defaultValue = "10") int selectorRow,
		@RequestParam(value="searchNm", required = false) String searchNm,
		@RequestParam(value="startDate", required = false) String startDate,
		@RequestParam(value="endDate", required = false) String endDate,
		@RequestParam(value="searchArea", required = false) String searchArea,
		@RequestParam(value="franClose", required = false) String franClose,
		Model model, HttpSession session
	) {
		PagingVO<FranchiseVO> pagingVO  = listForAjax(currentPage, selectorRow, searchNm, startDate, endDate, searchArea, franClose, session);
		Map<String, String> franAreaMap = new LinkedHashMap<>();
		franAreaMap.put("강원", "강원");
		franAreaMap.put("경기", "경기");
		franAreaMap.put("경남", "경남");
		franAreaMap.put("경북", "경북");
		franAreaMap.put("광주", "광주");
		franAreaMap.put("대구", "대구");
		franAreaMap.put("대전", "대전");
		franAreaMap.put("부산", "부산");
		franAreaMap.put("서울", "서울");
		franAreaMap.put("세종", "세종");
		franAreaMap.put("울산", "울산");
		franAreaMap.put("인천", "인천");
		franAreaMap.put("전남", "전남");
		franAreaMap.put("전북", "전북");
		franAreaMap.put("제주", "제주");
		franAreaMap.put("충남", "충남");
		franAreaMap.put("충북", "충북");
		model.addAttribute("FranArea", franAreaMap);
		model.addAttribute("pagingVO", pagingVO);
		return "/head/franmanage/franList";
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<FranchiseVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@RequestParam(value ="selector", required = false, defaultValue = "10") int selectorRow,
		@RequestParam(value="searchNm", required = false) String searchNm,
		@RequestParam(value="startDate", required = false) String startDate,
		@RequestParam(value="endDate", required = false) String endDate,
		@RequestParam(value="searchArea", required = false) String searchArea,
		@RequestParam(value="franClose", required = false) String franClose,
		HttpSession session
	){
		/**파라미터 조회 - 세션에 담긴 가맹본부 코드 저장*/
		String code = (String) session.getAttribute("code");
		
		/**결과자료 객체 생성*/
		PagingVO<FranchiseVO> pagingVO = new PagingVO<>(selectorRow, 10, currentPage);
		pagingVO.addSearchMap("searchNm", searchNm);
		pagingVO.addSearchMap("startDate", startDate);
		pagingVO.addSearchMap("endDate", endDate);
		pagingVO.addSearchMap("searchArea", searchArea);
		pagingVO.addSearchMap("franClose", franClose);
		pagingVO.setDetailSearch(new FranchiseVO(code));
		
		/**파라미터 검증*/
		
		/**서비스 데이터 구성*/
		
		/**서비스 요청*/
		int totalRecord = service.retrieveFranCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<FranchiseVO> headquarterList = service.retrieveFranList(pagingVO);
		for(FranchiseVO fran: headquarterList) {
			String telno = fran.getFran_telno();
			String address = fran.getFran_baadd();
			String celno = fran.getFowner_celno();
			if(telno != null && address.contains("서울")) {
				fran.setFran_telno(telno.substring(0,2)+"-"+telno.substring(2,5)+"-"+telno.substring(5));
			}else if(telno!=null) {
				fran.setFran_telno(telno.substring(0,3)+"-"+telno.substring(3,6)+"-"+telno.substring(6));
			}
			
			if(celno!= null && celno.length() == 11) {
				fran.setFowner_celno(celno.substring(0,3)+"-"+celno.substring(3,7)+"-"+celno.substring(7));
			}else if(celno!= null && celno.length() == 10) {
				fran.setFowner_celno(celno.substring(0,3)+"-"+celno.substring(3,6)+"-"+celno.substring(6));
			}
		}
		pagingVO.setDataList(headquarterList);
		
		/**결과전송*/
		return pagingVO;
	}
	
	@GetMapping("/excelDownload")
	public View excelDownload(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@RequestParam(value ="selector", required = false, defaultValue = "10") int selectorRow,
		@RequestParam(value="searchNm", required = false) String searchNm,
		@RequestParam(value="startDate", required = false) String startDate,
		@RequestParam(value="endDate", required = false) String endDate,
		@RequestParam(value="searchArea", required = false) String searchArea,
		@RequestParam(value="franClose", required = false) String franClose,
		Model model, HttpSession session
	) {
		String code = (String) session.getAttribute("code");
		if(code == null) {
			return null;
		}
		PagingVO<FranchiseVO> pagingVO  = listForAjax(currentPage, selectorRow, searchNm, startDate, endDate, searchArea, franClose, session);
		model.addAttribute("pagingVO", pagingVO);
		Map<String, String> resultMap = service.retrieveHeadInfo(code);
		
		return new ExcelDownloadViewWithJxls() {
			
			@Override
			public Resource getJxlsTemplate() throws IOException {
				return container.getResource("/WEB-INF/jxlstmpl/FranListTemplate.xlsx");
			}
			
			@Override
			public String getDownloadFileName() {
				return resultMap.get("head_comnm")+"의 가맹점 리스트.xlsx";
			}
		};
	}
	
	@GetMapping("/map")
	public String franManageMap(
	) {
		return "/head/franmanage/franMap";
	}
	
	@GetMapping("/getMap")
	@ResponseBody
	public List<FranchiseVO> GetMap(
		HttpSession session
	) {
		String code = (String) session.getAttribute("code");
		if(code==null) {
			return null;
		}
		List<FranchiseVO> franList = service.retrieveFranMap(code);
		return franList;
	}
	
	@GetMapping("/detail")
	public String franManageDetail(
		@RequestParam("what") String fran_code
		, HttpSession session
		, Model model
	) {
		Map<String, Object> param = new HashMap<>();
		param.put("code", (String) session.getAttribute("code"));
		param.put("fran_code", fran_code);
		FranchiseVO fran = service.retrieveFran(param);
		if(fran == null) {
			return "/head/franmanage/";
		}
		String telno = fran.getFran_telno();
		String address = fran.getFran_baadd();
		String celno = fran.getFowner_celno();
		if(telno != null && address.contains("서울")) {
			fran.setFran_telno(telno.substring(0,2)+"-"+telno.substring(2,5)+"-"+telno.substring(5));
		}else if(telno!=null) {
			fran.setFran_telno(telno.substring(0,3)+"-"+telno.substring(3,6)+"-"+telno.substring(6));
		}
		
		if(celno!= null && celno.length() == 11) {
			fran.setFowner_celno(celno.substring(0,3)+"-"+celno.substring(3,7)+"-"+celno.substring(7));
		}else if(celno!= null && celno.length() == 10) {
			fran.setFowner_celno(celno.substring(0,3)+"-"+celno.substring(3,6)+"-"+celno.substring(6));
		}
		imageBase(fran);
		model.addAttribute("fran", fran);
		return "/head/franmanage/franDetail";
	}
	
	private void imageBase(FranchiseVO fran) {
		InputStream imageStream;
		if(fran.getAttachfileList().size() > 0 || !fran.getAttachfileList().isEmpty()) {
			
			for(AttachfileVO attach : fran.getAttachfileList()) {
				try {
					/**썸네일 이미지*/
					// FileInputStream으로 파일을 불러온다
					imageStream = new FileInputStream(attach.getFile_path()+"/"+attach.getSave_filenm());
					// IOUtils.toByteArray 바이트배열로 바꿔서 저장
					byte[] imageBtyeArray = IOUtils.toByteArray(imageStream);
					imageStream.close();
					// 이진데이터로 바꾼다
					// 바이트배열을 Base64.encodeBase64형식에 맞춰서 인코딩 하는 작업
					byte[] encodeBase64 = Base64.encodeBase64(imageBtyeArray);
					// 인코딩 된 데이터를 보내준다.
					String base64DataString = new String(encodeBase64, "UTF-8");
					// file_img저장될때는 사용되는게 아니고 이미지를 표현할떄 사용된다.
					attach.setFile_img(base64DataString);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			
		}
	}
	
	@PostMapping(value = "/closing", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> registerClosing(
		@RequestParam String franCode
	) {
		Map<String, Object> resultMap = new HashMap<>();
		int cnt = service.updateFranClose(franCode);
		if(cnt>0) {
			resultMap.put("result", "OK");
		}else {
			resultMap.put("result", "FAIL");
		}
		return resultMap;
	}
	
	@PostMapping(value = "/restore", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> Restore(
		@RequestParam String franCode
	) {
		Map<String, Object> resultMap = new HashMap<>();
		int cnt = service.updateFranRestore(franCode);
		if(cnt>0) {
			resultMap.put("result", "OK");
		}else {
			resultMap.put("result", "FAIL");
		}
		return resultMap;
	}
	
	@GetMapping("/form")
	public String franManageForm(
		Model model
	) {
		ComCodeGrpVO FstCode = service.retrieveCodeList("FST");
		ComCodeGrpVO FseCode = service.retrieveCodeList("FSE");
		model.addAttribute("FstCode", FstCode);
		model.addAttribute("FseCode", FseCode);
		return "/head/franmanage/franRegisterForm";
	}
	
	@PostMapping("/form")
	public String insert(
		@ModelAttribute FranchiseVO fran
		, Model model, HttpSession session
	) throws AddressException, MessagingException {
//		{pin_no=RUWP7HTZ92ZL, fran_code=HTC0100011, head_bizrno=1234567890}
		String view = null;
		String code = (String) session.getAttribute("code");
		Map<String, String> resultMap = service.retrieveHeadInfo(code);
		fran.setBizrno(resultMap.get("head_bizrno"));
		fran.setHead_code(code);
		fran.setFran_code(resultMap.get("fran_code"));
		fran.setPin_no(resultMap.get("pin_no"));
		char[] keySet = new char[] { 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 
				'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
				'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
		};
		StringBuffer auth = new StringBuffer();
		for(int i = 0; i < 9; i++) {
			int idx = (int)(keySet.length * Math.random());
			auth.append(keySet[idx]);
		}
		fran.setFran_pass(auth.toString());
		ServiceResult result = service.createFranchise(fran);
		if(ServiceResult.OK.equals(result)) {
			EmailSend(fran.getFran_id(), fran.getFowner_email(), auth.toString());
			view = "redirect:/head/franmanage";
		}else {
			view  = "/head/franmanage/franRegisterForm";
		}
		return view;
		
	}
	
	private void EmailSend(String id, String email, String text) throws AddressException, MessagingException {
		final String user = "cfms202011@gmail.com";

		final String password = "java1234*";

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

		Session session = Session.getDefaultInstance(prop,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

		MimeMessage message = new MimeMessage(session);

		message.setFrom(new InternetAddress(user));
	
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

		message.setSubject("CFMS로부터 발송된 이메일 인증번호 입니다.");

		StringBuffer buffer = new StringBuffer();
		buffer.append(id+"님의 ");
		buffer.append("비밀번호는 [ ");
		buffer.append("<b><span style='color: rgb(58, 50, 195);'>"+text+"</span></b>");
		buffer.append(" ] 입니다. <br> 내 정보 보기를 통해 비밀번호를 수정해주세요.");
		message.setContent(buffer.toString(), "text/html; charset=UTF-8");

		Transport.send(message);

		System.out.println("message sent successfully...");
	}
}
