package kr.or.ddit.cfms.head.question.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.service.IFranQuestionService;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
import kr.or.ddit.cfms.head.limit.vo.LimitSearchVO;
import kr.or.ddit.cfms.head.question.service.IHeadQuestionService;
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
@RequestMapping("/head/question")
public class HeadQuestionController {
	 @Inject
	 private IHeadQuestionService service;
	 @Inject
	 private IFranQuestionService service2;
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
			Model model			
			) {
		PagingVO<FranQuestionVO> pagingVO = listForAjax(limitSearchVO,session);
		comCode(model);
		model.addAttribute("pagingVO", pagingVO);
		
		
		return "/head/question/questionList";	
	}
	
	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<FranQuestionVO> listForAjax(@ModelAttribute LimitSearchVO limitSearchVO,
			HttpSession session
			
			){
		
		System.out.println();
		PagingVO<FranQuestionVO> pagingVO = new PagingVO<>(limitSearchVO.getScreenSize() , 10, limitSearchVO.getPage(), limitSearchVO);
		
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
		ComCodeGrpVO orsCode = service2.selectCodeList("QCC");
		ComCodeGrpVO oscCode = service2.selectCodeList("QST");
		
		model.addAttribute("orsCode", orsCode);
		model.addAttribute("oscCode", oscCode);
	/*	model.addAttribute("orsCode", orcCode);
		model.addAttribute("oscCode", oscCode);
		model.addAttribute("istCode", iscCode);*/
	}
	
	@GetMapping("/detail")
	public String questionDetail(@RequestParam("what") int ques_seq,
			@ModelAttribute("questionVO") FranQuestionVO questionVO2,				
			Model model
			, HttpSession session) {
		questionVO2.setQues_seq(ques_seq);
		String code = (String) session.getAttribute("code");
		questionVO2.setHead_code(code);
		
		FranQuestionVO questionVO = service.selectQuestion(questionVO2);
		
		model.addAttribute("questionVO",questionVO);
		
		return "/head/question/questionDetail";
		
	}
	
	@GetMapping("/insert")
	public String insert(@RequestParam("what") int ques_seq,
			@ModelAttribute("questionVO") FranQuestionVO questionVO2,
			@ModelAttribute("headanswervo") HeadAnswerVO headanswervo,
			HttpSession session,
			
			Model model
			) {
		questionVO2.setQues_seq(ques_seq);
		String code = (String) session.getAttribute("code");
		String id = (String) session.getAttribute("authId");
		questionVO2.setHead_code(code);
		new HeadAnswerVO(code,id);
		
		FranQuestionVO questionVO = service.selectQuestion(questionVO2);
		headanswervo.setAnswer_writer_id(id);
		model.addAttribute("questionVO",questionVO);
		model.addAttribute("headanswervo",headanswervo);
		
			
		
		return "/head/question/questionAnswer";
		
	}
	
	
	@RequestMapping(value ="/insert", method=RequestMethod.POST)
	public String insert(
			
			@ModelAttribute("headanswervo") HeadAnswerVO headanswervo,
			@ModelAttribute("questionVO") FranQuestionVO questionVO,
			HttpSession session,
			
			Model model
			) {
		System.out.println("머선일이고");
		String view = null;
		String message = null;
		int seq = questionVO.getQues_seq();
		headanswervo.setQues_seq(seq);
		/*
		 * String code = (String) session.getAttribute("code"); String id = (String)
		 * session.getAttribute("authId"); new HeadAnswerVO(code,id);
		 */
		ServiceResult result =service.insertQuestion(headanswervo);
		
		
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/head/question";
		}else {
			message = "서버 오류";
			view = "/head/notice/insert";
		}
		
		return view;
		
	}
	
	
	
	
	
	
}
