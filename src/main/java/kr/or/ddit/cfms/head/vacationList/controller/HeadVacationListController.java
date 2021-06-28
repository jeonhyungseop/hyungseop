package kr.or.ddit.cfms.head.vacationList.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.employee.service.IHeadEmployeeService;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.vacationList.service.IHeadVacationListService;
import kr.or.ddit.cfms.head.vacationList.vo.VacationVO;

/**
 * @author 진예은
 * @since 2021. 6. 15
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 15      진예은       휴가조회
 * 2021. 6. 17      진예은       휴가 등록(직원) 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/restList")
public class HeadVacationListController {

	@Inject
	private IHeadVacationListService service;
	
	private final static Logger logger = LoggerFactory.getLogger(HeadVacationListController.class);
	
	@GetMapping
	public String systemprodList(
			Model model,
			HttpSession session,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			) {
		
		String emp_id = (String) session.getAttribute("authId");
		EmployeeVO employeeVO =  service.selectEmpBaseVacation(emp_id);
		model.addAttribute("employeeVO", employeeVO);
		
		//휴가공통코드
		List<ComCodeVO> vacationComcode = service.selectComCodeVSC();
		model.addAttribute("vacationComcode", vacationComcode);
		
		PagingVO<VacationVO> pagingVO = listForAjax(session, currentPage);
		model.addAttribute("pagingVO", pagingVO);
		
		return "/head/vacationlist/vacationList";
	}
	
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<VacationVO> listForAjax(
			HttpSession session
			,@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			){
		
		String emp_id = (String) session.getAttribute("authId");
		PagingVO<VacationVO> pagingVO = new PagingVO<>(8,10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setEmp_id(emp_id);
		
		int totalRecord = service.selectVacationCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<VacationVO> vacationList = service.selectVacationList(pagingVO);
		for(VacationVO vacationVO : vacationList) {
			String vcatnStartde = vacationVO.getVcatn_startde();
			String vcatnEndde = vacationVO.getVcatn_endde();
			
			if(vcatnStartde.length() == 8) {
				vacationVO.setVcatn_startde(vcatnStartde.substring(0,4)+"-"+vcatnStartde.substring(4, 6) + "-" + vcatnStartde.substring(6, 8));
			
			}else {
				vacationVO.setVcatn_startde(vcatnStartde.substring(0,4)+"-"+vcatnStartde.substring(5, 7) + "-" + vcatnStartde.substring(8, 10));
			}
			
			if(vcatnEndde.length() == 8) {
				vacationVO.setVcatn_endde(vcatnEndde.substring(0,4)+"-"+vcatnEndde.substring(4, 6) + "-" + vcatnEndde.substring(6, 8));
			
			}else {
				vacationVO.setVcatn_endde(vcatnEndde.substring(0,4)+"-"+vcatnEndde.substring(5, 7) + "-" + vcatnEndde.substring(8, 10));
			}
		}
		pagingVO.setDataList(vacationList);
		
		return pagingVO;
	}
	
	
	//휴가등록
	@PostMapping
	public String insert(
			HttpSession session,
			@ModelAttribute("vacation") VacationVO vacationVO
			) {
		
		String emp_id = (String) session.getAttribute("authId");
		vacationVO.setEmp_id(emp_id);
		
		String re_startde = vacationVO.getVcatn_startde().replace("-", "");
		String re_endde = vacationVO.getVcatn_endde().replace("-", "");
		vacationVO.setVcatn_startde(re_startde);
		vacationVO.setVcatn_endde(re_endde);
		
		if(vacationVO.getVcatn_usede() == null) {
			Double usedate = Double.parseDouble(re_endde) - Double.parseDouble(re_startde);
			vacationVO.setVcatn_usede(usedate);
		}
		
		String view = null;
		ServiceResult result = null;
		result = service.insertVacation(vacationVO);
		
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/head/restList";
		}
		
		return view;
	}
	
	
}
