package kr.or.ddit.cfms.admin.question.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.cfms.admin.question.service.IAdminQuestionService;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.service.IFranQuestionService;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
import kr.or.ddit.cfms.head.limit.vo.LimitSearchVO;
import kr.or.ddit.cfms.head.question.service.IHeadQuestionService;
import kr.or.ddit.cfms.head.question.vo.HeadAnswerVO;

@Controller
@RequestMapping("/admin/question")
public class AdminQuestion {
	@Inject
	private IAdminQuestionService service;
	 @Inject
	 private IFranQuestionService aservice;
	
	@Inject
	private IHeadQuestionService answerservice;

	@Inject
	private IFranQuestionService codelistService;

	@Inject
	private WebApplicationContext container;
	private ServletContext application;

	@PostConstruct
	public void init() {
		application = container.getServletContext();
	}

	@GetMapping
	public String questionList(@ModelAttribute LimitSearchVO limitSearchVO, HttpSession session, Model model) {
		PagingVO<FranQuestionVO> pagingVO = listForAjax(limitSearchVO, session);
		comCode(model);
		model.addAttribute("pagingVO", pagingVO);

		return "/admin/question/questionList";

	}

	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<FranQuestionVO> listForAjax(@ModelAttribute LimitSearchVO limitSearchVO, HttpSession session

	) {

		System.out.println();
		PagingVO<FranQuestionVO> pagingVO = new PagingVO<>(limitSearchVO.getScreenSize(), 10, limitSearchVO.getPage(),
				limitSearchVO);
		pagingVO.setHead_code("GUEST");

	
		/* pagingVO.setCurrentPage(currentPage); */
		/*
		 * // 검색 조건 Map<String, Object> searchMap = new HashMap<>();
		 * searchMap.put("searchType", searchType); searchMap.put("searchWord",
		 * searchWord); searchMap.put("minDate", minDate); searchMap.put("maxDate",
		 * maxDate); pagingVO.setSearchMap(searchMap);
		 */

		/*
		 * String code = (String) session.getAttribute("code"); String id = (String)
		 * session.getAttribute("authId");
		 * 
		 * String code2 = code.substring(0,5); System.out.println("안녕하세요"+code2);
		 * 
		 * 
		 * pagingVO.setDetailSearch(new FranQuestionVO(code2,id));
		 */

		int totalRecord = service.selectQuestionCount(pagingVO);

		pagingVO.setTotalRecord(totalRecord);

		List<FranQuestionVO> boardList = service.selectQuestionsList(pagingVO);

		pagingVO.setDataList(boardList);

		return pagingVO;
	}

	public void comCode(Model model) {
		ComCodeGrpVO orsCode = codelistService.selectCodeList("QCC");
		ComCodeGrpVO oscCode = codelistService.selectCodeList("QST");

		model.addAttribute("orsCode", orsCode);
		model.addAttribute("oscCode", oscCode);
		/*
		 * model.addAttribute("orsCode", orcCode); model.addAttribute("oscCode",
		 * oscCode); model.addAttribute("istCode", iscCode);
		 */
	}

	@GetMapping("/detail")
	public String questionDetail(@RequestParam("what") int ques_seq,
			@ModelAttribute("questionVO") FranQuestionVO questionVO2, 
			@ModelAttribute("headanswervo") HeadAnswerVO headanswervo,
			Model model) {
		questionVO2.setQues_seq(ques_seq);
		headanswervo.setQues_seq(ques_seq);

		FranQuestionVO questionVO = service.selectQuestion(questionVO2);
		HeadAnswerVO answerVO = aservice.selectQuestionAnswerList(headanswervo);
		model.addAttribute("questionVO", questionVO);
		model.addAttribute("answerVO", answerVO);

		return "/admin/question/questionDetail";

	}

	@GetMapping("/insert")
	public String insert(@RequestParam("what") int ques_seq, @ModelAttribute("questionVO") FranQuestionVO questionVO2,
			@ModelAttribute("headanswervo") HeadAnswerVO headanswervo, HttpSession session,

			Model model) {
		String id = (String) session.getAttribute("authId");
		headanswervo.setAnswer_writer_id(id);

		questionVO2.setQues_seq(ques_seq);

		FranQuestionVO questionVO = service.selectQuestion(questionVO2);
	
		model.addAttribute("questionVO", questionVO);
	
		model.addAttribute("headanswervo", headanswervo);

		return "/admin/question/questionAnswer";

	}

	/*
	 * @RequestMapping(value ="/insert", method=RequestMethod.POST) public String
	 * insert(
	 * 
	 * @ModelAttribute("headanswervo") HeadAnswerVO headanswervo,
	 * 
	 * @ModelAttribute("questionVO") FranQuestionVO questionVO, HttpSession session,
	 * 
	 * Model model ) { System.out.println("머선일이고"); String view = null; String
	 * message = null; int seq = questionVO.getQues_seq();
	 * headanswervo.setQues_seq(seq);
	 * 
	 * String code = (String) session.getAttribute("code"); String id = (String)
	 * session.getAttribute("authId"); new HeadAnswerVO(code,id);
	 * 
	 * ServiceResult result =answerservice.insertQuestion(headanswervo);
	 * 
	 * 
	 * if(ServiceResult.OK.equals(result)) { view = "redirect:/admin/question";
	 * }else { message = "서버 오류"; view = "/admin/question/insert"; }
	 * 
	 * return view;
	 * 
	 * }
	 */

}
