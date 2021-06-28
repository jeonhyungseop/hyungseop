package kr.or.ddit.cfms.head.deposit.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.deposit.service.IHeadDepositService;
import kr.or.ddit.cfms.head.deposit.vo.HeadsmnVO;

/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24      배수진       최초작성
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 *      </pre>
 */
@Controller
@RequestMapping("/head/deposit")
public class HeadDepositController {
	private static final Logger logger = LoggerFactory.getLogger(HeadDepositController.class);

	@Inject
	private IHeadDepositService service;

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
		PagingVO<HeadsmnVO> pagingVO = listForAjax(currentPage, searchType, searchWord, minDate, maxDate, screenSize, session);

		
		
		model.addAttribute("pagingVO", pagingVO);
		return "/head/deposit/depositList";

	}

	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<HeadsmnVO> listForAjax(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "minDate", required = false) String minDate,
			@RequestParam(value = "maxDate", required = false) String maxDate,
			@RequestParam(value = "screenSize", required = false, defaultValue = "10") int screenSize,
			HttpSession session

	) {
		
		String headCode = null;
		if(StringUtils.isNotEmpty((String)session.getAttribute("code"))) {
			headCode = (String) session.getAttribute("code");
		}
	
		
		HeadsmnVO depositVO = new HeadsmnVO();
		logger.info("------------------------head_code {} ", headCode);
		
		depositVO.setHead_code(headCode);
		
		
		
		PagingVO<HeadsmnVO> pagingVO = new PagingVO<>(10, 10);
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

		int totalRecord = service.retrieveHeadDepositCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<HeadsmnVO> depositList = service.retrieveHeadDepositList(pagingVO);
		logger.info("갯수 ------------- {}",depositList.size());
		
		
		int depositBlce = 0;
		
		if(depositList.size() > 0 ) {
			depositBlce = service.retireveHeadDepositBlce(depositVO);
		}
		
		pagingVO.setDataList(depositList);
		pagingVO.setDepositBlce(depositBlce);

		return pagingVO;
	}
	
	@GetMapping("/excel")
	public String excelDown( Model model, HttpSession session) throws IOException {
		
		
		String authId = (String) session.getAttribute("authId");
		
		if(StringUtils.isNotEmpty(authId)) {
			String tableName = service.retireveAuthIdTable(authId);
			model.addAttribute("tableName", tableName);
		}else {
			model.addAttribute("msg", "로그인 후 다시 시도해 주세요.");
			logger.info("model : {}", model );
			return "/head/deposit/depositList";
		}
		
		String headCode = null;
		if(StringUtils.isNotEmpty((String)session.getAttribute("code"))) {
			headCode = (String) session.getAttribute("code");
		}
		HeadsmnVO depositVO = new HeadsmnVO();
		logger.info("------------------------head_code {} ", headCode);
		
		depositVO.setHead_code(headCode);
		
		
		PagingVO<HeadsmnVO> pagingVO = new PagingVO<>();
		pagingVO.setDetailSearch(depositVO);

		// 검색 조건
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("excel", "Y");
		pagingVO.setSearchMap(searchMap);

		int totalRecord = service.retrieveHeadDepositCount(pagingVO);

		pagingVO.setStartRow(1);
		pagingVO.setEndRow(totalRecord);

		List<HeadsmnVO> excelDataList = service.retrieveHeadDepositList(pagingVO);
		
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
		
		HeadsmnVO depositVO = new HeadsmnVO();
		String headCode = (String)session.getAttribute("code");
		
		int cnt = 0;
		if(StringUtils.isNotEmpty(headCode)) {
		depositVO.setDsmn_mvmoney(money);
		depositVO.setHead_code(headCode);
		depositVO.setElctc_mt_code(esc);
		
		cnt = service.createHeadDeposit(depositVO);
		}
		return cnt;

	}

	@PostMapping
	public String insert() {
		return null;

	}
}
