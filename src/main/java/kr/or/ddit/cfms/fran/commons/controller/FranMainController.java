package kr.or.ddit.cfms.fran.commons.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.commons.vo.SearchVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.commons.service.IFranMainService;
import kr.or.ddit.cfms.fran.inven.vo.CordClVO;
import kr.or.ddit.cfms.fran.inven.vo.FranInvenVO;
import kr.or.ddit.cfms.head.commons.vo.DashListVO;
import kr.or.ddit.cfms.head.commons.vo.DashVO;
import kr.or.ddit.cfms.head.goods.vo.HeadGoodsVO;


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
 * 2021. 6. 22      진예은          dashboard수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/fran/main")
public class FranMainController {
	Logger logger = LoggerFactory.getLogger(FranMainController.class);

	@Inject
	private IFranMainService service;
	
	@RequestMapping()
	public String main(
			Model model
			){
		
		List<DashVO> dashList = service.selectFranDashOrd();
		model.addAttribute("dashList", dashList);
		
		return "fran/main_franchise";
	}
	
	@RequestMapping("/C0003")
	public String C0003(
			HttpSession session,
			Model model
			){
		/** 파라미터 조회 */
		String authId = (String)session.getAttribute("authId");
		String franCode = (String)session.getAttribute("code");
		
		/** 서비스 데이터 구성 */
		
		/** 서비스 요청 */
	    service.settingDetailDatas(model, franCode);
	    
	    /** 결과 자료 데이터 구성*/

		/** 결과전송*/
		return "fran/dash/C0003";
	}
	
	@RequestMapping("/C0004")
	public String C0004(
			HttpSession session,
			Model model
			){
		
		String franCode = (String) session.getAttribute("code");
		
		service.retriveCordClRateList(franCode, model);
		
		return "fran/dash/C0004";
	}
	
	
	@RequestMapping("/C0005")
	public String B0005(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			HttpSession session,
			@ModelAttribute("board") BoardVO board,
			Model model
			){
		PagingVO<BoardVO> pagingVO = BoardListForAjax(currentPage,session,board);
		model.addAttribute("pagingVO", pagingVO);
		
		return "fran/dash/C0005";
	}
	

	@RequestMapping(value ="/C0005", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<BoardVO> BoardListForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			HttpSession session,
			@ModelAttribute("board") BoardVO board
			){
		
		
		PagingVO<BoardVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);

		String code = (String) session.getAttribute("code");
		pagingVO.setHead_code(code.substring(0, 5));
		
		pagingVO.setDetailSearch(board);
		
		int totalRecord = service.selectBoardCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<BoardVO> boardList = service.retrieveBoardList(pagingVO);
		
		pagingVO.setDataList(boardList);
		
		return pagingVO;
	}

	
	@RequestMapping("/C0006")
	public String C0006(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage
			, @RequestParam(value = "selector", required = false, defaultValue = "10") int selectorRow
			, @RequestParam(value = "searchMax", required = false) String searchMax
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, Model model
			, HttpSession session
			){
		
		PagingVO<FranInvenVO> pagingVO = listForAjax(currentPage, selectorRow, searchType, searchWord, searchWord, session);
		model.addAttribute("pagingVO",pagingVO);
		
		return "fran/dash/C0006";
	}
	
	@RequestMapping(value="/C0006", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<FranInvenVO> listForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value = "selector", required = false, defaultValue = "7") int selectorRow
		, @RequestParam(value = "searchMax", required = false) String searchMax
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
		, HttpSession session
	) {
		PagingVO<FranInvenVO> pagingVO = new PagingVO<>(selectorRow, 5);
		pagingVO.setCurrentPage(currentPage);
		// 검색 조건
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("searchMax", searchMax);
		pagingVO.setSearchMap(searchMap);
		
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
	
	@RequestMapping("/C0007")
	public String B0007(
			HttpSession session,
			Model model
			){
		String franCode = (String) session.getAttribute("code");
		
		double rate = service.retriveTargetRate(franCode);
		model.addAttribute("rate", rate);
		return "fran/dash/C0007";
	}
	
	
	@PostMapping("/changeFranDash")
	public String changeDash(
			@ModelAttribute("dashListVO") DashListVO dashListVO,
			RedirectAttributes redirect
			) {
		
		String view = null;
		
		ServiceResult result = service.updateFranDashOrd(dashListVO);
		view = "redirect:/fran/main";
		
		
		return view;
	}
	
}
