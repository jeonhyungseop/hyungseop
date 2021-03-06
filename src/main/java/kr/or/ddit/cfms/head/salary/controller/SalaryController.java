package kr.or.ddit.cfms.head.salary.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.View;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.employee.service.IHeadEmployeeService;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.mysalary.vo.SalaryVO;
import kr.or.ddit.cfms.head.salary.service.IHeadSalaryService;
import kr.or.ddit.cfms.view.ExcelDownloadViewWithJxls;

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
@RequestMapping("/head/salary")
public class SalaryController {
	
	@Inject
	private IHeadSalaryService service;
	
	@Inject
	private IHeadEmployeeService empservice;
	
	@Inject
	private WebApplicationContext container;
	
	
	@GetMapping
	public String salaryList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="deptSeq", required = false) String deptSeq
			,@RequestParam(value="currentDate", required = false) String currentDate
			,@RequestParam(value="searchWord", required = false) String searchWord
			,HttpSession session
			,Model model
			) {
		String headCode = (String) session.getAttribute("code");
		PagingVO<SalaryVO> pagingVO = listForAjax(currentPage, selectorRow, deptSeq, currentDate, searchWord, session);
		model.addAttribute("pagingVO", pagingVO);
		
		List<DeptVO> deptList = empservice.selectDept(headCode);
		model.addAttribute("deptList", deptList);
		
		return "/head/salary/salaryList";
		
	}
	
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<SalaryVO> listForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="deptSeq", required = false) String deptSeq
			,@RequestParam(value="currentDate", required = false) String currentDate
			,@RequestParam(value="searchWord", required = false) String searchWord
			,HttpSession session
			){
		
		String headCode = (String) session.getAttribute("code");
		PagingVO<SalaryVO> pagingVO = new PagingVO<SalaryVO>(selectorRow, 10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setHead_code(headCode);
		
		String re_currentDate = null;
		if(currentDate != null) {
			re_currentDate = currentDate.replace("-", "");
		}

		pagingVO.addSearchMap("deptSeq", deptSeq);
		pagingVO.addSearchMap("searchWord", searchWord);
		pagingVO.addSearchMap("re_currentDate", re_currentDate);
		
		
		int totalRecord = service.selectSalaryCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<SalaryVO> SalaryList = service.selectSalaryList(pagingVO);
		
		
		for(SalaryVO salaryVO : SalaryList) {
			String salaryde = salaryVO.getSalary_de();
			if(salaryde != null) {
				if(salaryde.length() == 8) {
					salaryVO.setSalary_de(salaryde.substring(0,4)+"-"+salaryde.substring(4, 6) + "-" + salaryde.substring(6, 8));
				
				}else {
					salaryVO.setSalary_de(salaryde.substring(0,4)+"-"+salaryde.substring(5, 7) + "-" + salaryde.substring(8, 10));
				}
			}else {
				salaryVO.setSalary_de("-");
				
			}
		}
		
		pagingVO.setDataList(SalaryList);
		
		for(SalaryVO salaryVO : pagingVO.getDataList()) {
			imageBase(salaryVO);
		}
		
		
		return pagingVO;
	}
	
	
	@GetMapping("/detail")
	public String salaryDetail() {
		return "/head/salary/salaryDetail";
		
	}
	
	@GetMapping("/form")
	public String salaryForm() {
		return "/head/salary/salaryForm";
		
	}
	
	@PostMapping
	public String insert() {
		return null;
		
	}
	
	@GetMapping("/modify")
	public String updateForm() {
		return "/head/salary/salaryForm";
		
	}
	
	@PutMapping
	public String update() {
		return null;
		
	}
	
	@DeleteMapping
	public String delete() {
		return null;
		
	}
	
	
	@GetMapping("/excelDownload")
	public View excelDownload(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="deptSeq", required = false) String deptSeq
			,@RequestParam(value="currentDate", required = false) String currentDate
			,@RequestParam(value="searchWord", required = false) String searchWord
			,HttpSession session
			,Model model
	) {
		
		PagingVO<SalaryVO> pagingVO  = listForAjax(currentPage, selectorRow, deptSeq, currentDate, searchWord, session);
		model.addAttribute("pagingVO", pagingVO);
		
		return new ExcelDownloadViewWithJxls() {
			
			@Override
			public Resource getJxlsTemplate() throws IOException {
				return container.getResource("/WEB-INF/jxlstmpl/SalaryListDown.xls");
			}
			
			@Override
			public String getDownloadFileName() {
				return "직원 급여명세리스트.xlsx";
			}
		};
	}
	
	private void imageBase(SalaryVO salaryVO) {
		
		InputStream imageStream;
		if(salaryVO.getAttachfileList().size() > 0 || !salaryVO.getAttachfileList().isEmpty()) {
			
			for(AttachfileVO attach : salaryVO.getAttachfileList()) {
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
}
