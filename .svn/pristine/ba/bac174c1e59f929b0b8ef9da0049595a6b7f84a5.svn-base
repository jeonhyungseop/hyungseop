package kr.or.ddit.cfms.fran.education.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.fran.education.service.IFranEducationService;
import kr.or.ddit.cfms.fran.education.vo.FranEducationVO;

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
@RequestMapping("/fran/education")
public class EducationController {
	@Inject
	private IFranEducationService service;
	
	@GetMapping
	public String franEducationMain(
	) {
		return "/fran/education/educationList";
	}
	
	@GetMapping(value = "/check", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<FranEducationVO> educationList(
		HttpSession session
	){
		String code = (String) session.getAttribute("code");
		String authId = (String) session.getAttribute("authId");
		if(code == null || authId == null) {
			return null;
		}
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("code", authId);
		pMap.put("head_code", code.subSequence(0, 5));
		List<FranEducationVO> educationList = service.retrieveEducationList(pMap);
		return educationList;
	}
	
	@GetMapping(value = "/detail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public FranEducationVO educationDetail(
		@RequestParam("id") String edc_code,
		HttpSession session
	) {
		String code = (String) session.getAttribute("code");
		String authId = (String) session.getAttribute("authId");
		if(code == null || authId == null) {
			return null;
		}
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("code", authId);
		pMap.put("head_code", code.subSequence(0, 5));
		pMap.put("edc_code", edc_code);
		FranEducationVO education = service.retrieveEducationDetail(pMap);
		return education;
	}
	
}
