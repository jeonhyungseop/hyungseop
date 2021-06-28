package kr.or.ddit.cfms.fran.question.controller;

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
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.service.IFranQuestionService;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.limit.vo.LimitSearchVO;
import kr.or.ddit.cfms.head.notice.service.IHeadNoticeService;
import kr.or.ddit.cfms.head.question.vo.HeadAnswerVO;

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
@RequestMapping("/fran/question")
public class FranQuestionController {
	 @Inject
	 private IFranQuestionService service;
		@Inject
		private WebApplicationContext container;
		private ServletContext application;
		@PostConstruct
		public void init() {
			application = container.getServletContext();
		}
	@GetMapping
	public String questionList(@ModelAttribute LimitSearchVO limitSearchVO,
			HttpSession session,
			Model model) {
		System.out.println(limitSearchVO.getSearchAnswer()+"형섭아");
		System.out.println(limitSearchVO.getSearchType()+"형섭아22");
		PagingVO<FranQuestionVO> pagingVO = listForAjax(limitSearchVO,session);
		comCode(model);
		model.addAttribute("pagingVO", pagingVO);
		
	
		
		return "/fran/question/questionList";
		
	}
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<FranQuestionVO> listForAjax(@ModelAttribute LimitSearchVO limitSearchVO,
			HttpSession session
			
			){
		System.out.println(limitSearchVO.getSearchAnswer()+"형섭아");
		System.out.println(limitSearchVO.getSearchType()+"형섭아22");
		System.out.println();
		PagingVO<FranQuestionVO> pagingVO = new PagingVO<>(limitSearchVO.getScreenSize() , 10, limitSearchVO.getPage(), limitSearchVO);
		System.out.println(limitSearchVO.getScreenSize()+"형섭");
		System.out.println(limitSearchVO.getPage()+"오마이갓");
		/* pagingVO.setCurrentPage(currentPage); */
		/*
		 * // 검색 조건 Map<String, Object> searchMap = new HashMap<>();
		 * searchMap.put("searchType", searchType); searchMap.put("searchWord",
		 * searchWord); searchMap.put("minDate", minDate); searchMap.put("maxDate",
		 * maxDate); pagingVO.setSearchMap(searchMap);
		 */
		
		String code = (String) session.getAttribute("code");
		String id = (String) session.getAttribute("authId");
		
		String code2 = code.substring(0,5);
		System.out.println("안녕하세요"+code2);
		
		
		pagingVO.setDetailSearch(new FranQuestionVO(code2,id));
		
		
		int totalRecord = service.selectQuestionCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		
		List<FranQuestionVO> boardList = service.selectQuestionsList(pagingVO);
		
		pagingVO.setDataList(boardList);
		
		return pagingVO;
	}
	//공통코드 
		public void comCode(Model model) {
			ComCodeGrpVO orsCode = service.selectCodeList("QCC");
			ComCodeGrpVO oscCode = service.selectCodeList("QST");
			
			model.addAttribute("orsCode", orsCode);
			model.addAttribute("oscCode", oscCode);
		/*	model.addAttribute("orsCode", orcCode);
			model.addAttribute("oscCode", oscCode);
			model.addAttribute("istCode", iscCode);*/
		}
	

	
	@GetMapping("/detail")
	public String questionDetail(@RequestParam("what") int ques_seq,
			@ModelAttribute("questionVO") FranQuestionVO questionVO2,				
			Model model) {
		questionVO2.setQues_seq(ques_seq);
		
		FranQuestionVO questionVO = service.selectQuestion(questionVO2);
		
		model.addAttribute("questionVO",questionVO);
		
		return "/fran/question/questionDetail";
		
	}
	
	@GetMapping("/form")
	public String noticeForm(@ModelAttribute("board") FranQuestionVO board,
			
			HttpSession session
			
	
			, Model model) {

		/*
		 * board =service.selectQuestion(ques_seq); System.out.println("뭐냐"+board);
		 * model.addAttribute("board",board); System.out.println("도대체.."+model);
		 * comCode(model); System.out.println("왜이래"+model);
		 */
		
		 comCode(model);
		   
	      board.setQues_writer((String) session.getAttribute("authId"));
	      model.addAttribute("board",board); 
	
		return "/fran/question/questionForm";	
	
	}
	
	@GetMapping("/form")
	@RequestMapping(value="/form", method=RequestMethod.POST)
	public String insert(
			@ModelAttribute("board") FranQuestionVO board
			, Errors errors
			, Model model
			, HttpSession session
			) {
		/*board.setHead_code((String) session.getAttribute("code"));
		board.setBoard_writer((String) session.getAttribute("authId"));*/
		boolean valid = !errors.hasErrors();
		
		String view = null;
		String message = null;
		String code = (String) session.getAttribute("code");
		if(code != null) {
			code = code.substring(0, 5);
		}
		if(valid) {
			board.setHead_code(code);
			ServiceResult result = service.insertQuestion(board);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/fran/question";
			}else {
				message = "서버 오류";
				view = "/fran/question/form";
			}
		}else {
			view = "/fran/question/form";
		}
		
		model.addAttribute("message", message);
		
		return view;
	}
	
	@GetMapping("/delete")
	public String delete( @ModelAttribute("board")FranQuestionVO board
			,BindingResult errors
			,Model model
			,RedirectAttributes redirectAttributes
			,@RequestParam("what") int board_seq	
			) {
		board.setQues_seq(board_seq);
		String view = null;
		
		if(!errors.hasErrors()) {
			
			ServiceResult result = service.deleteQuestion(board);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/fran/question";
			}else {
				redirectAttributes.addFlashAttribute("message", "비밀번호 오류");
				view= "redirect:/head/question/form.do?what="+board.getQues_seq(); 
			}
		}else {
			redirectAttributes.addFlashAttribute("message", "필수 데이터 누락");
			view= "redirect:/head/question/form.do="+board.getQues_seq();
		}
		
		return view;
	}
	
	
	@GetMapping("/answerList")
	public String questionDetail(@RequestParam("what") int ques_seq,
			@ModelAttribute("questionVO") FranQuestionVO questionVO2,				
			@ModelAttribute("headanswervo") HeadAnswerVO headanswervo,
			HttpSession session,
			Model model) {

		
		questionVO2.setQues_seq(ques_seq);
		headanswervo.setQues_seq(ques_seq);
		HeadAnswerVO answerVO =service.selectQuestionAnswerList(headanswervo);
		FranQuestionVO questionVO = service.selectQuestion(questionVO2);
		
		model.addAttribute("answerVO",answerVO);
		model.addAttribute("questionVO",questionVO);
		
		return "/fran/question/questionAnswerList";
		
	}

	



	

}
