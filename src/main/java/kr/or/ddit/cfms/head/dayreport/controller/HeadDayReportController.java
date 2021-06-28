package kr.or.ddit.cfms.head.dayreport.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.dayreport.service.IHeadDayReportService;
import kr.or.ddit.cfms.head.dayreport.vo.CordlistVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordsalelistsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CustomerorderVO;
import kr.or.ddit.cfms.head.dayreport.vo.TargetVO;
import kr.or.ddit.cfms.head.dayreport.vo.TargetselectVO;
import kr.or.ddit.cfms.login.service.ILoginService;
import kr.or.ddit.cfms.login.vo.UserVO;

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
@RequestMapping("/head/dayreport")
public class HeadDayReportController {
	private Logger logger = LoggerFactory.getLogger(HeadDayReportController.class);
	
	@Inject
	private ILoginService loginservice;
	
	@Inject
	private IHeadDayReportService service;
	
	public void init() {
		logger.info("{} 초기화, {} 주입됨.",getClass().getSimpleName(), service.getClass().getSimpleName());
	}
	
	//리스트 조회
	@GetMapping
	public String dayReportList(
			HttpSession session,
			RedirectAttributes rdir,
			HttpServletRequest request,
			Model model
			) {
		/** 파라미터 조회 */
		String headCode = (String)session.getAttribute("code");
		
		/** 결과자료 객체 생성 */
		
		/** 파라미터 검증 */
		if(StringUtils.isEmpty(headCode) || headCode.length() > 5) {
			rdir.addFlashAttribute("msg", "잘못 된 접근입니다.");
			return "redirect:/";
		}
		/** 서비스 데이터 구성 */
		
		/** 서비스 요청 */
		service.settingDatas(model, headCode);
		
		
		/** 결과전송*/
		return "/head/dayreport/dayreportList";
	}
	
	//리스트 비동기 조회
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> listForAjax(
			@RequestParam(value="franCode", required = false) String franCode,
			@RequestParam(value="franNm", required = false) String franNm,
			HttpSession session
			){
		/** 파라미터 조회 */
		String headCode = (String)session.getAttribute("code");
		
		/** 결과자료 객체 생성 */
		Map<String, Object> dailyGraph = new HashMap<>();
		
		/** 서비스 데이터 구성 */
		Map<String, String> params = new HashMap<>();
		params.put("headCode", headCode);
		params.put("franCode", franCode);
		params.put("franNm", franNm);
		
		/** 서비스 요청 */
		List<CustomerorderVO> totalSaleByFran = service.retriveDaySaleList(params);
		
		List<FranchiseVO> franlist = service.retriveFranchiseList(params);
		dailyGraph.put("franlist", franlist);
		
		/** 결과전송*/
		dailyGraph.put("totalSaleByFran", totalSaleByFran);
		
		return dailyGraph;
	}
	
	
	@GetMapping("/detail")
	public String dayReportDetail(
			@RequestParam(value="what") String franCode,
			HttpSession session,
			Model model
			) {
		/** 파라미터 조회 */
		String authId = (String)session.getAttribute("authId");
		
		//
		
		/** 결과자료 객체 생성 */
	    Map<String, Object> respValue = new HashMap<>();
	  
		
		/** 서비스 데이터 구성 */
		
	    
		/** 서비스 요청 */
	    service.settingDetailDatas(model, franCode);
	    
	    //직원의 담당 가맹점 찾기
	    List<String> chargeFranCode  = new ArrayList<>();
	    chargeFranCode = service.retriveFranchiseCharge(authId);
	    
	    //목표매출 작성 가능 여부 및 목표매출 조회
	    int postTargetMoney = service.retrivePostTargetMoney(franCode);
	    
	    //전년도 매출 조회
	    List<TargetselectVO> targetMoneys = service.retriveYearAgoMoney(franCode);
	    
	    //전년도 평균 매출 조회
	    int targetMoneysAvg = service.retriveYearAgoAvg(franCode);
	    
	    /** 결과 자료 데이터 구성*/
	    respValue.put("postTargetMoney",postTargetMoney);
	    respValue.put("targetMoneys",targetMoneys);
	    respValue.put("targetMoneysAvg",targetMoneysAvg);

	    if(chargeFranCode.size() > 0) {
	    	respValue.put("chargeFranCode",chargeFranCode);
	    }
		/** 결과전송*/
		model.addAttribute("respValue", respValue);
		
		return "/head/dayreport/dayreportDetail";
		
	}
	
	//상세정보 비동기 조회
	@RequestMapping(value = "/detail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
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
	@RequestMapping(value = "/detail/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
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
	
	//목표매출 설정 insert
	@GetMapping("/detail/setting")
	public  String targetSettingForAjax(
			@ModelAttribute(value = "targetVO")TargetVO targetVO ,
			HttpSession session
			) {
		/** 파라미터 조회 */
		String authId = (String)session.getAttribute("authId");
		
		/** 결과자료 객체 생성 */
		int cnt = 0;
		String massage = null;
		
		/** 서비스 데이터 구성 */
		targetVO.setEmp_id(authId);
		
		/** 서비스 요청 */
		cnt = service.createTarget(targetVO);
		
		/** 결과전송*/
		if(cnt > 0) {
			massage = "정상적으로 등록되었습니다.";
		}else {
			massage = "등록에 실패했습니다. 잠시 후 다시시도 해주세요.";
		}
		
		return "redirect:/head/dayreport/detail?what="+targetVO.getFran_code();
	};
	
	//목표매출 수정 
	@PostMapping("/detail/setting")
	public String targetModifyForAjax(
			@ModelAttribute(value = "targetVO")TargetVO targetVO ,
			HttpSession session,
			RedirectAttributes rdir
			) {
		
		
		/** 파라미터 조회 */
		String authId = (String)session.getAttribute("authId");
		
		/** 결과자료 객체 생성 */
		int cnt = 0;
		String massage = null;
		
		/** 서비스 데이터 구성 */
		targetVO.setEmp_id(authId);
		
		/** 서비스 요청 */
		cnt = service.modifyTarget(targetVO);
		
		/** 결과전송*/
		if(cnt > 0) {
			massage = "정상적으로 등록되었습니다.";
		}else {
			massage = "등록에 실패했습니다. 잠시 후 다시시도 해주세요.";
		}
		
		rdir.addFlashAttribute("massage",massage);
		
		return  "redirect:/head/dayreport/detail?what="+targetVO.getFran_code();
	}
	
	//비밀번호 확인 
	@RequestMapping(value = "/detail", produces = MediaType.TEXT_PLAIN_VALUE, method = RequestMethod.POST)
	@ResponseBody
	public  String passForAjax(
				@RequestParam(value = "pass") String pwd,
				HttpSession session
			){
		
		/** 파라미터 조회 */
		String authid = (String) session.getAttribute("authId");
		
		/** 결과자료 객체 생성 */
		String view = null;
		
		/** 서비스 데이터 구성 */
		UserVO user = new UserVO(authid, pwd);
		
		/** 서비스 요청 */
		ServiceResult authResult = loginservice.authenticate(user);
		switch (authResult) {
		
		case OK:
			view = "ok"; 
			break;

			
		case INVALIDPASSWORD:
			view = "false";
			break;
		}
		
		logger.info("view---------------{}", view);
		/** 결과전송*/
		return view;
	}
	
}
