package kr.or.ddit.cfms.fran.pos.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cfms.fran.pos.service.IPosMenuService;
import kr.or.ddit.cfms.fran.pos.vo.FranGoodsVO;

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
 * 2021. 6. 15      이진수       구축
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fran/posmenu")
public class PosMenuController {
	private static final Logger logger = LoggerFactory.getLogger(PosMenuController.class);
	
	@Inject
	private IPosMenuService service;
	
	@GetMapping("/start")
	public String posStart() {
		return "/fran/pos/posStart";
		
	}
	
	
	@GetMapping
	public String posMenuList(
			Model model
			, HttpSession session
			) {
		String fran_code = (String) session.getAttribute("code");
		String head_code = fran_code.substring(0, 5);
		
		FranGoodsVO franGoodsVO = new FranGoodsVO();
		franGoodsVO.setFran_code(fran_code);
		franGoodsVO.setHead_code(head_code);
		
		
		List<FranGoodsVO> franGoodsList = service.retrieveFranGoodsList(franGoodsVO);
		List<FranGoodsVO> headGoodsList = service.retrieveHeadGoodsList(franGoodsVO);
		
//		logger.info("{}", franGoodsList);
		logger.info("{}", headGoodsList);
		
		model.addAttribute("franGoodsList", franGoodsList);
		model.addAttribute("headGoodsList", headGoodsList);
		
		return "/fran/pos/posmenuList";
		
	}
	
	
	
	@GetMapping(value = "/detail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public FranGoodsVO posMenuDetail(
			@RequestParam("goods_code") String goods_code
			, HttpSession session
			) {
		logger.info("{}", goods_code);
		FranGoodsVO franGoodsVO = service.retrieveGoods(goods_code);
		
		return franGoodsVO;
		
	}
	
	@GetMapping("/form")
	public String posMenuForm() {
		return "/fran/pos/posmenuForm";
		
	}
	
	@PostMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int insert(
			@RequestParam("goods_code[]") String[] goods_code
			, HttpSession session
			) {
		FranGoodsVO franGoods = new FranGoodsVO();
		franGoods.setGoods_array(goods_code);
		franGoods.setFran_code((String) session.getAttribute("code"));
		int cnt = service.insertGoods(franGoods);
		
		return cnt;
		
	}
	
	@GetMapping("/modify")
	public String updateForm() {
		return "/fran/pos/posmenuForm";
		
	}
	
	@PutMapping
	public String update() {
		return null;
		
	}
	
	@DeleteMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int delete(
			@RequestParam("goods_code[]") String[] goods_code
			, HttpSession session
			) {
		FranGoodsVO franGoods = new FranGoodsVO();
		franGoods.setGoods_array(goods_code);
		franGoods.setFran_code((String) session.getAttribute("code"));
		int cnt = service.deleteGoods(franGoods);
		
		return cnt;
		
	}
}
