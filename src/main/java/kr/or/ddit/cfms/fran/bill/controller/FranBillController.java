package kr.or.ddit.cfms.fran.bill.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.bill.service.IFranBillService;
import kr.or.ddit.cfms.fran.bill.vo.FranBillVO;
import kr.or.ddit.cfms.fran.deposit.vo.FrdsmnVO;

/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * -----------     --------    ----------------------
 * 2021. 06. 23     진유리         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fran/bill")
public class FranBillController {
	private static final Logger logger = LoggerFactory.getLogger(FranBillController.class);

	@Inject
	private IFranBillService service;
	
	public void comCode(Model model) {
		ComCodeGrpVO BscCode = service.retrieveCodeList("BSC");
		ComCodeGrpVO PscCode = service.retrieveCodeList("PSC");
		model.addAttribute("BscCode", BscCode);
		model.addAttribute("PscCode", PscCode);
	}
	
	@GetMapping
	public String main(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@RequestParam(value ="selector", required = false, defaultValue = "10") int selectorRow,
		@RequestParam(value="searchDay", required = false) String searchDay,
		@RequestParam(value="bscCode", required = false) String bscCode,
		@RequestParam(value="pscCode", required = false) String pscCode,
		Model model, HttpSession session
	) {
		PagingVO<FranBillVO> pagingVO = listForAjax(currentPage, selectorRow, searchDay, bscCode, pscCode, session);
		comCode(model);
		model.addAttribute("pagingVO", pagingVO);
		return "/fran/bill/billList";
	}

	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<FranBillVO> listForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@RequestParam(value ="selector", required = false, defaultValue = "10") int selectorRow,
			@RequestParam(value="searchDay", required = false) String searchDay,
			@RequestParam(value="bscCode", required = false) String bscCode,
			@RequestParam(value="pscCode", required = false) String pscCode,
			HttpSession session
	) {
		/**파라미터 조회 - 세션에 담긴 가맹본부 코드 저장*/
		String code = (String) session.getAttribute("code");
		String authId = (String) session.getAttribute("authId");
		if(code == null || authId == null) {
			return null;
		}
		
		/**결과자료 객체 생성*/
		PagingVO<FranBillVO> pagingVO = new PagingVO<>(selectorRow, 10, currentPage);
		pagingVO.addSearchMap("searchDay", searchDay);
		pagingVO.addSearchMap("bscCode", bscCode);
		pagingVO.addSearchMap("pscCode", pscCode);
		pagingVO.setDetailSearch(new FranBillVO(code.substring(0, 5), code));
		FrdsmnVO depositVO = new FrdsmnVO();
		depositVO.setFran_code(code);
		/**파라미터 검증*/
		
		/**서비스 데이터 구성*/
		
		/**서비스 요청*/
		int totalRecord = service.retrieveBillCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<FranBillVO> headRoyalList = service.retrieveBillList(pagingVO);
		
		int depositBlce = service.retireveFranDepositBlce(depositVO);
		
		pagingVO.setDataList(headRoyalList);
		pagingVO.setDepositBlce(depositBlce);
		
		/**결과전송*/
		return pagingVO;
	}
	
	@PostMapping(value = "/pay", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> pay(
		@RequestParam Integer seq,
		@RequestParam String pay_code,
		@RequestParam(required = false) Integer price,
		@RequestParam(required = false) String content
		, HttpSession session
	){
		logger.info("seq"+seq+"pay_code"+pay_code+"price"+price);
		String code = (String) session.getAttribute("code");
		if(code == null) {
			return null;
		}
		Map<String, Object> resultMap = new HashMap<>();
		FranBillVO vo = new FranBillVO(); 
		FrdsmnVO frdsmn = new FrdsmnVO();
		
		if(pay_code.equals("deposit")) {
			vo.setPay_se_code("C0001");
			frdsmn.setDsmn_mvmoney(price);
			frdsmn.setFran_code(code);
			frdsmn.setMemo(content);
			vo.setFrdsmnVO(frdsmn);
		}else if(pay_code.equals("card")) {
			vo.setPay_se_code("D0001");
		}else if(pay_code.equals("point")) {
			vo.setPay_se_code("A0001");
		}
		
		vo.setBilclct_seq(seq);
		vo.setFran_code(code);
		int cnt = service.updateFranBill(vo);
		if(cnt > 0) {
			resultMap.put("result", "OK");
		}else {
			resultMap.put("result", "FAIL");
		}
		
		return resultMap;
	}
	
}