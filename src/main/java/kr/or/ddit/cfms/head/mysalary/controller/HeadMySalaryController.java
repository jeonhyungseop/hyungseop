package kr.or.ddit.cfms.head.mysalary.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.View;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.mysalary.service.IHeadMySalaryService;
import kr.or.ddit.cfms.head.mysalary.vo.SalaryVO;
import kr.or.ddit.cfms.view.ExcelDownloadViewWithJxls;

/**
 * @author 진예은
 * @since 2021. 6. 23
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 23      진예은        나의 급여 목록조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/mysalary")
public class HeadMySalaryController {

	@Inject
	private IHeadMySalaryService service;
	
	@Inject
	private WebApplicationContext container;
	
	
	@GetMapping
	public String MySalaryList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="startDate", required = false) String startDate,
			@RequestParam(value="endDate", required = false) String endDate
			,HttpSession session
			,Model model
			) {
		
		PagingVO<SalaryVO> pagingVO = listForAjax(currentPage, selectorRow, startDate, endDate, session, model);
		model.addAttribute("pagingVO", pagingVO);	
		
		
		return "/head/mysalary/mysalaryList";
	}
	
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<SalaryVO> listForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
			,@RequestParam(value="startDate", required = false) String startDate
			,@RequestParam(value="endDate", required = false) String endDate
			,HttpSession session
			,Model model
			){
		
		String emp_id = (String) session.getAttribute("authId");
		
		PagingVO<SalaryVO> pagingVO = new PagingVO<>(selectorRow, 10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setEmp_id(emp_id);
		
		pagingVO.addSearchMap("startDate", startDate);
		pagingVO.addSearchMap("endDate", endDate);
		
		int totalRecord = service.selectMySalaryCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<SalaryVO> mySalaryList = service.selectMySalaryList(pagingVO);
		
		for(SalaryVO salaryVO : mySalaryList) {
			String salaryde = salaryVO.getSalary_de();
			
			if(salaryde.length() == 8) {
				salaryVO.setSalary_de(salaryde.substring(0,4)+"-"+salaryde.substring(4, 6) + "-" + salaryde.substring(6, 8));
			
			}else {
				salaryVO.setSalary_de(salaryde.substring(0,4)+"-"+salaryde.substring(5, 7) + "-" + salaryde.substring(8, 10));
			}
		}
		
		pagingVO.setDataList(mySalaryList);
		
		return pagingVO;
	}
	
	@GetMapping("/excelDownload")
	public View excelDownload(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
			,@RequestParam(value="startDate", required = false) String startDate
			,@RequestParam(value="endDate", required = false) String endDate
			,HttpSession session
			,Model model
	) {
		
		PagingVO<SalaryVO> pagingVO  = listForAjax(currentPage, selectorRow, startDate, endDate, session, model);
		model.addAttribute("pagingVO", pagingVO);
		
		return new ExcelDownloadViewWithJxls() {
			
			@Override
			public Resource getJxlsTemplate() throws IOException {
				return container.getResource("/WEB-INF/jxlstmpl/SalaryList.xls");
			}
			
			@Override
			public String getDownloadFileName() {
				return "급여명세서리스트.xlsx";
			}
		};
	}
	
	
}
