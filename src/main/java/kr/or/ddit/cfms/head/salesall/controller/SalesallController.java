package kr.or.ddit.cfms.head.salesall.controller;

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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.limit.vo.OrdersVO;
import kr.or.ddit.cfms.head.prod.vo.HeadProdVO;
import kr.or.ddit.cfms.head.salesall.service.IHeadSalesallService;
import kr.or.ddit.cfms.head.salesall.vo.SalesProdVO;

/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 19      이진수       최초작성
 * 2021. 6. 11      이진수       구축
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/salesall")
public class SalesallController {
	private static final Logger logger = LoggerFactory.getLogger(SalesallController.class);
	
	@Inject
	private IHeadSalesallService service;
	
	@GetMapping
	public String salesallList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, Model model
			, HttpSession session
			) {
		PagingVO<HeadProdVO> pagingVO = listForAjax(currentPage, session);
		model.addAttribute("pagingVO", pagingVO);
		return "/head/salesall/salesallList";
		
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<HeadProdVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, HttpSession session
	) {
		/** 파라미터 조회 - 세션에 담긴 가맹본부 코드 저장 */
		String headCode = (String) session.getAttribute("code");
		
		/** 결과자료 객체생성 */ 
		PagingVO<HeadProdVO> pagingVO = new PagingVO<>(20, 10, currentPage); /** 보낼자료 */ 
		pagingVO.setDetailSearch(new HeadProdVO(headCode));
		/** 파라미터 검증 */
		
		/** 서비스 데이터 구성 */ 
		
		/** 서비스 요청 */ 
		service.selectMainInfo(pagingVO);
//		logger.info("{}", pagingVO.getDataList());
		/** 결과 전송 */
		return pagingVO;
	}
	
	@GetMapping("/detail")
	public String salesallDetail(
			@RequestParam("what") String prodCode
			,Model model
			, HttpSession session
			) {
		logger.info("{}", prodCode);
		/** 파라미터 조회 - 세션에 담긴 가맹본부 코드 저장 */
		String headCode = (String) session.getAttribute("code");
		
		/** 결과자료 객체생성 */ 
		OrdersVO ordersVO = new OrdersVO(headCode);
		
		HeadInvenVO headInvenVO = new HeadInvenVO(headCode, prodCode);
		ordersVO.setHeadInven(headInvenVO);
		/** 파라미터 검증 */
		
		/** 서비스 데이터 구성 */ 
		
		/** 서비스 요청 */
		// 상품 정보 가져오기
		headInvenVO = service.selectSalesProdInfo(headInvenVO);
		
		// 상품 페이징 처리
		model.addAttribute("headInvenVO", headInvenVO);
		/** 결과 전송 */
		return "/head/salesall/salesallDetail";
	}
	
	@RequestMapping(value = "/detail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<SalesProdVO> SalesProdlistForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		,@RequestParam("prodCode") String prodCode
		, HttpSession session
	) {
		/** 파라미터 조회 - 세션에 담긴 가맹본부 코드 저장 */
		String headCode = (String) session.getAttribute("code");
		
		/** 결과자료 객체생성 */ 
		PagingVO<SalesProdVO> pagingVO = new PagingVO<>(10, 10, currentPage); /** 보낼자료 */ 
		pagingVO.setDetailSearch(new SalesProdVO(headCode, prodCode));
		
		/** 파라미터 검증 */
		
		/** 서비스 데이터 구성 */ 
		
		/** 서비스 요청 */ 
		service.selectSalesProdListInfo(pagingVO);
		/** 결과 전송 */
		return pagingVO;
	}
	
	@GetMapping("/form")
	public String salesallForm() {
		return "/head/salesall/salesallForm";
		
	}
	
	@GetMapping(value = "/chart", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<SalesProdVO> salesChart(
			@RequestParam("prod_code") String prod_code
			, HttpSession session
			){
		String head_code = (String) session.getAttribute("code");
		SalesProdVO searchChart = new SalesProdVO(head_code, prod_code);
		List<SalesProdVO> chart = new ArrayList<>();
		
		chart = service.retrieveChart(searchChart);
		
		logger.info("{}", chart);
		return chart;
	}
	@PostMapping
	public String insert() {
		return null;
		
	}
	
	@GetMapping("/modify")
	public String updateForm() {
		return "/head/salesall/salesallForm";
		
	}
	
	
	
	@PutMapping
	public String update() {
		return null;
		
	}
	
	@DeleteMapping
	public String delete() {
		return null;
		
	}
}
