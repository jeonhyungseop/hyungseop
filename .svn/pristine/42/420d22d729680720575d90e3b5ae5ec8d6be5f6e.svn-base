package kr.or.ddit.cfms.head.employee.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.employee.dao.IHeadEmployeeDAO;
import kr.or.ddit.cfms.head.employee.service.IHeadEmployeeService;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.utils.CryptoUtil;

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
 * 2021. 6. 7       진예은          직원목록조회
 * 2021. 6. 8       진예은          직원등록(파일첨부)
 * 2021. 6. 24      진예은          직원수정시 세션값 변경
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/employee")
public class EmployeeController {

	@Inject
	private IHeadEmployeeService service;
	
	@Inject
	private IHeadEmployeeDAO headDAO;
	
	private final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@GetMapping
	public String employeeList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="searchWord", required = false) String searchWord,
			@RequestParam(value="deptSeq", required = false) String deptSeq,
			@RequestParam(value="clspCode", required = false) String clspCode,
			@RequestParam(value="leaveUseAT", required = false) String leaveUseAT,
			HttpSession session,
			Model model,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
			) {
		String headCode = (String) session.getAttribute("code");
		
		//공통코드
		List<ComCodeVO> comcodeECL = service.comcodeECL();
		List<ComCodeVO> comcodeESE = service.comcodeESE();
		List<DeptVO> deptList = service.selectDept(headCode);
		model.addAttribute("comcodeECL", comcodeECL);
		model.addAttribute("comcodeESE", comcodeESE);
		model.addAttribute("deptList", deptList);
		
		
		PagingVO<EmployeeVO> pagingVO = listForAjax(currentPage, searchWord, deptSeq, clspCode, leaveUseAT, session, selectorRow);
		model.addAttribute("pagingVO", pagingVO);
		
		
		return "/head/employee/employeeList";
		
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<EmployeeVO> listForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value="searchWord", required = false) String searchWord,
			@RequestParam(value="deptSeq", required = false) String deptSeq,
			@RequestParam(value="clspCode", required = false) String clspCode,
			@RequestParam(value="leaveUseAT", required = false) String leaveUseAT,
			HttpSession session,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
			){

		/** 파라미터 조회 */
		String headCode = (String) session.getAttribute("code");
		
		/** 결과자료 객체 생성 */
		PagingVO<EmployeeVO> pagingVO = new PagingVO<>(selectorRow, 10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setHead_code(headCode);
		
		logger.info("=============searchWord : {} ========", searchWord);
		logger.info("=============deptSeq : {} ========", deptSeq);
		logger.info("=============clspCode : {} ========", clspCode);
		logger.info("=============leaveUseAT : {} ========", leaveUseAT);
		
		//검색조건
		pagingVO.addSearchMap("searchWord", searchWord);
		pagingVO.addSearchMap("deptSeq", deptSeq);
		pagingVO.addSearchMap("clspCode", clspCode);
		pagingVO.addSearchMap("leaveUseAT", leaveUseAT);
		
		int totalRecord = service.selectEmpCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		/** 서비스 요청 */
		List<EmployeeVO> empList = service.selectEmpList(pagingVO);
		
		for(EmployeeVO employeeVO : empList) {
			String emp_encpn = employeeVO.getEmp_encpn();
			String emp_cellno = employeeVO.getEmp_celno();
			
			if(emp_encpn.length() == 8) {
				employeeVO.setEmp_encpn(emp_encpn.substring(0,4)+"-"+emp_encpn.substring(4, 6) + "-" + emp_encpn.substring(6, 8));
			
			}else {
				employeeVO.setEmp_encpn(emp_encpn.substring(0,4)+"-"+emp_encpn.substring(5, 7) + "-" + emp_encpn.substring(8, 10));
			}
			
			if(emp_cellno != null && emp_cellno.length() == 10) {
				employeeVO.setEmp_celno(emp_cellno.substring(0,3)+"-"+emp_cellno.substring(3,6)+"-"+emp_cellno.substring(6));
			
			}else if(emp_cellno != null && emp_cellno.length() == 11) {
				employeeVO.setEmp_celno(emp_cellno.substring(0,3)+"-"+emp_cellno.substring(3,7)+"-"+emp_cellno.substring(7));
			}
			
		}
		
		pagingVO.setDataList(empList);
		
		
		//Base64 이미지 출력
		for(EmployeeVO employeeVO : pagingVO.getDataList()) {
			imageBase(employeeVO);
		}
		/** 결과 전송 */
		return pagingVO;
	}
	
	
	//상세조회
	@GetMapping("/detail")
	public String employeeDetail(
			@RequestParam("what") String empId,
			Model model
			) {
		
		EmployeeVO employeeOne = service.selectEmpOne(empId);
		imageBase(employeeOne);
		
			String emp_cellno = employeeOne.getEmp_celno();
			String telno = employeeOne.getEmp_telno();
			String encpn = employeeOne.getEmp_encpn();
		
			if(emp_cellno != null && emp_cellno.length() == 10) {
				employeeOne.setEmp_celno(emp_cellno.substring(0,3)+"-"+emp_cellno.substring(3,6)+"-"+emp_cellno.substring(6));
			
			}else if(emp_cellno != null && emp_cellno.length() == 11) {
				employeeOne.setEmp_celno(emp_cellno.substring(0,3)+"-"+emp_cellno.substring(3,7)+"-"+emp_cellno.substring(7));
			}

			if(telno != null && telno.length() == 10) {
				employeeOne.setEmp_telno(telno.substring(0,3)+"-"+telno.substring(3,6)+"-"+telno.substring(6));
				
			}else if(telno != null && telno.length() == 11) {
				employeeOne.setEmp_telno(telno.substring(0,3)+"-"+telno.substring(3,7)+"-"+telno.substring(7));
			}
			
			if(encpn.length() == 8) {
				employeeOne.setEmp_encpn(encpn.substring(0,4)+"-"+encpn.substring(4, 6) + "-" + encpn.substring(6, 8));
			
			}else {
				employeeOne.setEmp_encpn(encpn.substring(0,4)+"-"+encpn.substring(5, 7) + "-" + encpn.substring(8, 10));
			}
		
		model.addAttribute("employeeOne", employeeOne);
		
		return "/head/employee/employeeDetail";
		
	}
	
	@GetMapping("/form")
	public String employeeForm(
				Model model,
				HttpSession session
			) {
		/** 파라미터 조회 */
		String headCode = (String) session.getAttribute("code");
		
		List<ComCodeVO> comcodeECL = service.comcodeECL();
		List<ComCodeVO> comcodeESE = service.comcodeESE();
		List<DeptVO> deptList = service.selectDept(headCode);
		
		model.addAttribute("comcodeECL", comcodeECL);
		model.addAttribute("comcodeESE", comcodeESE);
		model.addAttribute("deptList", deptList);
		
		
		
		
		
		
		return "/head/employee/employeeForm";
	}
	
	//직원등록
	@PostMapping
	public String insert(
			HttpSession session,
			@ModelAttribute("employee") EmployeeVO employee
			) {
		
		
		/** 파라미터 조회 */
		String headCode = (String) session.getAttribute("code");
		String re_employee = employee.getEmp_encpn().replace("-", "/");
		logger.info("===========re_employee : {} ===============", re_employee);
		logger.info("===========re_employee : {} ===============", re_employee);
		employee.setEmp_encpn(re_employee);

		List<EmployeeVO> empUseList = service.selectEmpUseAt(headCode);
		employee.setHead_code(headCode);
		ServiceResult result = null;
		String view = null;
		
		
		if(empUseList != null) {
			result = service.insertEmpOk(employee);
			
		}else {
			result = service.insertEmpNo(employee);
		}
		
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/head/employee";
			
		}
		
		
		return view;
		
	}
	
	private void imageBase(EmployeeVO employeeVO) {
		
		InputStream imageStream;
		if(employeeVO.getAttachfileList().size() > 0 || !employeeVO.getAttachfileList().isEmpty()) {
			
			for(AttachfileVO attach : employeeVO.getAttachfileList()) {
				try {
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
	
	
	
	
	
	//직원수정
	@GetMapping("/modify")
	public String updateForm(
			@RequestParam("what") String empId,
			Model model,
			HttpSession session
			) {
		String headCode = (String) session.getAttribute("code");
		EmployeeVO employeeOne = service.selectEmpOne(empId);
		imageBase(employeeOne);
		
		
		String encpn = employeeOne.getEmp_encpn();
		if(encpn.length() == 8) {
			employeeOne.setEmp_encpn(encpn.substring(0,4)+"-"+encpn.substring(4, 6) + "-" + encpn.substring(6, 8));
		
		}else {
			employeeOne.setEmp_encpn(encpn.substring(0,4)+"-"+encpn.substring(5, 7) + "-" + encpn.substring(8, 10));
		}
		
		
		
		List<ComCodeVO> comcodeECL = service.comcodeECL();
		List<ComCodeVO> comcodeESE = service.comcodeESE();
		List<DeptVO> deptList = service.selectDept(headCode);
		
		model.addAttribute("comcodeECL", comcodeECL);
		model.addAttribute("comcodeESE", comcodeESE);
		model.addAttribute("deptList", deptList);
		model.addAttribute("employeeOne", employeeOne);
		
		
		
		return "/head/employee/employeeModiForm";
		
	}
	
	//직원수정
	@PostMapping(value = "/modify")
	public String update(
			@ModelAttribute("employee") EmployeeVO employee,
			HttpSession session
			) {

		ServiceResult result = null;
		String view = null;
		String headCode = (String) session.getAttribute("code");
		String empId = (String) session.getAttribute("authId");
		logger.info("================EMPLOYEEVO 값 {}===================", employee);
		logger.info("================EMPLOYEEVO 값 {}===================", employee);
		String before_att_fileno = employee.getAtt_fileno();
		employee.setBefore_att_fileno(before_att_fileno);
		employee.setHead_code(headCode);
		
		result = service.updateEmployee(employee);
		if(ServiceResult.OK.equals(result)) {
			
			if(employee.getEmp_id().equals(empId)) {
				session.removeAttribute("empImgVO");
				EmployeeVO empImgVO = headDAO.selectEmpOne(empId); //직원이미지
				imageBase(empImgVO);
				
				session.setAttribute("empImgVO", empImgVO);
			}
			
			view = "redirect:/head/employee";
		}
		
		return view;
		
	}
	
	@DeleteMapping(value="/delete")
	public String delete(
			@RequestParam("empId") String empId
			) {
		
		String view = null;
		ServiceResult result = service.retdeEmp(empId);
		
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/head/employee";
		}
		
		return view;
		
	}
	
	

}
