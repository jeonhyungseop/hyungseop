package kr.or.ddit.cfms.head.education.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.education.service.IEducationService;
import kr.or.ddit.cfms.head.education.vo.EducationVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;

/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                        수정자               수정내용
 * ------------     --------    ----------------------
 * 2021. 6. 15    진유리           최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/education")
public class HeadEducationController {
	private static final Logger logger = LoggerFactory.getLogger(HeadEducationController.class);
	
	@Inject
	private IEducationService service;
	
	public void comCode(Model model) {
		ComCodeGrpVO EccCode = service.retrieveCodeList("ECC");
		model.addAttribute("EccCode", EccCode);
	}
	
	@GetMapping
	public String educationMain(
		Model model, HttpSession session
	) {
		String code = (String) session.getAttribute("code");
		if(code == null) {
			return null;
		}
		String id = (String) session.getAttribute("authId");
		int cnt = service.retrieveHead(id);
		if(cnt>0) {
			List<EmployeeVO> empList = service.retrieveEmpList(code);
			model.addAttribute("empList", empList);
		}else {
			EmployeeVO emp = service.retrieveEmployee(id);
			model.addAttribute("emp", emp);
		}
//		List<FranchiseVO> franList = service.retrieveFran(code);
//		model.addAttribute("franList", franList);
		comCode(model);
		return "/head/education/educationList";
	}
	
	@GetMapping(value = "/check", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<EducationVO> educationList(
		HttpSession session
	){
		String code = (String) session.getAttribute("code");
		if(code == null) {
			return null;
		}
		List<EducationVO> educationList = service.retrieveEducationList(code);
		return educationList;
	}
	
	@GetMapping(value = "/detail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public EducationVO educationDetail(
		@RequestParam("id") String edc_code,
		HttpSession session
	) {
		String code = (String) session.getAttribute("code");
		if(code == null) {
			return null;
		}
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("code", code);
		pMap.put("edc_code", edc_code);
		EducationVO education = service.retrieveEducation(pMap);
		return education;
	}
	
	@PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> insert(
		@ModelAttribute EducationVO education
	) {
		Map<String, Object> resultMap = new HashMap<>();
		int cnt = service.insertEducation(education);
		if(cnt > 0) {
			resultMap.put("result", "OK");
			resultMap.put("edu", education);
		}else {
			resultMap.put("result", "FAIL");
		}
		return resultMap;
	}
	
	@PostMapping(value = "/modify", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> updateDay(
		@ModelAttribute EducationVO education	
	) {
		Map<String, Object> resultMap = new HashMap<>();
		int cnt = service.updateEducationDay(education);
		if(cnt>0) {
			resultMap.put("result", "OK");
		}else {
			resultMap.put("result", "FAIL");
		}
		return resultMap;
	}
	
	@PutMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> update(
		@ModelAttribute EducationVO education	
	) {
		Map<String, Object> resultMap = new HashMap<>();
		int cnt = service.updateEducation(education);
		if(cnt > 0) {
			resultMap.put("result", "OK");
		}else {
			resultMap.put("result", "FAIL");
		}
		return resultMap;
	}
	
	@DeleteMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> delete(
		@RequestParam String code
		, HttpSession session
	) {
		Map<String, Object> resultMap = new HashMap<>();
		String headCode = (String) session.getAttribute("code");
		if(headCode == null) {
			return null;
		}
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("code", headCode);
		pMap.put("edc_code", code);
		
		int cnt = service.deleteEducation(pMap);
		if(cnt > 0) {
			resultMap.put("result", "OK");
		}else {
			resultMap.put("result", "FAIL");
		}
		return resultMap;
	}
	
	@GetMapping("/deleteList")
	public String deleteList(
		Model model, HttpSession session
	) {
		String id = (String) session.getAttribute("authId");
		int cnt = service.retrieveHead(id);
		if(cnt>0) {
			model.addAttribute("cnt", "over");
		}else {
			model.addAttribute("cnt", "zero");
		}
		return "/head/education/educationDeleteList";
	}
	
	@GetMapping(value = "/delcheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<EducationVO> educationDeleteList(
		HttpSession session
	){
		String code = (String) session.getAttribute("code");
		if(code == null) {
			return null;
		}
		List<EducationVO> educationList = service.retrieveDeleteEduList(code);
		return educationList;
	}
	
	@GetMapping(value = "/deldetail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public EducationVO delEducationDetail(
		@RequestParam("id") String edc_code,
		HttpSession session
	) {
		String code = (String) session.getAttribute("code");
		if(code == null) {
			return null;
		}
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("code", code);
		pMap.put("edc_code", edc_code);
		EducationVO education = service.retrieveDelEducation(pMap);
		return education;
	}
	
	@GetMapping(value = "/restore", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> restore(
			@RequestParam String code
			, HttpSession session
	) {
		Map<String, Object> resultMap = new HashMap<>();
		String headCode = (String) session.getAttribute("code");
		if(headCode == null) {
			return null;
		}
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("code", headCode);
		pMap.put("edc_code", code);
		
		int cnt = service.restoreEducation(pMap);
		if(cnt > 0) {
			resultMap.put("result", "OK");
		}else {
			resultMap.put("result", "FAIL");
		}
		return resultMap;
	}
}
