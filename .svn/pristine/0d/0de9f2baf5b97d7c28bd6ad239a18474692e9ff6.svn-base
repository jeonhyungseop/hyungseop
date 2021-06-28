package kr.or.ddit.cfms.head.royal.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.royal.service.IHeadRoyalService;
import kr.or.ddit.cfms.head.royal.vo.HeadBillVO;

/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 06. 09     진유리         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/bill")
public class HeadBillController {
	
	@Inject
	private IHeadRoyalService service;
	
	public void comCode(Model model) {
		ComCodeGrpVO BscCode = service.retrieveCodeList("BSC");
		ComCodeGrpVO PscCode = service.retrieveCodeList("PSC");
		model.addAttribute("BscCode", BscCode);
		model.addAttribute("PscCode", PscCode);
	}
	
	@GetMapping("/BillList")
	public String royalList(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@RequestParam(value ="selector", required = false, defaultValue = "10") int selectorRow,
		@RequestParam(value="searchNm", required = false) String searchNm,
		@RequestParam(value="startDate", required = false) String startDate,
		@RequestParam(value="endDate", required = false) String endDate,
		@RequestParam(value="bscCode", required = false) String bscCode,
		@RequestParam(value="pscCode", required = false) String pscCode,
		Model model, HttpSession session
	) {
		PagingVO<HeadBillVO> pagingVO = listForAjax(currentPage, selectorRow, searchNm, startDate, endDate, bscCode, pscCode, session);
		comCode(model);
		model.addAttribute("pagingVO", pagingVO);
		return "/head/royal/billList";
	}
	
	@RequestMapping(value = "/BillList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<HeadBillVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@RequestParam(value ="selector", required = false, defaultValue = "10") int selectorRow,
		@RequestParam(value="searchNm", required = false) String searchNm,
		@RequestParam(value="startDate", required = false) String startDate,
		@RequestParam(value="endDate", required = false) String endDate,
		@RequestParam(value="bscCode", required = false) String bscCode,
		@RequestParam(value="pscCode", required = false) String pscCode,
		HttpSession session
	) {
		/**파라미터 조회 - 세션에 담긴 가맹본부 코드 저장*/
		String code = (String) session.getAttribute("code");
		
		/**결과자료 객체 생성*/
		PagingVO<HeadBillVO> pagingVO = new PagingVO<>(selectorRow, 10, currentPage);
		pagingVO.addSearchMap("searchNm", searchNm);
		pagingVO.addSearchMap("startDate", startDate);
		pagingVO.addSearchMap("endDate", endDate);
		pagingVO.addSearchMap("bscCode", bscCode);
		pagingVO.addSearchMap("pscCode", pscCode);
		pagingVO.setDetailSearch(new HeadBillVO(code));
		
		/**파라미터 검증*/
		
		/**서비스 데이터 구성*/
		
		/**서비스 요청*/
		int totalRecord = service.retrievetBillCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<HeadBillVO> headRoyalList = service.retrieveBillList(pagingVO);
		
		pagingVO.setDataList(headRoyalList);
		
		/**결과전송*/
		return pagingVO;
	}
	
}