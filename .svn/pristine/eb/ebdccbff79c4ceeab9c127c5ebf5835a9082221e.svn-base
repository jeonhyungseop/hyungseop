package kr.or.ddit.cfms.fran.question.controller;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.service.IFranQuestionService;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;

@Controller
@RequestMapping("/fran/question")
public class FranQuestionUpdateController {
	 @Inject
	 private IFranQuestionService service;
		@Inject
		private WebApplicationContext container;
		private ServletContext application;
		@PostConstruct
		public void init() {
			application = container.getServletContext();
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
		
		@GetMapping("/update")
		public String form(
				@ModelAttribute("board") FranQuestionVO board,
				@RequestParam("what") int ques_seq,
				Model model
				
				) {
			board.setQues_seq(ques_seq);
			board = service.selectQuestion(board);
			comCode(model);
			model.addAttribute("board",board);
			
			return "/fran/question/questionForm";
		}
		
		
		@GetMapping("/update")
		@RequestMapping(value="/update",method=RequestMethod.POST)
		public String update(
				@ModelAttribute("board") FranQuestionVO board,
				@RequestParam("what") int ques_seq,
				Model model,
				Errors errors 
				
				) {
			board.setQues_seq(ques_seq);
			String view = null;
			String message = null;
			if(!errors.hasErrors()) {
				System.out.println("여기안오나요?"+board);
				ServiceResult result = service.updateQuestion(board);
				if(ServiceResult.OK.equals(result)) {
					System.out.println("너가문제구나");
					// 로직 실행 성공
					// 성공 결과를 확인할 수 있는 view 로 redirect
					
					view = "redirect:/fran/question";
				}else {
					System.out.println("너가문제구나");
					message = "로직 실패";				
					view = "/fran/question/questionForm";
				}
			}else {
				view = "/fran/question/questionForm";
			}
			model.addAttribute("message",message);
			
			return view;
		}

}
