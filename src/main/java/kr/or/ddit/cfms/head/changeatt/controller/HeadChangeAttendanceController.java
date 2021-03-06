package kr.or.ddit.cfms.head.changeatt.controller;

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

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.attendance.dao.IHeadAttendanceDAO;
import kr.or.ddit.cfms.head.changeatt.service.IHeadChangeAttService;
import kr.or.ddit.cfms.head.changeatt.vo.ChangeAttendanceListVO;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.employee.service.IHeadEmployeeService;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;

/**
 * @author 진예은
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11      진예은       수정요청관리
 * 2021. 6. 12      진예은       수정요청관리 날짜형식 변경
 * 2021. 6. 14      진예은       수정요청관리 오류 수정
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/changeatt")
public class HeadChangeAttendanceController {

	private final static Logger logger = LoggerFactory.getLogger(HeadChangeAttendanceController.class);
	
	@Inject
	private IHeadChangeAttService service;
	
	@Inject
	private IHeadEmployeeService empService;
	
	@Inject
	private IHeadAttendanceDAO attDAO;
	
	@GetMapping
	public String changeList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="deptSeq", required = false) String deptSeq,
			@RequestParam(value="startDate", required = false) String startDate,
			@RequestParam(value="endDate", required = false) String endDate,
			@RequestParam(value="searchWord", required = false) String searchWord,
			Model model
			,HttpSession session
			) {
		String headCode = (String) session.getAttribute("code");
		List<DeptVO> deptList = empService.selectDept(headCode);
		model.addAttribute("deptList", deptList);
		
		PagingVO<DclzVO> pagingVO = listForAjax(currentPage, selectorRow, deptSeq, startDate, endDate, searchWord, session);
		model.addAttribute("pagingVO", pagingVO);
		
		return "/head/changeattendance/changeAttList";
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<DclzVO> listForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="deptSeq", required = false) String deptSeq,
			@RequestParam(value="startDate", required = false) String startDate,
			@RequestParam(value="endDate", required = false) String endDate,
			@RequestParam(value="searchWord", required = false) String searchWord,
			HttpSession session
			){
		String headCode = (String) session.getAttribute("code");
		PagingVO<DclzVO> pagingVO = new PagingVO<>(selectorRow, 10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setHead_code(headCode);
		
		pagingVO.addSearchMap("deptSeq", deptSeq);
		pagingVO.addSearchMap("startDate", startDate);
		pagingVO.addSearchMap("endDate", endDate);
		pagingVO.addSearchMap("searchWord", searchWord);
		
		
		int totalRecord = service.selectChangeAttCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<DclzVO> changeDclzList = service.selectChangeAtt(pagingVO);
		
		for(DclzVO dclzVO : changeDclzList) {
			String dclz_strde = dclzVO.getDclz_stdrde();
			
			if(dclz_strde.length() == 8) {
				dclzVO.setDclz_stdrde(dclz_strde.substring(0,4)+"-"+dclz_strde.substring(4, 6) + "-" + dclz_strde.substring(6, 8));
			
			}else {
				dclzVO.setDclz_stdrde(dclz_strde.substring(0,4)+"-"+dclz_strde.substring(5, 7) + "-" + dclz_strde.substring(8, 10));
			}
			
		}
		
		
		
		pagingVO.setDataList(changeDclzList);
		for(DclzVO dclzVO : pagingVO.getDataList()) {
			imageBase(dclzVO);
		}
		
		
		return pagingVO;
	}
	
	//수정요청 승인
	@RequestMapping(method = RequestMethod.POST , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult ChangeOkUpdate(
			@RequestParam("seq") String seq,
			@RequestParam("attChange") String attChange,
			@RequestParam("lvfChange") String lvfChange,
			@RequestParam("stdrde") String stdrde,
			@RequestParam("empID") String empID
			) {
		
		DclzVO dclzVO = new DclzVO();
		dclzVO.setDclz_seq(Integer.parseInt(seq));
		dclzVO.setEmp_id(empID);

		String stdrde_re = stdrde.replace("-", "");
		String stdrde_change = stdrde_re.substring(0,4)+"/"+stdrde_re.substring(4, 6) + "/" + stdrde_re.substring(6, 8);
		
		String attDclz = attDAO.selectAttendanceTime(dclzVO);
		String lvffcDclz = attDAO.selectLvffcTime(dclzVO);
		
		if(attChange.equals("00:00")) {
			dclzVO.setAttend_time(attDclz);
		}else {
			String attend_time = stdrde_change + " " + attChange; 
			dclzVO.setAttend_time(attend_time);
			logger.info("=============================================");
			logger.info("==============stdrde_change : {}===============", stdrde_change);
			logger.info("==============attChange : {}===============", attChange);
			logger.info("==============attend_time : {}===============", attend_time);
			logger.info("=============================================");
		}
		
		if(lvfChange.equals("00:00")) {
			dclzVO.setLvffc_time(lvffcDclz);
		}else {
			String lvffc_time = stdrde_change + " " + lvfChange; 
			dclzVO.setLvffc_time(lvffc_time);
			logger.info("=============================================");
			logger.info("===============lvffc_time : {}===============", lvffc_time);
			logger.info("=============================================");
		}
		
		ServiceResult result = null;
		if(Integer.parseInt(attChange.substring(1,2)) < 9) {
			result = service.ChangeOKBeforeUpdate(dclzVO);
			
		}else if(attChange.substring(1,2).equals("9") && attChange.substring(3,5).equals("00")) {
			result = service.ChangeOKBeforeUpdate(dclzVO);
			
		}else {
			result = service.ChangeOKUpdate(dclzVO);
		}
		
		attDAO.updateAttLvfTime(dclzVO);
		
		
		return result;
	}
	
	
	@RequestMapping(value="/noUpdate", method = RequestMethod.POST , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult CheckNoUpdate(
			@RequestParam("seq") String seq
			) {
		
		logger.info("=============================================");
		logger.info("===============seq : {}===============", seq);
		logger.info("=============================================");
		ServiceResult result = service.ChangeRejectUpdate(Integer.parseInt(seq));
		
		
		return result;
	}
	
	@PostMapping("/allCheck")
	public String CheckAllUpdate(
			@ModelAttribute("changeAttendanceListVO") ChangeAttendanceListVO changeAttendanceListVO
			, HttpSession session
			) {
		logger.info("=============================================");
		logger.info("===============changeAttendanceListVO : {}===", changeAttendanceListVO);
		logger.info("=============================================");
		String view = null;
		ServiceResult result = null;
		for(DclzVO change : changeAttendanceListVO.getChangeAttendanceListVO()){
			change.getDclz_stdrde();
			String stdrde_re = change.getDclz_stdrde().replace("-", "");
			String stdrde_change = stdrde_re.substring(0,4)+"/"+stdrde_re.substring(4, 6) + "/" + stdrde_re.substring(6, 8);
			String AttendTime = stdrde_change + " " +change.getAttend_time();
			String LvffcTime = stdrde_change + " " + change.getLvffc_time();
			
			change.setDclz_stdrde(stdrde_change);
			change.setAttend_time(AttendTime);
			change.setLvffc_time(LvffcTime);
			
		}
		
		result = service.ChangeAllUpdate(changeAttendanceListVO);
		view = "redirect:/head/changeatt";
		
		return view;
	}
	
	
	private void imageBase(DclzVO dclzVO) {
		
		InputStream imageStream;
		if(dclzVO.getAttachfileList().size() > 0 || !dclzVO.getAttachfileList().isEmpty()) {
			
			for(AttachfileVO attach : dclzVO.getAttachfileList()) {
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
