package kr.or.ddit.cfms.fran.pos.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.pos.service.IPosOrderService;
import kr.or.ddit.cfms.fran.pos.vo.FranGoodsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordlistVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordsalelistsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CustomerorderVO;

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
@RequestMapping("/fran/posorder")
public class PosOrderController {
	private static final Logger logger = LoggerFactory.getLogger(PosOrderController.class);
	
	@Inject
	private IPosOrderService service;
	
	@GetMapping
	public String posOrderList(
			Model model
			, HttpSession session
			) {
		String fran_code = (String) session.getAttribute("code");
		String head_code = fran_code.substring(0, 5);
		String goods_cl_code = "A0001";
		FranGoodsVO franGoodsVO = new FranGoodsVO(head_code, fran_code);
		
//		session.removeAttribute("cordCode");
		List<ComCodeVO> comCodeList = service.retrieveComCodeList(head_code);
		List<FranGoodsVO> franGoodsList = listForAjax(goods_cl_code, session);
		
		
		model.addAttribute("comCodeList", comCodeList);
		model.addAttribute("franGoodsList", franGoodsList);
		return "/fran/pos/posorderList";
		
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<FranGoodsVO> listForAjax(
		@RequestParam(value="searchCatecory", required=false, defaultValue="A0001") String goods_cl_code 
		, HttpSession session
	) {
		/** 파라미터 조회 - 세션에 담긴 가맹본부 코드 저장 */
		String fran_code = (String) session.getAttribute("code");
		String head_code = fran_code.substring(0, 5);
		FranGoodsVO franGoodsVO = new FranGoodsVO(head_code, fran_code);
		franGoodsVO.setGoods_cl_code(goods_cl_code);
		/** 결과자료 객체생성 */
		
		/** 파라미터 검증 */
		
		/** 서비스 데이터 구성 */ 
		
		/** 서비스 요청 */ 
		List<FranGoodsVO> franGoodsList = service.retrieveFranGoodsList(franGoodsVO);
		/** 결과 전송 */
		return franGoodsList;
	}
	
	@RequestMapping(value = "/goodsSearch", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public FranGoodsVO orderListForAjax(
		@RequestParam("goods_code") String goods_code
		, HttpSession session
	) {
		/** 파라미터 조회 - 세션에 담긴 가맹본부 코드 저장 */
		/** 결과자료 객체생성 */
		FranGoodsVO franGoodsVO = new FranGoodsVO();
		franGoodsVO.setGoods_code(goods_code);
		
		/** 파라미터 검증 */
		
		/** 서비스 데이터 구성 */ 
		
		/** 서비스 요청 */
		franGoodsVO = service.retrieveGoods(franGoodsVO);
		/** 결과 전송 */
		return franGoodsVO;
	}
	
	@RequestMapping(value = "/moneypay", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<String> moneyPay(
			@ModelAttribute CustomerorderVO custommerorderVO
			, HttpSession session
			) {
		String fran_code = (String) session.getAttribute("code");
		custommerorderVO.setFran_code(fran_code);
		custommerorderVO.setCord_sttus_code("A0001");
		custommerorderVO.setPay_sttus_code("A0001");
		logger.info("{}",custommerorderVO);
		
		service.createCorder(custommerorderVO);
		
		logger.info("{}",custommerorderVO.getCord_code());
		List<String> goodsCodeList = new ArrayList<>();
		for(CordlistVO cordlistVO : custommerorderVO.getCOrderListVO()) {
			goodsCodeList.add("order"+cordlistVO.getGoods_code());
		};
		goodsCodeList.add("cordCode"+custommerorderVO.getCord_code());
		return goodsCodeList;
	}
	
	@RequestMapping(value = "/orderlist", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<CordsalelistsVO> orderlist(
			HttpSession session
			) {
		String fran_code = (String) session.getAttribute("code");
		CordsalelistsVO cordsalelistsVO = new CordsalelistsVO();
		cordsalelistsVO.setFran_code(fran_code);
		
		List<CordsalelistsVO> cordsaleList = service.retriveFranCordList(cordsalelistsVO);
		return cordsaleList;
	}
	
	@RequestMapping(value = "/detail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<CordlistVO> posOrderDetail(
			@RequestParam("ordpay_no") String ordpay_no
			, HttpSession session
			) {
		String fran_code = (String) session.getAttribute("code");
		CordlistVO cordlistVO = new CordlistVO();
		cordlistVO.setFran_code(fran_code);
		cordlistVO.setOrdpay_no(ordpay_no);
		
		
		/** 파라미터 조회 */
		
		/** 결과자료 객체 생성 */
		List<CordlistVO> cordListVO = new ArrayList<>();
		
		/** 서비스 데이터 구성 */
		
		/** 서비스 요청 */
		cordListVO = service.retriveFranCord(cordlistVO);
		
		/** 결과전송*/
		
		return cordListVO;
	}
	
	@RequestMapping(value = "/cancleRefund", produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String posOrderCancleRefund(
			@RequestParam("ordpay_no") String ordpay_no
			, @RequestParam("pay_sttus_code") String pay_sttus_code
			, HttpSession session
			) {
		String fran_code = (String) session.getAttribute("code");
		CordlistVO cordlistVO = new CordlistVO();
		cordlistVO.setFran_code(fran_code);
		cordlistVO.setOrdpay_no(ordpay_no);
		cordlistVO.setPay_sttus_code(pay_sttus_code);
		
		
		/** 파라미터 조회 */
		
		/** 결과자료 객체 생성 */
		ServiceResult serviceResult = ServiceResult.FAIL;
		/** 서비스 데이터 구성 */
		String result = "fail";
		/** 서비스 요청 */
		serviceResult = service.cancleRefundSale(cordlistVO);
		
		/** 결과전송*/
		if(ServiceResult.OK.equals(serviceResult)) {
			result = "ok";
		}
		return result;
	}
	
	
	@GetMapping("/form")
	public String posOrderForm() {
		return "/fran/pos/posorderForm";
		
	}
	
	@PostMapping
	public String insert() {
		return null;
		
	}
	
	@GetMapping("/modify")
	public String updateForm() {
		return "/fran/pos/posorderForm";
		
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
