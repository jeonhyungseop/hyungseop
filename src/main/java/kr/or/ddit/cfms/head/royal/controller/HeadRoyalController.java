package kr.or.ddit.cfms.head.royal.controller;

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
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.royal.service.IHeadRoyalService;
import kr.or.ddit.cfms.head.royal.vo.HeadRoyalVO;

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
@RequestMapping("/head/royal")
public class HeadRoyalController {
	private static final Logger logger = LoggerFactory.getLogger(HeadRoyalController.class);
	
	@Inject
	private IHeadRoyalService service;
	
	@GetMapping
	public String royal(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@RequestParam(value ="selector", required = false, defaultValue = "5") int selectorRow,
		@RequestParam(value="startDate", required = false) String startDate,
		@RequestParam(value="endDate", required = false) String endDate,
		@RequestParam(value="minPrice", required = false) String minPrice,
		@RequestParam(value="maxPrice", required = false) String maxPrice,
		Model model, HttpSession session	
	) {
		PagingVO<HeadRoyalVO> pagingVO  = listForAjax(currentPage, selectorRow, startDate, endDate, minPrice, maxPrice, session);
		model.addAttribute("pagingVO", pagingVO);
		return "/head/royal/royalMain";
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<HeadRoyalVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
		@RequestParam(value ="selector", required = false, defaultValue = "5") int selectorRow,
		@RequestParam(value="startDate", required = false) String startDate,
		@RequestParam(value="endDate", required = false) String endDate,
		@RequestParam(value="minPrice", required = false) String minPrice,
		@RequestParam(value="maxPrice", required = false) String maxPrice
		, HttpSession session
	){
		/**파라미터 조회 - 세션에 담긴 가맹본부 코드 저장*/
		String code = (String) session.getAttribute("code");
		
		/**결과자료 객체 생성*/
		PagingVO<HeadRoyalVO> pagingVO = new PagingVO<>(selectorRow, 10, currentPage);
		pagingVO.addSearchMap("startDate", startDate);
		pagingVO.addSearchMap("endDate", endDate);
		pagingVO.addSearchMap("minPrice", minPrice);
		pagingVO.addSearchMap("maxPrice", maxPrice);
		pagingVO.setDetailSearch(new HeadRoyalVO(code));
		
		/**파라미터 검증*/
		
		/**서비스 데이터 구성*/
		
		/**서비스 요청*/
		int totalRecord = service.retrieveRoyalCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<HeadRoyalVO> RoyalList = service.retrieveRoyalList(pagingVO);
		
		pagingVO.setDataList(RoyalList);
		
		/**결과전송*/
		return pagingVO;
	}
	
	
	@PostMapping(value = "/register", produces = MediaType.APPLICATION_JSON_UTF8_VALUE )
	@ResponseBody
	public Map<String, String> updateForm(
		@RequestParam("code") String code
		, @RequestParam("price") Integer royalty
		, @RequestParam("startday") String royalty_apli_start_de
	) {
		Map<String, String> resultMap = new HashMap<>();
		HeadRoyalVO royal = new HeadRoyalVO(code, royalty, royalty_apli_start_de);
		int cnt = service.insertRoyal(royal);
		if(cnt > 0) {
			resultMap.put("result", "OK");
		}else {
			resultMap.put("result", "Fail");
		}
		return resultMap;
	}
	
	@GetMapping(value = "/royalchart", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<HeadRoyalVO> royalList(
		@RequestParam("code") String code
	){
		List<HeadRoyalVO> chartList = service.retrieveRoyalChart(code);
		return chartList;
	}
	
}
