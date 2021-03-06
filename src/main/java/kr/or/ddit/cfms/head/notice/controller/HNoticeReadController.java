package kr.or.ddit.cfms.head.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.notice.service.IHeadNoticeService;

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
 * 2021. 5.25      전형섭              응
 * 2021. 5.25      전형섭              가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/head/notice")
public class HNoticeReadController {
	 @Inject
	 private IHeadNoticeService service;
		@Inject
		private WebApplicationContext container;
		private ServletContext application;
		@PostConstruct
		public void init() {
			application = container.getServletContext();
		}

	@GetMapping
	public String noticeList(@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, @RequestParam(value="minDate", required=false) String minDate
			, @RequestParam(value="maxDate", required=false) String maxDate,
			HttpSession session,
			@ModelAttribute("board") BoardVO board,
			 Model model
			 ) {
		PagingVO<BoardVO> pagingVO = listForAjax(currentPage, searchType, searchWord,minDate,maxDate,session,board);
		model.addAttribute("pagingVO", pagingVO);
		
		return "/head/notice/noticeList";
		
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<BoardVO> listForAjax(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, @RequestParam(value="minDate", required=false) String minDate
			, @RequestParam(value="maxDate", required=false) String maxDate	
			, HttpSession session
			, @ModelAttribute("board") BoardVO board
			){
		
		
		PagingVO<BoardVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		// 검색 조건
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("minDate", minDate);
		searchMap.put("maxDate", maxDate);
		pagingVO.setSearchMap(searchMap);
		pagingVO.setHead_code((String) session.getAttribute("code"));
		
		pagingVO.setDetailSearch(board);
		
		int totalRecord = service.selectBoardCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<BoardVO> boardList = service.retrieveBoardList(pagingVO);
		
		pagingVO.setDataList(boardList);
		
		return pagingVO;
	}
	
	@GetMapping("/boardView")
	public String view(
		@RequestParam("what") int board_seq	
		, @ModelAttribute("search") BoardVO search
		, Model model
		, HttpSession session
	) {
		String code = (String) session.getAttribute("code");
		search.setHead_code(code);
		search.setBoard_seq(board_seq);
		BoardVO board = service.retrieveBoard(search);
		String fileno = board.getAtt_fileno();
		board.setAtt_fileno(fileno);
		
		/*boolean valid = true;
		if("Y".equals(board.getBo_sec())) {
			BoardVO authenticated = 
					(BoardVO) session.getAttribute(BOARDAUTH);
			if(authenticated==null || authenticated.getBo_no() != bo_no) {
				valid = false;
			}
		}
		*/
		String board_writer = board.getBoard_writer();
		String id = (String) session.getAttribute("authId");
		String authok=null;
		if(board_writer.equals(id)) {
			authok="OK";
		}
		
		
		String view = null;
			model.addAttribute("authok",authok);
			model.addAttribute("board", board);
			view = "/head/notice/noticeDetail";
		
		return view;
	}
	
	
	
	
	

}
