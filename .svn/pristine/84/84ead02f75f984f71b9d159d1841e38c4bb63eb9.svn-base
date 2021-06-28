package kr.or.ddit.cfms.fran.dayreport.controller;

import java.util.ArrayList;
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
import kr.or.ddit.cfms.fran.dayreport.service.IFranDayReportService;
import kr.or.ddit.cfms.head.dayreport.controller.HeadDayReportController;
import kr.or.ddit.cfms.head.dayreport.service.IHeadDayReportService;
import kr.or.ddit.cfms.head.dayreport.vo.CordlistVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordsalelistsVO;
import kr.or.ddit.cfms.head.dayreport.vo.TargetselectVO;
import kr.or.ddit.cfms.login.service.ILoginService;

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
@RequestMapping("/fran/dayreport")
public class DayreportController {
private Logger logger = LoggerFactory.getLogger(HeadDayReportController.class);
	
	@Inject
	private IFranDayReportService service;
	
	public void init() {
		logger.info("{} 초기화, {} 주입됨.",getClass().getSimpleName(), service.getClass().getSimpleName());
	}
	
	
	@GetMapping
	public String dayreportList(
			HttpSession session,
			Model model
			) {
		/** 파라미터 조회 */
		String authId = (String)session.getAttribute("authId");
		String franCode = (String)session.getAttribute("code");
		
		/** 서비스 데이터 구성 */
		
		/** 서비스 요청 */
	    service.settingDetailDatas(model, franCode);
	    
	    /** 결과 자료 데이터 구성*/

		/** 결과전송*/
		return "/fran/dayreport/dayreportList";
		
	}
	
	//상세정보 비동기 조회
		@RequestMapping( produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public  PagingVO<CordsalelistsVO> detailForAjax(
				@RequestParam(value="page", defaultValue = "1") int page,
				@RequestParam(value="what") String franCode,
				@RequestParam(value="searchDate", required = false) String searchDate,
				Model model
				){
			
			/** 파라미터 조회 */
			
			/** 결과자료 객체 생성 */
			PagingVO<CordsalelistsVO> pagingVO = new PagingVO<>(10,5,page);
			
			/** 서비스 데이터 구성 */
			Map<String, Object> searchMap = new HashMap<>();
			searchMap.put("searchDate", searchDate);
			
			pagingVO.setFran_code(franCode);
			pagingVO.setSearchMap(searchMap);
			
			/** 서비스 요청 */
			List<CordsalelistsVO> dataList = service.retriveFranCordList(pagingVO);
			
			/** 결과전송*/
			pagingVO.setDataList(dataList);
			
			return pagingVO;
		}
		
		//주문 상세정보 비동기 조회
		@RequestMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public  List<CordlistVO> detailForAjax(
				@RequestParam(value="ordpayNo") String ordpayNo
				){
			/** 파라미터 조회 */
			
			/** 결과자료 객체 생성 */
			List<CordlistVO> cordlistVO = new ArrayList<>();
			
			/** 서비스 데이터 구성 */
			
			/** 서비스 요청 */
		    cordlistVO = service.retrivePaylist(ordpayNo);
			
			/** 결과전송*/
			
			return cordlistVO;
		};
	
	@GetMapping("/detail")
	public String dayreportDetail(
			
			) {
	
		
		return "/fran/dayreport/dayreportDetail";
		
	}
	
	@GetMapping("/form")
	public String dayreportForm() {
		return "/fran/dayreport/dayreportForm";
		
	}
	
	@PostMapping
	public String insert() {
		return null;
		
	}
}
