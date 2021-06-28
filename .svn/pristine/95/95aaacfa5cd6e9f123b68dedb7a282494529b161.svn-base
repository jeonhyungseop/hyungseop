package kr.or.ddit.cfms.fran.deposit.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.deposit.service.IFranDepositService;
import kr.or.ddit.cfms.fran.deposit.vo.FrdsmnVO;

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
@RequestMapping("/fran/deposit")
public class FranDepositController {
	
	private static final Logger logger = LoggerFactory.getLogger(FranDepositController.class);

	@Inject
	private IFranDepositService service;

	@Value("#{appInfo.attatch}")
	private File saveFolder;

	@PostConstruct
	public void init() {
		logger.info("{} 초기화, {} 주입됨.", getClass().getSimpleName(), saveFolder.getAbsolutePath());
	}

	@GetMapping
	public String depositList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "minDate", required = false) String minDate,
			@RequestParam(value = "maxDate", required = false) String maxDate,
			@RequestParam(value = "screenSize", required = false, defaultValue = "10") int screenSize,
			HttpSession session,
			Model model) {
		PagingVO<FrdsmnVO> pagingVO = listForAjax(currentPage, searchType, searchWord, minDate, maxDate, screenSize, session);

		
		
		model.addAttribute("pagingVO", pagingVO);
		return "/fran/deposit/depositList";

	}

	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<FrdsmnVO> listForAjax(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "minDate", required = false) String minDate,
			@RequestParam(value = "maxDate", required = false) String maxDate,
			@RequestParam(value = "screenSize", required = false, defaultValue = "10") int screenSize,
			HttpSession session
	) {
		
		String franCode = null;
		if(StringUtils.isNotEmpty((String)session.getAttribute("code"))) {
			franCode = (String) session.getAttribute("code");
		}
		
		FrdsmnVO depositVO = new FrdsmnVO();
		depositVO.setFran_code(franCode);
		int depositBlce = service.retireveFranDepositBlce(depositVO);
		
		PagingVO<FrdsmnVO> pagingVO = new PagingVO<>(10, 10);
		pagingVO.setScreenSize(screenSize);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setDetailSearch(depositVO);	

		// 검색 조건
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("minDate", minDate);
		searchMap.put("maxDate", maxDate);
		pagingVO.setSearchMap(searchMap);

		int totalRecord = service.retrieveFranDepositCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<FrdsmnVO> depositList = service.retrieveFranDepositList(pagingVO);
		
		pagingVO.setDataList(depositList);
		pagingVO.setDepositBlce(depositBlce);

		return pagingVO;
	}

	@GetMapping("/excel")
	public String excelDown( Model model, HttpSession session) throws IOException {
		
		//코드
		String franCode = null;
		if(StringUtils.isNotEmpty((String)session.getAttribute("code"))) {
			franCode = (String) session.getAttribute("code");
		}
		
		FrdsmnVO depositVO = new FrdsmnVO();
		depositVO.setFran_code(franCode);
		
		//id
		String authId = (String) session.getAttribute("authId");
		
		if(StringUtils.isNotEmpty(authId)) {
			String tableName = service.retireveAuthIdTable(authId);
			model.addAttribute("tableName", tableName);
		}else {
			model.addAttribute("msg", "로그인 후 다시 시도해 주세요.");
			logger.info("model : {}", model );
			return "/fran/deposit/depositList";
		}
		
		PagingVO<FrdsmnVO> pagingVO = new PagingVO<>();
		pagingVO.setDetailSearch(depositVO);

		// 검색 조건
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("excel", "Y");
		searchMap.put("se", "fran");
		pagingVO.setSearchMap(searchMap);

		int totalRecord = service.retrieveFranDepositCount(pagingVO);

		pagingVO.setStartRow(1);
		pagingVO.setEndRow(totalRecord);

		List<FrdsmnVO> excelDataList = service.retrieveFranDepositList(pagingVO);
		
		model.addAttribute("excelDataList", excelDataList);

		return "depositDownloadView";
		
	}

	@RequestMapping(value = "/form")
	@ResponseBody
	public int depositForm(
			@RequestParam(value = "money", defaultValue="1") int money,
			@RequestParam(value = "pg") String pg,
			HttpSession session
			) {
		String esc = null;
		
		switch (pg) {
			case "kakaopay" :		//카카오페이
					esc = "A0001";
				break;
			case "inicis" :			//카드결제
					esc = "C0001";
				break;
			default : esc = "C0001";	//계좌이체
		}
		
		FrdsmnVO depositVO = new FrdsmnVO();
		
		String franCode = (String)session.getAttribute("code");
		int cnt = 0;
		if(StringUtils.isNotEmpty(franCode)) {
		depositVO.setDsmn_mvmoney(money);
		depositVO.setFran_code(franCode);
		depositVO.setElctc_mt_code(esc);
		
		cnt = service.createFranDeposit(depositVO);
		}
		
		return cnt;

	}


}
