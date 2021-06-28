package kr.or.ddit.cfms.head.headmypage.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.employee.controller.EmployeeController;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.headmypage.service.IHHeadMypageService;
import kr.or.ddit.cfms.head.mypage.service.IAuthenticateService;
import kr.or.ddit.cfms.head.mypage.service.IHeadMypageService;
import kr.or.ddit.cfms.head.mypage.vo.headVO;

/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 19      작성자명       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 *      </pre>
 */
@Controller
@RequestMapping("/head/headmypage")
public class headMypageController {
	@Inject
	private IHeadMypageService service;
	@Inject
	private IHHeadMypageService headService;
	@Inject
	IAuthenticateService authService;
	private final Logger logger = LoggerFactory.getLogger(headMypageController.class);

	@GetMapping()
	@RequestMapping(method = RequestMethod.POST)
	public String mypageGet(Model model, HttpSession session, @RequestParam("mem_pass") String mem_pass,
			Authentication authentication, @ModelAttribute("headvo") headVO headvo,
			RedirectAttributes redirectAttributes) {
		System.out.println("들어오긴혀?");
		String empid = authentication.getName();
		headvo.setHead_id(empid);
		headvo.setHead_pass(mem_pass);

		ServiceResult result = authService.myheadauthenticate(headvo);
		String view = null;

		if (ServiceResult.OK.equals(result)) {
			System.out.println("오잉 여기가아닌가??");

			headVO employeeOne = service.selectHeadMy(empid);
			imageBase(employeeOne);
			model.addAttribute("employeeOne", employeeOne);
			view = "/head/headmypage/headmypageDetail";
		} else {
			System.out.println("오잉 여기??");
			redirectAttributes.addFlashAttribute("message", "비번 오류");
			view = "redirect:/head/mypage";
		}

		return view;
	}

	private void imageBase(headVO employeeVO) {
		InputStream imageStream;
		if (employeeVO.getAttachfileList().size() > 0 || !employeeVO.getAttachfileList().isEmpty()) {

			for (AttachfileVO attach : employeeVO.getAttachfileList()) {
				try {
					// FileInputStream으로 파일을 불러온다
					imageStream = new FileInputStream(attach.getFile_path() + "/" + attach.getSave_filenm());
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

	@GetMapping("/modify")
	public String updateForm(

		@RequestParam("what") String empId, Model model, HttpSession session) {

		String headCode = (String) session.getAttribute("code");
		headVO employeeOne = service.selectHeadMy(empId);
		imageBase(employeeOne);

		model.addAttribute("employeeOne", employeeOne);

		return "/head/headmypage/headmypageForm";

	}

	@PostMapping(value = "/modify")
	public String update(
			@ModelAttribute("headvo") headVO head, 
			HttpSession session) {
		System.out.println("여기를 못타네");
		
		ServiceResult result = null;
		String view = null;
		String headCode = (String) session.getAttribute("code");
		String id = (String) session.getAttribute("authId");
		logger.info("================EMPLOYEEVO 값 {}===================", head);
		logger.info("================EMPLOYEEVO 값 {}===================", head);
		String before_att_fileno = head.getAtt_fileno();
		head.setBefore_att_fileno(before_att_fileno);
		head.setHead_code(headCode);
		head.setHead_id(id);

		result = service.updateheadMypage(head);
		if(ServiceResult.OK.equals(result)) {
			
			if(head.getHead_id().equals(id)) {
				session.removeAttribute("headImgVO");
				headVO headImgVO = service.selectHeadMy(id); //직원이미지
				imageBase(headImgVO);
				
				session.setAttribute("headImgVO", headImgVO);
			}
			
			
			view = "redirect:/head/main";
		}
	

		return view;

	}

}
