package kr.or.ddit.cfms.head.limit.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.deposit.controller.HeadDepositController;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.limit.service.IHeadLimitService;
import kr.or.ddit.cfms.head.limit.vo.LimitSearchVO;
import kr.or.ddit.cfms.head.limit.vo.OrdersVO;
import kr.or.ddit.cfms.head.limit.vo.OrdlistVO;
import kr.or.ddit.cfms.head.limit.vo.OutVO;

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
@RequestMapping("/head/limit")
public class HeadLimitController {
	private static final Logger logger = LoggerFactory.getLogger(HeadDepositController.class);
	
	@Inject
	private IHeadLimitService service;
	
	@PostConstruct
	public void init() {
		logger.info("{} 초기화, {} 주입됨.", getClass().getSimpleName(), service.getClass().getSimpleName());
	}
	
	//리스트 조회
	@GetMapping
	public String limitList(
			@ModelAttribute LimitSearchVO limitSearchVO,
			HttpSession session,
			Model model
			) {
		
		PagingVO<OrdersVO> pagingVO = listForAjax(limitSearchVO, session);
		
		comCode(model);
		model.addAttribute("pagingVO", pagingVO);
		
		
		return "/head/limit/limitList";
	}
	
	//리스트 비동기 조회
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<OrdersVO> listForAjax(
			@ModelAttribute LimitSearchVO limitSearchVO,
			HttpSession session
			){
		
		/** 파라미터 조회 */
		String headCode = (String) session.getAttribute("code");
		/** 결과자료 객체 생성 
		 * 	new PagingVO<>(screenSize, blockSize, cuurentSize, searchMapVO)
		 *  검색 조건을 VO에 담아서 넣으면 자동으로 searchMap에 들어감 
		 * */
		PagingVO<OrdersVO> pagingVO = new PagingVO<>(limitSearchVO.getScreenSize() , 10, limitSearchVO.getPage(), limitSearchVO);
		pagingVO.setDetailSearch(new OrdersVO(headCode));
		
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
	
	//상세 조회
	@GetMapping("/detail")
	public String limitDetail(
			@RequestParam("what") String orderNo,
			Model model
			) {
		/** 결과자료 객체 생성*/
		OrdersVO ordersVO = new OrdersVO(); 
		
		/** 서비스 요청 */
		ordersVO = service.retriveHeadLimitDetail(orderNo);
		
		/** 결과 전송 */
		model.addAttribute("ordersVO", ordersVO);
		
		return "/head/limit/limitDetail";
		
	}
	

	
	
	//발주 승인 및 취소 업데이트
	@RequestMapping(value = "/order")
	public String orderOk(
			@RequestParam(value = "orderNO") String orderNO,
			@RequestParam(value = "code") String code,
			@RequestParam(value = "reason", required = false) String reason
			) {
		
		Map<String, String>orderMap = new HashMap<>();
		orderMap.put("orderNO", orderNO);
		orderMap.put("code", code);
		orderMap.put("reason", reason);
		
		String msg = null;
		
		int cnt = service.modifyOrder(orderMap);
	
		
		return "redirect:/head/limit/detail?what="+orderNO;
	}
	
	//출고 취소 업데이트
	@RequestMapping(value = "/out")
	public String outCancle(
			@RequestParam(value = "orderNO") String orderNO,
			@RequestParam(value = "outCode") String outCode,
			@RequestParam(value = "code") String code,
			@RequestParam(value = "reason", required = false) String reason
			) {
		
		Map<String, String>outMap = new HashMap<>();
		outMap.put("outCode", outCode);
		outMap.put("code", code);
		outMap.put("reason", reason);
		
		String msg = null;
		
		int cnt = service.modifyOut(outMap);
	
		
		return "redirect:/head/limit/detail?what="+orderNO;
	}
	
	//출고지시서 작성 폼 이동
	@GetMapping("/form")
	public String limitForm(
			@RequestParam("what") String orderNo,
			Model model
			) {
		/** 결과자료 객체 생성*/
		PagingVO<OrdersVO> pagingVO = new PagingVO<>(10,5,1); 
		
		/** 서비스 요청 */
		service.selectOutlist(pagingVO, orderNo);
		
		/** 결과 전송 */
		model.addAttribute("pagingVO", pagingVO);
		
		
		return "/head/limit/limitForm";
	}
	
	//출고지시서 작성 데이터 생성 및 업데이트
	@PostMapping("/form")
	public String insert(
			@ModelAttribute OutVO outVO,
			RedirectAttributes redir
			) {
		
		int cnt = service.insertOut(outVO);
		if(cnt > 0) {
			redir.addFlashAttribute("insertMsg", "출고지시서가 정상적으로 등록되었습니다.");
		}else {
			redir.addFlashAttribute("insertMsg", "출고지시서 등록에 실패 했습니다. 잠시 후 다시 시도 해 주세요.");
		}
		
		return "redirect:/head/limit";
	}
	
	//출고 완료
	@GetMapping("/outCompletion")
	public String limitOut(
			@RequestParam("what") String orderNO,
			RedirectAttributes redir
			) {
		/** 파라미터 조회 */
		logger.info("controller 들어옴");
		/** 결과자료 객체 생성*/
		int cnt = 0;
		
		/** 파라미터 검증 */
		OrdersVO ordersVO = new OrdersVO();
		ordersVO = service.retriveHeadLimitDetail(orderNO);
		logger.info("파라미터 검증을 위한 데이터 조회  out_code : {}", ordersVO.getOut_code());
		
		if(ordersVO.getOut_code() == null) {
			redir.addFlashAttribute("outMsg", "잘못된 요청입니다.");
			return "/head/limit/detail?what=" + orderNO;
		}
		
		/** 서비스 데이터 구성 */
		
		/** 서비스 요청 */
		cnt = service.outItems(ordersVO);
		logger.info("outItems 나옴");
		/** 결과 전송 */
		if(cnt > 0) {
			redir.addFlashAttribute("outMsg", "출고가 정상적으로 완료되었습니다.");
		}else {
			redir.addFlashAttribute("outMsg", "출고완료가 비정상적으로 작동 했습니다. 잠시 후 다시 시도 해 주세요.");
		}
		
		return "redirect:/head/limit/detail?what=" + orderNO;
	}
	
}
