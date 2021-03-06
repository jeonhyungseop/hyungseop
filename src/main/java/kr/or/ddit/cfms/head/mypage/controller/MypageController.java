package kr.or.ddit.cfms.head.mypage.controller;

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
import kr.or.ddit.cfms.head.employee.dao.IHeadEmployeeDAO;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.mypage.service.IAuthenticateService;
import kr.or.ddit.cfms.head.mypage.service.IHeadMypageService;
import kr.or.ddit.cfms.head.mypage.vo.vmemberVO;

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
@RequestMapping("/head/mypage")
public class MypageController {
	@Inject
	private IHeadMypageService service;
	@Inject
	private IHeadEmployeeDAO headDAO;
	@Inject
	IAuthenticateService authService;
	private final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@GetMapping()
	public String mypageAuth(Model model,
							HttpSession session,
							@ModelAttribute("vmembervo") vmemberVO vmembervo
							) {
		String id = (String) session.getAttribute("authId");
		String view = null;
		vmembervo = service.selectSe(id);
		String se = vmembervo.getSe();
		
		if(se.equals("직원")) {
			view = "/head/mypage/mypagePassword";
		}else {
			view = "/head/headmypage/headmypagePassword";
		}
		
		return view;
	}
	
	@GetMapping()
	@RequestMapping (method=RequestMethod.POST)
	public String mypageGet(Model model,
							HttpSession session,
							@RequestParam("mem_pass") String mem_pass
							, Authentication authentication,
							@ModelAttribute("employee") EmployeeVO employee
							,RedirectAttributes redirectAttributes
							) {
		String empid = authentication.getName();
		employee.setEmp_id(empid);
		employee.setEmp_pass(mem_pass);
		
		ServiceResult result = 
				authService.myauthenticate(employee);
		String view = null;
		
		if(ServiceResult.OK.equals(result)) {
			System.out.println("오잉 여기가아닌가??");
			EmployeeVO employeeOne = service.selectMyOne(empid);
			imageBase(employeeOne);
			model.addAttribute("employeeOne", employeeOne);
			view = "/head/mypage/mypageDetail";
		}else {
			System.out.println("오잉 여기??");
			redirectAttributes.addFlashAttribute("message", "비번 오류");
			view = "redirect:/head/mypage";
		}
		
		
	
		

		
	
		return view;
	}

	private void imageBase(EmployeeVO employeeVO) {
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
			@RequestParam("what") String empId,
			Model model,
			HttpSession session
			) {
		
		String headCode = (String) session.getAttribute("code");
		EmployeeVO employeeOne = service.selectMyOne(empId);
		imageBase(employeeOne);
		
		
		List<ComCodeVO> comcodeECL = service.comcodeECL();
		List<ComCodeVO> comcodeESE = service.comcodeESE();
		
		/*
		 * model.addAttribute("comcodeECL", comcodeECL);
		 * model.addAttribute("comcodeESE", comcodeESE); model.addAttribute("deptList",
		 * deptList);
		 */
		model.addAttribute("comcodeECL", comcodeECL);
		model.addAttribute("comcodeESE", comcodeESE);
		model.addAttribute("employeeOne", employeeOne);
		
		
		
		return "/head/mypage/mypageForm";
		
	}
	
	@PostMapping(value = "/modify")	
	public String update(
			@ModelAttribute("employee") EmployeeVO employee,
			HttpSession session
			) {
		System.out.println("여기를");
		ServiceResult result = null;
		String view = null;
		String headCode = (String) session.getAttribute("code");
		String empId = (String) session.getAttribute("authId");
		logger.info("================EMPLOYEEVO 값 {}===================", employee);
		logger.info("================EMPLOYEEVO 값 {}===================", employee);
		String before_att_fileno = employee.getAtt_fileno();
		employee.setBefore_att_fileno(before_att_fileno);
		employee.setHead_code(headCode);
		
		result = service.updateMypage(employee);
		if(ServiceResult.OK.equals(result)) {
			
			if(employee.getEmp_id().equals(empId)) {
				session.removeAttribute("empImgVO");
				EmployeeVO empImgVO = headDAO.selectEmpOne(empId); //직원이미지
				imageBase(empImgVO);
				
				session.setAttribute("empImgVO", empImgVO);
			}
			
			
			view = "redirect:/head/main";
		}
		
		return view;
		
	}
	
	




}
