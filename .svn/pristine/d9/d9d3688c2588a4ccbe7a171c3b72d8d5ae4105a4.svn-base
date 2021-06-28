package kr.or.ddit.cfms.head.inven.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;
import kr.or.ddit.cfms.head.inven.service.IHeadInvenService;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenListVO;
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
 * 2021. 5. 19      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/inven")
public class HeadInvenController{
	private static final Logger logger = LoggerFactory.getLogger(HeadInvenController.class);
	
	@Inject
	private IHeadInvenService service;
	
	@GetMapping
	public String invenList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
			, @RequestParam(value = "searchMax", required = false) String searchMax
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, Model model
			, HttpSession session
			) {
		PagingVO<HeadInvenVO> pagingVO = listForAjax(currentPage, selectorRow, searchType, searchWord, searchWord, session);
		
		model.addAttribute("pagingVO", pagingVO);
		return "/head/inven/invenList";
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<HeadInvenVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
		, @RequestParam(value = "searchMax", required = false) String searchMax
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
//		, @ModelAttribute("searchVO") SearchVO searchVO
		, HttpSession session
	) {
		PagingVO<HeadInvenVO> pagingVO = new PagingVO<>(selectorRow, 10);
		pagingVO.setCurrentPage(currentPage);
		// 검색 조건
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("searchMax", searchMax);
		pagingVO.setSearchMap(searchMap);
		
//		pagingVO.setSimpleSearch(searchVO);
		HeadInvenVO detailSearch = new HeadInvenVO();
		
		detailSearch.setHead_code((String) session.getAttribute("code"));
		pagingVO.setDetailSearch(detailSearch);
		int totalRecord = service.retrieveHeadInvenCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<HeadInvenVO> invenList = 
				service.retrieveHeadInvenList(pagingVO);
		logger.info("contoller");
		pagingVO.setDataList(invenList);
		for(HeadInvenVO headInven : pagingVO.getDataList()) {
			imageBase(headInven);
		}
		return pagingVO;
	}
	
	public void comCode(Model model) {
		ComCodeGrpVO pccCode = service.retrieveCodeList("PCC");
		ComCodeGrpVO pucCode = service.retrieveCodeList("PUC");
		model.addAttribute("pucCode", pucCode);
		model.addAttribute("pccCode", pccCode);
	}
	
	@GetMapping("/detail")
	public String invenDetail(
			@RequestParam(value = "what", required = true) String prod_code
			, Model model
			, HttpSession session
			) {
		
		HeadInvenVO headInven = new HeadInvenVO();
		headInven.setHead_code((String) session.getAttribute("code"));
		headInven.setProd_code(prod_code);
		headInven = service.retrieveHeadInven(headInven);
		imageBase(headInven);
		
		model.addAttribute("inven", headInven);
		return "/head/inven/invenDetail";
		
	}
	
	private void imageBase(HeadInvenVO headInven) {
		InputStream imageStream;
		if(headInven.getAttachfileList().size() > 0 || !headInven.getAttachfileList().isEmpty()) {
			
			for(AttachfileVO attach : headInven.getAttachfileList()) {
				try {
					// FileInputStream으로 파일을 불러온다
					imageStream = new FileInputStream(attach.getFile_path()+"/"+attach.getSave_filenm());
					// IOUtils.toByteArray 바이트배열로 바꿔서 저장
					byte[] imageBtyeArray = IOUtils.toByteArray(imageStream);
					imageStream.close();
					// 이진데이터로 바꾼다
					// 바이트배열을 Base64.encodeBase64형식에 맞춰서 인코딩 하는 작업
					byte[] encodeBase64 = Base64.encodeBase64(imageBtyeArray);
					// 인코딩 된 데이터를 보내준다.
					String base64DataString = new String(encodeBase64, "UTF-8");
					// file_img저장될때는 사용되는게 아니고 이미지를 표현할떄 사용된다.
					attach.setFile_img(base64DataString);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			
		}
	}
	
	@GetMapping("/form")
	public String invenForm(
			Model model
			,HttpSession session
			) {
		comCode(model);
		HeadquartersVO head = new HeadquartersVO();
		head.setHead_code((String) session.getAttribute("code"));
		model.addAttribute("head", head);
		return "/head/inven/invenForm";
		
	}
	
	@PostMapping
	public String insert(
//			@ModelAttribute("inven") HeadInvenVO headInven
			@ModelAttribute("inven") HeadInvenListVO headInvenList
			, Model model
			) {
		logger.info("{}", headInvenList);
		String view = null;
		String message = null;
		ServiceResult result = service.createInven(headInvenList);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/head/inven";
		}else {
			message = "서버 오류";
			view = "head/inven/form";
		}
		
		model.addAttribute("message", message);
		
		return view;
		
	}
	
	@PostMapping("/modify")
	public String updateForm(
			@RequestParam("prod_code") String prod_code
			, Model model
			) {
		String[] prod_codes = prod_code.split(",");
		List<HeadInvenVO> headInvenList = service.retrieveHeadProd(prod_codes);
		logger.info("{}", headInvenList);
		String update = "update";
		comCode(model);
		model.addAttribute("headInvenList", headInvenList);
		model.addAttribute("update", update);
		return "/head/inven/invenForm";
	}
	
	@PostMapping("/update")
	public String update(
			@ModelAttribute("inven") HeadInvenListVO headInvenList
			, Model model
			, RedirectAttributes redirectAttributes
			) {
		logger.info("modify=={}", headInvenList);
		int success = service.modifyInven(headInvenList);
		redirectAttributes.addFlashAttribute("success", success);
		return "redirect:/head/inven";
		
	}
	
	@DeleteMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String delete(
			@RequestParam("prod_codes[]") String[] prod_codes
			, Model model
			) {
		
		ServiceResult result = service.removeInven(prod_codes);
		
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "OK";
		}else {
			view = "FAIL";
		}
		logger.info("{}", view);
		return view;
	}
	
	@GetMapping(value = "/unitpclist", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<UnitpcListVO> unitpclist(
			@RequestParam("prod_code") String prod_code
			) {
		logger.info("단가 변동 볼꺼다 prod_code == {}", prod_code);
		List<UnitpcListVO> unitpcListVO = service.retrieveUnitpcList(prod_code);
		logger.info("가져온 값 {}", unitpcListVO);
		return unitpcListVO;
	}
}