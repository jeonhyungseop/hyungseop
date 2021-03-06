package kr.or.ddit.cfms.head.myattendance.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.myattendance.service.IHeadMyAttendanceService;
/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11      진예은        나의 근태내역조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/head/myattendance")
public class MyAttendanceController {
	
	@Inject
	private IHeadMyAttendanceService service;
	

	@GetMapping
	public String myattendaceList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="startDate", required = false) String startDate,
			@RequestParam(value="endDate", required = false) String endDate,
			@RequestParam(value="dclzCode_01", required = false) String dclzCode_01,
			@RequestParam(value="dclzCode_02", required = false) String dclzCode_02,
			@RequestParam(value="dclzCode_04", required = false) String dclzCode_04,
			HttpSession session
			,Model model
			) {
		
		PagingVO<DclzVO> pagingVO = MylistForAjax(currentPage, selectorRow, startDate, endDate, dclzCode_01, dclzCode_02, dclzCode_04, session);
		model.addAttribute("pagingVO", pagingVO);
		
		return "/head/myattendance/myAttendanceList";
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<DclzVO> MylistForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="startDate", required = false) String startDate,
			@RequestParam(value="endDate", required = false) String endDate,
			@RequestParam(value="dclzCode_01", required = false) String dclzCode_01,
			@RequestParam(value="dclzCode_02", required = false) String dclzCode_02,
			@RequestParam(value="dclzCode_04", required = false) String dclzCode_04,
			HttpSession session
			){
		
		String emp_id = (String) session.getAttribute("authId");
		PagingVO<DclzVO> pagingVO = new PagingVO<DclzVO>(selectorRow, 10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setEmp_id(emp_id);
		
		pagingVO.addSearchMap("startDate", startDate);
		pagingVO.addSearchMap("endDate", endDate);
		pagingVO.addSearchMap("dclzCode_01", dclzCode_01);
		pagingVO.addSearchMap("dclzCode_02", dclzCode_02);
		pagingVO.addSearchMap("dclzCode_04", dclzCode_04);
		
		int totalRecord = service.selectMyAttendanceCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<DclzVO> myAttendanceList = service.selectMyAttendanceList(pagingVO);
		
		for(DclzVO dclzVO : myAttendanceList) {
			String dclz_stdrde = dclzVO.getDclz_stdrde();
			
			if(dclz_stdrde.length() == 8) {
				dclzVO.setDclz_stdrde(dclz_stdrde.substring(0,4)+"-"+dclz_stdrde.substring(4, 6) + "-" + dclz_stdrde.substring(6, 8));
			
			}else {
				dclzVO.setDclz_stdrde(dclz_stdrde.substring(0,4)+"-"+dclz_stdrde.substring(5, 7) + "-" + dclz_stdrde.substring(8, 10));
			}
			
		}
		
		pagingVO.setDataList(myAttendanceList);
		
		
		return pagingVO;
	}
	
	
	//직원근태수정 신청
	@RequestMapping(method = RequestMethod.POST , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult insert(
			@RequestParam("dclz_seq") String dclz_seq,
			@RequestParam("attend_time") String attend_time,
			@RequestParam("lvffc_time") String lvffc_time,
			@RequestParam("dclz_change_prvonsh") String dclz_change_prvonsh
			) {
		
		
		String reson = "출근시간:" + attend_time
				     + "/퇴근시간:" + lvffc_time
				     + "/사유:" + dclz_change_prvonsh;
		
		DclzVO dclzVO = new DclzVO();
		dclzVO.setDclz_seq(Integer.parseInt(dclz_seq));
		dclzVO.setDclz_change_prvonsh(reson);
		
		ServiceResult result = service.updateWorkList(dclzVO);
		
		return result;
	}
	
	
}
