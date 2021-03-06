package kr.or.ddit.cfms.fran.prod.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.prod.service.IFranProdService;
import kr.or.ddit.cfms.fran.prod.vo.OrderListVO;
import kr.or.ddit.cfms.fran.prod.vo.OrderVO;
import kr.or.ddit.cfms.head.inven.service.IHeadInvenService;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.inven.vo.UnitpcListVO;

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
@RequestMapping("/fran/prod")
public class FranProdController {
	private static final Logger logger = LoggerFactory.getLogger(FranProdController.class);
	
	@Inject
	private IFranProdService service;
	
	@Inject
	private IHeadInvenService headInvenService;
	
	@GetMapping
	public String prodList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, Model model
			, HttpSession session
			) {
		PagingVO<HeadInvenVO> pagingVO = listForAjax(currentPage, selectorRow, searchType, searchWord, session);
		
		model.addAttribute("headPagingVO", pagingVO);
		return "/fran/prod/prodList";
	}
	
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<HeadInvenVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
//		, @ModelAttribute("searchVO") SearchVO searchVO
		, HttpSession session
	) {
		
		/** 파라미터 조회 - 세션에 담긴 가맹본부 코드 저장 */
		String headCode = (String) session.getAttribute("code");
		if(headCode!=null) { headCode = headCode.substring(0,5); }
		
		/** 결과자료 객체생성 */ 
		PagingVO<HeadInvenVO> pagingVO = new PagingVO<>(5, 10, currentPage); /** 보낼자료 */ 
		pagingVO.addSearchMap("searchType", searchType); /** 검색조건 */
		pagingVO.addSearchMap("searchWord", searchWord); /** 검색타입 */
		pagingVO.setDetailSearch(new HeadInvenVO(headCode));
		
		/** 파라미터 검증 */
		
		/** 서비스 데이터 구성 */ 
		
		/** 서비스 요청 */ 
		service.selectMainInfo(pagingVO);
		
		/** 결과 전송 */
		return pagingVO;
	}
	
	
//	@GetMapping("/detail")
//	public String prodDetail(
//			@RequestParam(value = "what", required = true) String prod_code
//			, Model model
//			, HttpSession session
//			) {
//		HeadInvenVO headInven = new HeadInvenVO();
//		String head_code = (String) session.getAttribute("code");
//		headInven.setHead_code(head_code.substring(0,5));
//		headInven.setProd_code(prod_code);
//		headInven = headInvenService.retrieveHeadInven(headInven);
//		ImageBase64Util imageBase64Util = new ImageBase64Util();
//		imageBase64Util.imageBase(headInven.getAttachfileList());
//		
//		model.addAttribute("inven", headInven);
//		return "/fran/prod/prodDetail";
//		
//	}
//	
//	@GetMapping("/form")
//	public String prodForm() {
//		return "/fran/prod/prodForm";
//		
//	}
	
	@PostMapping
	public String prodinsert(
			@ModelAttribute("orderListVO") OrderListVO orderListVO
			, Model model
			, HttpSession session
			) {
		String view = null;
		OrderVO orderVO = new OrderVO();
		orderVO.setFran_code((String) session.getAttribute("code"));
		if(orderVO != null) {
			orderListVO.setOrderVO(orderVO);
		}
		ServiceResult result = service.insertOrder(orderListVO);
		
		view = "redirect:/fran/trade";
//		if(ServiceResult.OK.equals(result)) {
//		}else {
//			view = "/fran/prod";
//			service.selectProdList(orderListVO);
//			model.addAttribute("orderListVO", orderListVO);
//		}
		
		return view;
		
	}
	@GetMapping(value = "/unitpclist", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<UnitpcListVO> unitpclist(
			@RequestParam("prod_code") String prod_code
			) {
		logger.info("단가 변동 볼꺼다 prod_code == {}", prod_code);
		List<UnitpcListVO> unitpcListVO = headInvenService.retrieveUnitpcList(prod_code);
		logger.info("가져온 값 {}", unitpcListVO);
		return unitpcListVO;
	}
}
