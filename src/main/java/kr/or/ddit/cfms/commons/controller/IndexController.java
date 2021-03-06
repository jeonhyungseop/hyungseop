package kr.or.ddit.cfms.commons.controller;

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
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.cfms.admin.notice.service.IboardService;
import kr.or.ddit.cfms.admin.question.service.IAdminQuestionService;
import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
import kr.or.ddit.cfms.head.notice.service.IHeadNoticeService;

@Controller
public class IndexController {
	@Inject
	private IboardService service;
	 @Inject
	 private IHeadNoticeService service2;
		@Inject
		private IAdminQuestionService questionService;
	@Inject
	private WebApplicationContext container;
	private ServletContext application;

	@PostConstruct
	public void init() {
		application = container.getServletContext();
	}

	@RequestMapping({ "/", "/index" })
	public String index(
			/* @ModelAttribute("board") boardVO board */
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "minDate", required = false) String minDate,
			@RequestParam(value = "maxDate", required = false) String maxDate, Model model,
			HttpSession session

	) {
		String id = (String) session.getAttribute("authId");
	/*	String adminauth=null;
		String admin = "ADMIN";
	
		if(id.equals(admin)) {
			adminauth="ok";
			
		}*/

		PagingVO<BoardVO> pagingVO = listForAjax(currentPage, searchType, searchWord, minDate, maxDate);

		model.addAttribute("pagingVO", pagingVO);
		/*model.addAttribute("adminauth",adminauth);*/
		return "index";
	}

	@RequestMapping(value = "/index", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<BoardVO> listForAjax(
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "searchWord", required = false) String searchWord,
			@RequestParam(value = "minDate", required = false) String minDate,
			@RequestParam(value = "maxDate", required = false) String maxDate) {
		PagingVO<BoardVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		// ?????? ??????
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("minDate", minDate);
		searchMap.put("maxDate", maxDate);
		pagingVO.setSearchMap(searchMap);

		int totalRecord = service.selectBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);

		List<BoardVO> boardList = service.retrieveBoardList(pagingVO);

		pagingVO.setDataList(boardList);

		return pagingVO;
	}

	@RequestMapping("/adminboard/boardView.do")
	public String view(@RequestParam("what") int bo_no, @ModelAttribute("search") BoardVO search, Model model,
			HttpSession session) {
		search.setBoard_seq(bo_no);
		BoardVO board = service.retrieveBoard(search);

		String view = null;

		model.addAttribute("board", board);
		view = "admin/notice/noticeDetail";

		return view;
	}
	
	
	
	@RequestMapping(value="/adminQuestion/form", method=RequestMethod.POST)
	public String insert(
			@ModelAttribute("board") FranQuestionVO board
			, Errors errors
			, Model model
			, HttpSession session
			) {
		System.out.println("????????????");
		/*board.setHead_code((String) session.getAttribute("code"));
		board.setBoard_writer((String) session.getAttribute("authId"));*/
		boolean valid = !errors.hasErrors();
		
		String view = null;
		String message = null;			
		
			
			ServiceResult result = questionService.insertQuestion(board);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/index";
			}else {
				message = "?????? ??????";
				view = "/index";
			}
	
		
		model.addAttribute("message", message);
		
		return view;
	}
	
	
	

}
