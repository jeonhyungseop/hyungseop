package kr.or.ddit.cfms.head.goods.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.commons.vo.SearchVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;
import kr.or.ddit.cfms.head.goods.service.IHeadGoodsService;
import kr.or.ddit.cfms.head.goods.vo.HeadGoodsVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenListVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;

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
@RequestMapping("/head/goods")
public class HeadGoodsController {
	private static final Logger logger = LoggerFactory.getLogger(HeadGoodsController.class);
	
	@Inject
	private IHeadGoodsService service;
	
	//공통코드 
	public void comCode(Model model) {
		ComCodeGrpVO gccCode = service.retrieveCodeList("GCC");
		model.addAttribute("gccCode", gccCode);
	}

	@GetMapping
	public String goodsList(
			@ModelAttribute SearchVO searchVO
			, Model model
			, HttpSession session
			) {
		PagingVO<HeadGoodsVO> pagingVO = listForAjax(searchVO, session);
		
		comCode(model);
		model.addAttribute("pagingVO",pagingVO);
		return "/head/goods/goodsList";
		
	}
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<HeadGoodsVO> listForAjax(
			@ModelAttribute SearchVO searchVO
			, HttpSession session
			) {
		
		/** 파라미터 조회 - 세션에 담긴 가맹본부 코드 저장 */
		String headCode = (String) session.getAttribute("code");
		 
		/** 결과자료 객체생성 */ 
		PagingVO<HeadGoodsVO> pagingVO = new PagingVO<>(searchVO.getScreenSize(), 10, searchVO.getPage(), searchVO); /** 보낼자료 */ 
//		pagingVO.addSearchMap("searchWord", searchVO.getSearchWord()); 
//		pagingVO.addSearchMap("searchCategory", searchVO.getSearchCategory());
		logger.info("{}", searchVO);
		pagingVO.setHead_code(headCode.substring(0,5));
		
		/** 파라미터 검증 */
		
		/** 서비스 데이터 구성 */ 
		
		/** 서비스 요청 */ 
		service.selectMainInfo(pagingVO);
		
		/** 결과 전송 */
		return pagingVO;
	}
	
	@GetMapping("/detail")
	public String goodsDetail(
			@RequestParam("goodsCode") String goods_code
			, Model model
			, HttpSession session
			) {
		HeadGoodsVO headGoods = new HeadGoodsVO();
		logger.info("전형섭{}", headGoods.getAttachfileList());
		headGoods.setHead_code((String) session.getAttribute("code"));
		headGoods.setGoods_code(goods_code);
		
		headGoods = service.retrieveHeadGoods(headGoods);
		
		logger.info("{}", headGoods);
		
		model.addAttribute("headGoods", headGoods);
		
		return "/head/goods/goodsDetail";
		
	}
	
	@GetMapping("/form")
	public String goodsForm(	
			Model model
			,HttpSession session,
			@ModelAttribute("headgoodsvo")HeadGoodsVO headgoodsvo
			) {
		logger.info("=========== model {}=======", model);
		comCode(model);
		
		headgoodsvo.setHead_code((String) session.getAttribute("code"));
		model.addAttribute("headgoodsvo", headgoodsvo);		
		return "/head/goods/goodsForm";
		
	}
	
	@PostMapping
	public String insert(
			@ModelAttribute("headgoodsvo") HeadGoodsVO headgoodsvo
			, Model model
			) {
		logger.info("파일리스트{}", headgoodsvo.getAttachfileList());
		logger.info("인설트헤드굳스{}", headgoodsvo);
		String view = null;
		String message = null;
		ServiceResult result = service.insertGoods(headgoodsvo);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/head/goods";
		}else {
			message = "서버 오류";
			view = "head/head/goods/goodsForm";
		}
		
		model.addAttribute("message", message);
		
		return view;
		
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	@ResponseBody
	public String delete(
			@RequestParam("goods_codes[]") String[] goods_codes
			, Model model
			) {
		
		ServiceResult result = service.deleteGoods(goods_codes);;
		
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "OK";
		}else {
			view = "FAIL";
		}
		logger.info("{}", view);
		return view;
	}
	
	@PostMapping("/modify")
	public String updateForm(
			@RequestParam("goods_code") String goods_code
			, Model model
			) {
		String[] goods_codess = goods_code.split(",");
		List<HeadGoodsVO> headGoodsList = service.retrieveHeadGoods(goods_codess);
		logger.info("headGoodsList{}", headGoodsList);
		String goodsupdate = "goodsupdate";
		
		comCode(model);
		model.addAttribute("headGoodsList", headGoodsList);
		model.addAttribute("goodsupdate", goodsupdate);
	
		return "/head/goods/goodsForm";
	}
	
	@PostMapping("/update")
	public String update(
			@ModelAttribute("HeadGoodsList") HeadGoodsVO HeadGoodsList
			, Model model
			, RedirectAttributes redirectAttributes
			) {
		logger.info("modify=={}", HeadGoodsList);
		int success = service.modifyGoods(HeadGoodsList);
		redirectAttributes.addFlashAttribute("success", success);
		return "redirect:/head/goods";
		
	}
	
	
	
	@DeleteMapping
	public String delete() {
		return null;
		
	}
}
