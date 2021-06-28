package kr.or.ddit.cfms.head.reqvacation.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.employee.service.IHeadEmployeeService;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.reqvacation.service.IHeadReqVacationService;
import kr.or.ddit.cfms.head.reqvacation.vo.ReqVacationListVO;
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
 * 2021. 6. 17      진예은        휴가승인요청
 * 2021. 6. 18      진예은        인사팀 휴가내역조회
 * 2021. 6. 21      진예은        휴가 일괄 승인
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/reqvacation")
public class HeadReqVacationController {
	
	@Inject
	private IHeadReqVacationService service;
	
	@Inject
	private IHeadEmployeeService empService;
	
	@Inject
	private IHeadVacationListService vacservice;
	
	private final static Logger logger = LoggerFactory.getLogger(HeadReqVacationController.class);
	
	
	@GetMapping
	public String list(
			Model model,
			HttpSession session,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			,@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
			,@RequestParam(value="searchWord", required = false) String searchWord
			,@RequestParam(value="deptSeq", required = false) String deptSeq
			,@RequestParam(value="clspCode", required = false) String clspCode
			,@RequestParam(value="vacationSelect", required = false) String vacationSelect
			) {
		
		String headCode = (String) session.getAttribute("code");
		
		//부서코드
		List<DeptVO> deptList = empService.selectDept(headCode);
		model.addAttribute("deptList", deptList);
		
		//직급코드
		List<ComCodeVO> comcodeECL = empService.comcodeECL();
		model.addAttribute("comcodeECL", comcodeECL);
		
		//휴가공통코드
		List<ComCodeVO> vacationComcode = vacservice.selectComCodeVSC();
		model.addAttribute("vacationComcode", vacationComcode);
		
		
		PagingVO<VacationVO> pagingVO = listForAjax(session, currentPage, selectorRow, searchWord, deptSeq, clspCode, vacationSelect);
		model.addAttribute("pagingVO", pagingVO);
		
		return "/head/reqvacation/reqvacationlist";
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<VacationVO> listForAjax(
			HttpSession session
			,@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			,@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
			,@RequestParam(value="searchWord", required = false) String searchWord
			,@RequestParam(value="deptSeq", required = false) String deptSeq
			,@RequestParam(value="clspCode", required = false) String clspCode
			,@RequestParam(value="vacationSelect", required = false) String vacationSelect
			){
		
		String headCode = (String) session.getAttribute("code");
		PagingVO<VacationVO> pagingVO = new PagingVO<>(selectorRow, 10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setHead_code(headCode);
		
		pagingVO.addSearchMap("searchWord", searchWord);
		pagingVO.addSearchMap("deptSeq", deptSeq);
		pagingVO.addSearchMap("clspCode", clspCode);
		pagingVO.addSearchMap("vacationSelect", vacationSelect);
		
		int totalRecord = service.reqVacationCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<VacationVO> reqVacationList = service.reqVacationList(pagingVO);
		for(VacationVO vacationVO : reqVacationList) {
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
		pagingVO.setDataList(reqVacationList);
		
		for(VacationVO vacationVO : pagingVO.getDataList()) {
			
			imageBase(vacationVO);
		}
		
		return pagingVO;
	}
	
	//휴가 승인
	@RequestMapping(method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult reqOK(
			@RequestParam("seq") String seq
			,@RequestParam("hiddenUseDe") String hiddenUseDe
			,@RequestParam("hiddenEmpID") String hiddenEmpID
			,HttpSession session
			) {
		ServiceResult result = null;
		
		VacationVO vacationVO = new VacationVO();
		vacationVO.setVcreq_seq(Integer.parseInt(seq));
		vacationVO.setEmp_minus(Double.parseDouble(hiddenUseDe));
		vacationVO.setEmp_id(hiddenEmpID);
		
		result = service.okVacation(vacationVO);
		
		return result;
	}
	
	
	//휴가반려
	@RequestMapping(value = "/novacation", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult reqNO(
			@RequestParam("seq") String seq
			) {
		ServiceResult result = null;
		result = service.noVacation(Integer.parseInt(seq));
		
		
		
		return result;
	}
	
	//휴가캘린더
	@GetMapping("/reqCalendar")
	public String Calendar(
			HttpSession session
			,Model model
			) {
		
		String headCode = (String) session.getAttribute("code");
		List<VacationVO> calendarList = service.selectCurrentMonth(headCode);
		model.addAttribute("calendarList", calendarList);
		
		return "/head/reqvacation/reqcalendar";
	}
	
	
	@GetMapping(value = "/calendarAjax", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<VacationVO> CalendarAjax(
			HttpSession session
			) {
		
		String headCode = (String) session.getAttribute("code");
		List<VacationVO> calendarList = service.reqCalendar(headCode);
		
		return calendarList;
	}
	
	
	//선택일괄승인
	@PostMapping("/vacationAllCheck")
	public String VacationCheckAll(
			@ModelAttribute("reqVacationListVO") ReqVacationListVO reqVacationListVO,
			RedirectAttributes redirect
			) {
		
		String view = null;
		logger.info("=============================================");
		logger.info("===============reqVacationListVO : {}===", reqVacationListVO);
		logger.info("=============================================");
		
		ServiceResult result = service.vacationAllUpdate(reqVacationListVO);
		view = "redirect:/head/reqvacation";
		redirect.addFlashAttribute("reqvacationOK", "OK");
		
		return view;
	}
	
	
	@RequestMapping(value = "/changeMonth", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<VacationVO> ChangeMonth(
			@RequestParam("date") String date,
			HttpSession session
			) {
		
		String headCode = (String) session.getAttribute("code");
		
		VacationVO vacationVO = new VacationVO();
		vacationVO.setHead_code(headCode);
		vacationVO.setChangeMonth(date);
		
		logger.info("=============================================");
		logger.info("===============vacationVO : {}===", vacationVO);
		logger.info("=============================================");
		
		List<VacationVO> changeMonthList = service.selectChangeMonth(vacationVO);
		
		
		return changeMonthList;
	}
	
	
	private void imageBase(VacationVO vacationVO) {
		
		InputStream imageStream;
		if(vacationVO.getAttachfileList().size() > 0 || !vacationVO.getAttachfileList().isEmpty()) {
			
			for(AttachfileVO attach : vacationVO.getAttachfileList()) {
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
