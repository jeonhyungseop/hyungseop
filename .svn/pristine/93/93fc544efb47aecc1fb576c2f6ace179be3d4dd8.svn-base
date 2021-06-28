package kr.or.ddit.cfms.fran.inven.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.inven.service.IFranInvenService;
import kr.or.ddit.cfms.fran.inven.vo.FranInvenListVO;
import kr.or.ddit.cfms.fran.inven.vo.FranInvenVO;
import kr.or.ddit.cfms.head.inven.service.IHeadInvenService;
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
@RequestMapping("/fran/inven")
public class FranInvenController {
	private static final Logger logger = LoggerFactory.getLogger(FranInvenController.class);
	
	@Inject
	private IFranInvenService service;
	
	@Inject
	private IHeadInvenService headService;
	
	@GetMapping
	public String invenList(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
			, @RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
			, @RequestParam(value = "searchMax", required = false) String searchMax
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, Model model
			, HttpSession session
			) {
		PagingVO<FranInvenVO> pagingVO = listForAjax(currentPage, selectorRow, searchType, searchWord, searchWord, session);
		
		model.addAttribute("pagingVO", pagingVO);
		return "/fran/inven/invenList";
		
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<FranInvenVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
		, @RequestParam(value = "searchMax", required = false) String searchMax
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
//		, @ModelAttribute("searchVO") SearchVO searchVO
		, HttpSession session
	) {
		PagingVO<FranInvenVO> pagingVO = new PagingVO<>(selectorRow, 10);
		pagingVO.setCurrentPage(currentPage);
		// 검색 조건
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("searchMax", searchMax);
		pagingVO.setSearchMap(searchMap);
		
//		pagingVO.setSimpleSearch(searchVO);
		FranInvenVO detailSearch = new FranInvenVO();
		detailSearch.setFran_code((String) session.getAttribute("code"));
		pagingVO.setDetailSearch(detailSearch);
		int totalRecord = service.retrieveFranInvenCount(pagingVO); 
		pagingVO.setTotalRecord(totalRecord);
		
		List<FranInvenVO> invenList = 
				service.retrieveFranInvenList(pagingVO);
		logger.info("contoller");
		pagingVO.setDataList(invenList);
		for(FranInvenVO franInven : pagingVO.getDataList()) {
			imageBase(franInven);
		}
		return pagingVO;
	}
	
	@GetMapping("/detail")
	public String invenDetail(
			@RequestParam(value = "what", required = true) String prod_code
			, Model model
			, HttpSession session
			) {
		FranInvenVO franInven = new FranInvenVO();
		franInven.setFran_code((String) session.getAttribute("code"));
		franInven.setProd_code(prod_code);
		franInven = service.retrieveFranInven(franInven);
		imageBase(franInven);
		model.addAttribute("inven", franInven);
		return "/fran/inven/invenDetail";
		
	}
	
	private void imageBase(FranInvenVO franInven) {
		InputStream imageStream;
		if(franInven.getAttachfileList().size() > 0 || !franInven.getAttachfileList().isEmpty()) {
			
			for(AttachfileVO attach : franInven.getAttachfileList()) {
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
	
//	@GetMapping("/form")
//	public String invenForm(
//			Model model
//			) {
//		FranInvenVO franInven = new FranInvenVO();
//		franInven.setFran_code("HTC0100001");
//		String head_code = franInven.getFran_code().substring(0,5);
//		
//		return "/fran/inven/invenForm";
//		
//	}
	
	@PostMapping
	public String insert() {
		return null;
		
	}
	
	
	@PostMapping("/modify")
	public String updateForm(
			@RequestParam("prod_code") String prod_code
			, Model model
			,HttpSession session
			) {
		
		String[] prod_codes	= prod_code.split(",");
		FranInvenVO franInvenVO = new FranInvenVO();
		franInvenVO.setUpdate_prod_codes(prod_codes);
		franInvenVO.setFran_code((String) session.getAttribute("code"));
		
		List<FranInvenVO> franInvenList = service.retrieveFranProdList(franInvenVO);
		for(FranInvenVO franInven : franInvenList) {
			imageBase(franInven);
		}
		model.addAttribute("franInvenList", franInvenList);
		return "/fran/inven/invenForm";
	}
	
	@PutMapping
	public String updaet(
			@ModelAttribute("inven") FranInvenListVO franInvenListVO
			, RedirectAttributes redirectAttributes
			) {
		int cnt = service.modifyFranInven(franInvenListVO);
		redirectAttributes.addFlashAttribute("cnt", cnt);
		return "redirect:/fran/inven";
	}
	@DeleteMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String delete(
			@RequestParam("prod_codes[]") String[] prod_codes
			, Model model
			, HttpSession session
			) {
		logger.info("{}", prod_codes);
		String view = null;
		FranInvenVO franInvenVO = new FranInvenVO();
		franInvenVO.setFran_code((String) session.getAttribute("code"));
		franInvenVO.setDel_prod_codes(prod_codes);
		ServiceResult result = service.removeFranInven(franInvenVO);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/fran/inven";
		}else {
			view = "fran/inven/invenList";
		}
		return view;
	}
	@GetMapping(value = "/unitpclist", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<UnitpcListVO> unitpclist(
			@RequestParam("prod_code") String prod_code
			) {
		logger.info("단가 변동 볼꺼다 prod_code == {}", prod_code);
		List<UnitpcListVO> unitpcListVO = headService.retrieveUnitpcList(prod_code);
		logger.info("가져온 값 {}", unitpcListVO);
		return unitpcListVO;
	}
}
