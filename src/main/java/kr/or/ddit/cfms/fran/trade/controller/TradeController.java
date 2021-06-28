package kr.or.ddit.cfms.fran.trade.controller;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.View;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.trade.service.ITradeService;
import kr.or.ddit.cfms.fran.trade.vo.TradeSearchVO;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.limit.service.IHeadLimitService;
import kr.or.ddit.cfms.head.limit.vo.OrdersVO;
import kr.or.ddit.cfms.head.limit.vo.OrdlistVO;
import kr.or.ddit.cfms.utils.ImageBase64Util;
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
 * 2021. 6. 8      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fran/trade")
public class TradeController {
	private static final Logger logger = LoggerFactory.getLogger(TradeController.class);
	
	@Inject
	private ITradeService service;
	
	@Inject
	private WebApplicationContext container;
	
	@PostConstruct
	public void init() {
		logger.info("{} 초기화, {} 주입됨.", getClass().getSimpleName(), service.getClass().getSimpleName());
	}
	
	// 리스트 조회
	@GetMapping
	public String tradeList(
			@ModelAttribute TradeSearchVO tradeSearchVO,
			HttpSession session,
			Model model
			) {
		PagingVO<OrdersVO> pagingVO = listForAjax(tradeSearchVO, session);
		
		comCode(model);
		model.addAttribute("pagingVO", pagingVO);
		
		return "/fran/trade/tradeList";
		
	}
	
	//리스트 비동기 조회
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<OrdersVO> listForAjax(
			@ModelAttribute TradeSearchVO tradeSearchVO,
			HttpSession session
			){
		
		/** 파라미터 조회 */
		String franCode = (String) session.getAttribute("code");
		/** 결과자료 객체 생성 
		 * 	new PagingVO<>(screenSize, blockSize, cuurentSize, searchMapVO)
		 *  검색 조건을 VO에 담아서 넣으면 자동으로 searchMap에 들어감 
		 * */
		PagingVO<OrdersVO> pagingVO = new PagingVO<>(tradeSearchVO.getScreenSize() , 10, tradeSearchVO.getPage(), tradeSearchVO);
		pagingVO.setDetailSearch(new OrdersVO(franCode));
		
		/** 파라미터 검증 */
		
		/** 서비스 데이터 구성 */ 
		
		/** 서비스 요청 */
		service.selectMainInfo(pagingVO);
		
		/** 결과 전송 */
		return pagingVO;
	}
	
	//공통코드 
	public void comCode(Model model) {
		ComCodeGrpVO orcCode = service.retrieveCodeList("ORS");
		ComCodeGrpVO oscCode = service.retrieveCodeList("OSC");
		ComCodeGrpVO iscCode = service.retrieveCodeList("IST");
		model.addAttribute("orsCode", orcCode);
		model.addAttribute("oscCode", oscCode);
		model.addAttribute("istCode", iscCode);
	}
	
	@GetMapping("/detail")
	public String tradeDetail(
			@RequestParam("what") String orderNo
			,Model model 
			,HttpSession session
			) {
		String franCode = (String) session.getAttribute("code");
		/** 결과 자료 객체 생성 */
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setFran_code(franCode);
		ordersVO.setOrder_no(orderNo);
		/** 서비스 요청*/
		ordersVO = service.retriveTradeDetail(ordersVO);
//		logger.info("{}", ordersVO);
		
		/** 결과 전송 */
		model.addAttribute("ordersVO", ordersVO);
		
		
		return "/fran/trade/tradeDetail";
	}
	
	@PostMapping
	public String tradeComplete(
			@RequestParam("orderNo") String orderNo
			) {
		logger.info("{}", orderNo);
		
		ServiceResult result = service.updateIn(orderNo);
		
		String view = "redirect:/fran/trade/detail?what=" + orderNo;
		return view;
	}
	
	@GetMapping("/excelDownload")
	public View excelDownload(
			@ModelAttribute TradeSearchVO tradeSearchVO,
			HttpSession session
			, Model model
	) {
		
		PagingVO<OrdersVO> pagingVO = listForAjax(tradeSearchVO, session);
		model.addAttribute("pagingVO", pagingVO);
		
		return new ExcelDownloadViewWithJxls() {
			
			@Override
			public Resource getJxlsTemplate() throws IOException {
				return container.getResource("/WEB-INF/jxlstmpl/tradeList.xls");
			}
			
			@Override
			public String getDownloadFileName() {
				return "거래 리스트.xlsx";
			}
		};
	}
}
