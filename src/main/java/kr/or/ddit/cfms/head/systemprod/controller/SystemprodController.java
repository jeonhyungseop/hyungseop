package kr.or.ddit.cfms.head.systemprod.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.admin.headmanage.vo.PayListVO;
import kr.or.ddit.cfms.admin.headmanage.vo.systempaymentVO;
import kr.or.ddit.cfms.admin.prod.vo.AdminProdVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.deposit.vo.HeadsmnVO;
import kr.or.ddit.cfms.head.systemprod.service.IHeadSystemprodService;
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
 * 2021. 6. 02      진예은          상품변경
 * 2021. 6. 03      진예은          예치금 조회
 * 2021. 6. 03      진예은          예치금 수정
 * 2021. 6. 04      진예은          변경 - 상품결제
 * 2021. 6. 04    	진예은          정기결제	
 * 2021. 6. 11      진예은          날짜형태변경
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/systemprod")
public class SystemprodController {

	private final Logger logger = LoggerFactory.getLogger(SystemprodController.class);
	
	@Inject
	private IHeadSystemprodService service;
	
	@Inject
	private ILoginService loginservice;
	
	@GetMapping
	public String systemprodList(
			Model model
			) {
		
		List<AdminProdVO> systemprodList = service.retrieveSystemprodList();
		model.addAttribute("systemprodList", systemprodList);
		
		
		return "/head/systemprod/systemprodpay";
		
	}
	
	@GetMapping("/info")
	public String systemprodInfo(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			HttpSession session,
			Model model
			) {
		
		String hdCode = (String) session.getAttribute("code");
		PayListVO usePay = service.retrieveUseProd(hdCode);
		model.addAttribute("usePay", usePay);
		
		PagingVO<PayListVO> pagingVO = listForAjax(session, currentPage);
		model.addAttribute("pagingVO", pagingVO);
		
		return "/head/systemprod/systemprodList";
		
	}
	@RequestMapping(value = "/info" ,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<PayListVO> listForAjax(
			HttpSession session,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			){
		String hdCode = (String) session.getAttribute("code");
		PagingVO<PayListVO> pagingVO = new PagingVO<>(5, 10);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setHead_code(hdCode);
		
		int totalRecord = service.retrieveMaxPay(hdCode);
		pagingVO.setTotalRecord(totalRecord);
		
		List<PayListVO> payList = service.retrievePayList(pagingVO);
		
		for(PayListVO payListVO : payList) {
			String syspay_pay_time = payListVO.getSyspay_pay_time();
			String syspay_end_time = payListVO.getSyspay_end_time();
			
			if(syspay_pay_time.length() == 8) {
				payListVO.setSyspay_pay_time(syspay_pay_time.substring(0,4)+"-"+syspay_pay_time.substring(4, 6) + "-" + syspay_pay_time.substring(6, 8));
			
			}else {
				payListVO.setSyspay_pay_time(syspay_pay_time.substring(0,4)+"-"+syspay_pay_time.substring(5, 7) + "-" + syspay_pay_time.substring(8, 10));
			}
			
			if(syspay_pay_time.length() == 8) {
				payListVO.setSyspay_end_time(syspay_end_time.substring(0,4)+"-"+syspay_end_time.substring(4, 6) + "-" + syspay_end_time.substring(6, 8));
				
			}else {
				payListVO.setSyspay_end_time(syspay_end_time.substring(0,4)+"-"+syspay_end_time.substring(5, 7) + "-" + syspay_end_time.substring(8, 10));
			}
			
		}
		
		pagingVO.setDataList(payList);
		
		return pagingVO;
	}
	
	
	@RequestMapping(value = "/regular" ,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<PayListVO> RegularlistForAjax(
			HttpSession session,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			){
		
		String hdCode = (String) session.getAttribute("code"); 
		PagingVO<PayListVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setHead_code(hdCode);
		
		int totalRecord = service.retrieveMaxRegular(hdCode);
		pagingVO.setTotalRecord(totalRecord);
		
		List<PayListVO> regularList = service.retrieveRegularList(pagingVO);
		pagingVO.setDataList(regularList);

		
		return pagingVO;
	}
	
	
	
	
	
	@GetMapping("/regular")
	public String systemprodRegular(
			HttpSession session,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			Model model
			) {
		
		String hdCode = (String) session.getAttribute("code");
		PayListVO useRegular = service.retrieveUseRegular(hdCode);
		model.addAttribute("useRegular", useRegular);
		
		PagingVO<PayListVO> pagingVO = RegularlistForAjax(session, currentPage);
		model.addAttribute("pagingVO", pagingVO);
		
		
		return "/head/systemprod/systemregularprod";
		
	}
	
	
	@GetMapping("/detail")
	public String systemprodDetail() {
		return "/head/systemprod/systemprodDetail";
		
	}
	
	@GetMapping("/form")
	public String systemprodForm() {
		return "/head/systemprod/systemprodForm";
		
	}
	
	@ResponseBody
	@GetMapping("/comfirm")
	public String prodComfirm(
			HttpSession session
			) {
		
		String hdCode = (String) session.getAttribute("code");
		PayListVO useProd = service.retrieveUseProd(hdCode);
		
		String message = null; 
		if(useProd == null) {
			message = "ok";
		}
		
		return message;
	}
	
	//상품결제
	@PostMapping
	@ResponseBody
	public String insert(
			@RequestParam("hiddenCode") String payCode,
			@RequestParam("pay_method") String pay_method,
			@RequestParam("repay") String repay,
			@RequestParam(value="use_PaySeq", required = false) String use_PaySeq,
 			HttpSession session
			) {
		
		String view = null;
		String hdCode = (String) session.getAttribute("code");
		
		PayListVO useProd = service.retrieveUseProd(hdCode);
		
			
			PayListVO payListVO = new PayListVO();
			payListVO.setHead_code(hdCode);
			payListVO.setSyspay_code(payCode);
			payListVO.setPay_se_code(pay_method);
			payListVO.setSyspay_repay_at(repay);
			
			
			if(use_PaySeq != null) {
				PayListVO usedVO = new PayListVO();
				usedVO.setPay_seq(Integer.parseInt(use_PaySeq));
				usedVO.setHead_code(hdCode);
				payListVO.setUsedpayVO(usedVO);
			}
			
			ServiceResult result = service.createHeadSystemprod(payListVO);
			if(ServiceResult.OK.equals(result)) {
				view = "/head/systemprod/systemprodpay";
			}else {
				view = "/head/systemprod/systemprodpay";
			}
			
		return view;
		
	}
	
	@GetMapping("/modify")
	public String updateForm(
			Model model,
			HttpSession session
			) {
		
		String hdCode = (String) session.getAttribute("code");
		List<systempaymentVO> prodList = service.retrieveupdateList(hdCode);
		model.addAttribute("prodList", prodList);
		
		PayListVO usePay = service.retrieveUseProd(hdCode);
		model.addAttribute("usePay",usePay);
		
		HeadsmnVO headsmnVO = service.retrieveHeadsmnPay();
		model.addAttribute("headsmnVO", headsmnVO);
		
		return "/head/systemprod/systemprodForm";
		
	}
	
	//@PutMapping(value="/modify")
	@RequestMapping(value="/modify", method = RequestMethod.PUT , produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult update(
			@RequestParam("syspay_code") String code,
			@RequestParam("pay_se_code") String pay_se_code,
			@RequestParam("repay") String repay,
			@RequestParam("use_PaySeq") String use_PaySeq,
			@RequestParam("buyProdPrice") String buyProdPrice,
			@RequestParam("memo") String memo,
			HttpSession session
			) {
		String view = null;
		
		//변경된 상품 insert
		String hdCode = (String) session.getAttribute("code");
		PayListVO paylistVO = new PayListVO();
		paylistVO.setSyspay_code(code);
		paylistVO.setPay_se_code(pay_se_code);
		paylistVO.setHead_code(hdCode);
		paylistVO.setSyspay_repay_at(repay);
		
		
		//예치금 출금
		HeadsmnVO headsmnVO = new HeadsmnVO();
		headsmnVO.setHead_code(hdCode);
		headsmnVO.setDsmn_mvmoney(Integer.parseInt(buyProdPrice));
		headsmnVO.setDsmn_rcppay_se("B0001");
		headsmnVO.setMemo(memo);
		paylistVO.setHeadsmnList(headsmnVO);
		
		//사용중이던 상품 해지
		PayListVO usedPayVO = new PayListVO();
		usedPayVO.setPay_seq(Integer.parseInt(use_PaySeq));
		usedPayVO.setHead_code(hdCode);
		paylistVO.setUsedpayVO(usedPayVO);
		
		ServiceResult result = service.createHeadSystemprod(paylistVO);
		if(ServiceResult.OK.equals(result)) {
				view = "redirect:/head/systemprod/modify";
			
		}else {
			view = "redirect:/head/systemprod/modify";
		}
		
		return result;

	}
	
	
	@RequestMapping(value="/delete" , produces = MediaType.TEXT_PLAIN_VALUE, method=RequestMethod.POST)
	@ResponseBody
	public String delete(
			@RequestParam("pwd") String pwd,
			@RequestParam("seq") String seq,
			@RequestParam("pay_price") String pay_price,
			@RequestParam("Memo") String Memo,
			HttpSession session,
			Model model,
			RedirectAttributes redirectAttributes
			) {
		
		String view = null;
		String message = null;
		String hdCode = (String) session.getAttribute("code");
		
		//예치금
		HeadsmnVO headsmnVO = new HeadsmnVO();
		headsmnVO.setHead_code(hdCode);
		headsmnVO.setDsmn_mvmoney(Integer.parseInt(pay_price));
		headsmnVO.setMemo(Memo);
		headsmnVO.setDsmn_rcppay_se("A0001"); // 입금
		headsmnVO.setElctc_mt_code("D0001"); // 환불  
		
		PayListVO paylistVO = new PayListVO();
		paylistVO.setHeadsmnList(headsmnVO);
		paylistVO.setPay_seq(Integer.parseInt(seq));
		paylistVO.setHead_code(hdCode);
		
		
		//비밀번호 검증
		String authid = (String) session.getAttribute("authId");
		UserVO user = new UserVO(authid, pwd);
		
		ServiceResult authResult = loginservice.authenticate(user);
		switch (authResult) {
		
			case OK:
				ServiceResult result = service.removePay(paylistVO);
				 if(ServiceResult.OK.equals(result)) {
					 //session.removeAttribute("message");
					 view = "redirect:/head/systemprod"; 
					 message = "ok";
				 } else {
					 view = "redirect:/head/systemprod"; 
				}
				
				break;
	
				
			case INVALIDPASSWORD:
				view = "redirect:/head/systemprod/info";
				message = "pass";
				break;
		}
		
		
		return message;
		
	}
}
