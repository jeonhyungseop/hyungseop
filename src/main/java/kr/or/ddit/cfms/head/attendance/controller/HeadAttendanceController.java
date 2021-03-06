package kr.or.ddit.cfms.head.attendance.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.View;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.attendance.dao.IHeadAttendanceDAO;
import kr.or.ddit.cfms.head.attendance.service.IHeadAttendanceService;
import kr.or.ddit.cfms.head.changeatt.service.IHeadChangeAttService;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.employee.controller.EmployeeController;
import kr.or.ddit.cfms.head.employee.service.IHeadEmployeeService;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
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
 * 2021. 6. 10      진예은          근태목록 조회
 * 2021. 6. 11      진예은          엑셀다운로드
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/attendance")
public class HeadAttendanceController {

	@Inject
	private IHeadAttendanceService service;
	
	@Inject
	private IHeadEmployeeService empService;
	
	@Inject
	private WebApplicationContext container;
	
	@Inject
	private IHeadChangeAttService attservice;
	
	@Inject
	private IHeadAttendanceDAO attDAO;
	
	private final static Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	
	@GetMapping
	public String analysisList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="deptSeq", required = false) String deptSeq,
			@RequestParam(value="startDate", required = false) String startDate,
			@RequestParam(value="endDate", required = false) String endDate,
			@RequestParam(value="dclzCode_01", required = false) String dclzCode_01,
			@RequestParam(value="dclzCode_02", required = false) String dclzCode_02,
			@RequestParam(value="dclzCode_04", required = false) String dclzCode_04,
			HttpSession session,
			Model model
			) {
		
		String headCode = (String) session.getAttribute("code");
		PagingVO<DclzVO> pagingVO = listForAjax(currentPage, selectorRow, deptSeq, startDate, endDate, dclzCode_01, dclzCode_02, dclzCode_04, session);
		model.addAttribute("pagingVO", pagingVO);
		
		List<DeptVO> deptList = empService.selectDept(headCode);
		model.addAttribute("deptList", deptList);
		
		return "/head/attendance/attendanceList";
		
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<DclzVO> listForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="deptSeq", required = false) String deptSeq,
			@RequestParam(value="startDate", required = false) String startDate,
			@RequestParam(value="endDate", required = false) String endDate,
			@RequestParam(value="dclzCode_01", required = false) String dclzCode_01,
			@RequestParam(value="dclzCode_02", required = false) String dclzCode_02,
			@RequestParam(value="dclzCode_04", required = false) String dclzCode_04,
			HttpSession session
			){
		
		String headCode = (String) session.getAttribute("code");
		
		PagingVO<DclzVO> pagingVO = new PagingVO<DclzVO>(selectorRow, 10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setHead_code(headCode);
		
		pagingVO.addSearchMap("deptSeq", deptSeq);
		pagingVO.addSearchMap("startDate", startDate);
		pagingVO.addSearchMap("endDate", endDate);
		pagingVO.addSearchMap("dclzCode_01", dclzCode_01);
		pagingVO.addSearchMap("dclzCode_02", dclzCode_02);
		pagingVO.addSearchMap("dclzCode_04", dclzCode_04);
		
		int totalRecord = service.selectEmpWorkCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<DclzVO> dclzList = service.selectEmpWorkList(pagingVO);
		
		for(DclzVO dclzVO : dclzList) {
			String dclz_stdrde = dclzVO.getDclz_stdrde();
			
			if(dclz_stdrde.length() == 8) {
				dclzVO.setDclz_stdrde(dclz_stdrde.substring(0,4)+"-"+dclz_stdrde.substring(4, 6) + "-" + dclz_stdrde.substring(6, 8));
			
			}else {
				dclzVO.setDclz_stdrde(dclz_stdrde.substring(0,4)+"-"+dclz_stdrde.substring(5, 7) + "-" + dclz_stdrde.substring(8, 10));
			}
			
		}
		
		pagingVO.setDataList(dclzList);
		
		for(DclzVO dclzVO : pagingVO.getDataList()) {
			imageBase(dclzVO);
		}
		
		
		return pagingVO;
	}
	
	
	@GetMapping("/excelDownload")
	public View excelDownload(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow,
		@RequestParam(value="deptSeq", required = false) String deptSeq,
		@RequestParam(value="startDate", required = false) String startDate,
		@RequestParam(value="endDate", required = false) String endDate,
		@RequestParam(value="dclzCode_01", required = false) String dclzCode_01,
		@RequestParam(value="dclzCode_02", required = false) String dclzCode_02,
		@RequestParam(value="dclzCode_04", required = false) String dclzCode_04,
		Model model, HttpSession session
	) {
		
		PagingVO<DclzVO> pagingVO  = listForAjax(currentPage, selectorRow, deptSeq, startDate, endDate, dclzCode_01, dclzCode_02, dclzCode_04, session);
		model.addAttribute("pagingVO", pagingVO);
		
		return new ExcelDownloadViewWithJxls() {
			
			@Override
			public Resource getJxlsTemplate() throws IOException {
				return container.getResource("/WEB-INF/jxlstmpl/EmpAttendanceList.xls");
			}
			
			@Override
			public String getDownloadFileName() {
				return "직원근태 리스트.xlsx";
			}
		};
	}
	

	
		//직원근태수정 신청
		@RequestMapping(method = RequestMethod.POST , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ServiceResult insert(
				@RequestParam("dclz_seq") String dclz_seq,
				@RequestParam("attend_time") String attend_time,
				@RequestParam("lvffc_time") String lvffc_time,
				@RequestParam("attendDate") String attendDate,
				@RequestParam("empID") String empID
				) {
			
			
			DclzVO dclzVO = new DclzVO();
			dclzVO.setDclz_seq(Integer.parseInt(dclz_seq));
			dclzVO.setEmp_id(empID);
			
			String stdrde = attendDate.replace("-", "");
			String stdrde_change = stdrde.substring(0,4)+"/"+stdrde.substring(4, 6) + "/" + stdrde.substring(6, 8);

			String attDclz = attDAO.selectAttendanceTime(dclzVO);
			String lvffcDclz = attDAO.selectLvffcTime(dclzVO);
			
			
			if(lvffc_time.equals("00:00")) {
				dclzVO.setLvffc_time(lvffcDclz);
			}else {
				String lvffc_change = stdrde_change + " " + lvffc_time;
				dclzVO.setLvffc_time(lvffc_change);
			}
			
			if(attend_time.equals("00:00")) {
				dclzVO.setAttend_time(attDclz);
			}else {
				String attend_change = stdrde_change + " " + attend_time;
				dclzVO.setAttend_time(attend_change);
			}
			
			ServiceResult result = null;
			if(Integer.parseInt(attend_time.substring(1,2)) < 9) {
				result = attservice.ChangeOKBeforeUpdate(dclzVO);
				
				
			}else if(attend_time.substring(1,2).equals("9") && attend_time.substring(3,5).equals("00")) {
				result = attservice.ChangeOKBeforeUpdate(dclzVO);
				
			}else {
				result = attservice.ChangeOKUpdate(dclzVO);
				
			}
			
			attDAO.updateAttLvfTime(dclzVO);
			
			return result;
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


