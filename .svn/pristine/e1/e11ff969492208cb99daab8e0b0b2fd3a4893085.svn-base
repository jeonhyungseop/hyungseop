package kr.or.ddit.cfms.head.commute.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commute.service.IHeadCommuteService;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.employee.controller.EmployeeController;
import kr.or.ddit.cfms.head.employee.dao.IHeadEmployeeDAO;

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
 * 2021. 6. 10      진예은          직원 출근체크
 * 2021, 6. 15      진예은          직원 퇴근체크
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/commute")
public class CommuteController{
	
	@Inject
	private IHeadCommuteService service;
	
	@Inject
	private IHeadEmployeeDAO headDAO;
	
	private final static Logger logger = LoggerFactory.getLogger(CommuteController.class);
	
	
	@RequestMapping(value = "/atten", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult atten(
			@RequestParam("clock") String clock,
			HttpSession session
			) {
		
		String emp_id = (String) session.getAttribute("authId");
		DclzVO dclzVO = new DclzVO();
		dclzVO.setEmp_id(emp_id);
		
		logger.info("========emp_id {} ======", emp_id);
		logger.info("========clock {} ======", clock);
		logger.info("========clock {} ======", clock);
		logger.info("========clock {} ======", clock.substring(0,2));
		
		String dclzCode = null;
		//출근시간 체크
		if(Integer.parseInt(clock.substring(0,2)) < 9){
			//정상출근
			dclzCode = "DC001";
		}else {
			//지각
			dclzCode = "DC004";
		}
		dclzVO.setDclz_se_code(dclzCode);
		
		//기준일자 구하기
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy/MM/dd");
		Date time = new Date();
		String time1 = format1.format(time);
		dclzVO.setDclz_stdrde(time1);
		
		ServiceResult result = service.insertGoToWork(dclzVO);
		if(ServiceResult.OK.equals(result)) {
			DclzVO dclzVOSession = headDAO.selectAttendCheck(emp_id);
			session.setAttribute("WorkOK", "ok");
			session.setAttribute("dclzVO", dclzVOSession);
		}
		
		return result;
		
	}
	
	@RequestMapping(value = "/leave", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult leave(
			HttpSession session
			) {
		
		String empId = (String) session.getAttribute("authId");
		logger.info("=============session.getAttribute('id') : {}======", session.getAttribute("authId"));
		
		DclzVO dclzVO = headDAO.selectAttendCheck(empId);
		logger.info("=============dclzVO : {}======", dclzVO);
		//int seq = dclzVO.getDclz_seq();
		
		ServiceResult result = service.updateGoHome(dclzVO);
		if(ServiceResult.OK.equals(result)) {
			DclzVO dclzVOSession = headDAO.selectAttendCheck(empId);
			session.setAttribute("livOK", "ok");
			session.setAttribute("dclzVO", dclzVOSession);
		}
		
		
		return result;
		
	}
}
