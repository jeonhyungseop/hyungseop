package kr.or.ddit.cfms.head.vacation.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.vacation.service.IHeadVacationService;
import kr.or.ddit.cfms.head.vacationList.service.IHeadVacationListService;
import kr.or.ddit.cfms.head.vacationList.vo.VacationVO;

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
@RequestMapping("/head/vacation")
public class VacationController {

	@Inject
	private IHeadVacationListService listservice;
	
	@Inject
	private IHeadVacationService service;
	
	@GetMapping
	public String vacationList(
			Model model
			) {
		
		List<ComCodeVO> vacationComcode = listservice.selectComCodeVSC();
		model.addAttribute("vacationComcode", vacationComcode);
		
		return "/head/vacation/vacationList";
		
	}
	
	
	@GetMapping(value = "/calendar", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<VacationVO> vacationDetail(
			HttpSession session
			) {
		
		String emp_id = (String) session.getAttribute("authId");
		List<VacationVO> calendarList = service.selectCalendarList(emp_id);
		
		
		return calendarList;
	}
	
	@GetMapping("/form")
	public String vacationForm() {
		return "/head/vacation/vacationForm";
		
	}
	
	@PostMapping
	public String insert() {
		return null;
		
	}
	
	@PutMapping
	public String update() {
		return null;
		
	}
	
	@DeleteMapping
	public String delete() {
		return null;
		
	}
}
