package kr.or.ddit.cfms.head.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.notice.service.IHeadNoticeService;

@Controller
@RequestMapping("/head/notice/update")
public class HNoticeUpdateController {
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
	public String form(
		@RequestParam("what") int bo_no,
	
		 Model model
		, HttpSession session
		,RedirectAttributes redirectAttributes
		,HttpServletResponse response
		,@ModelAttribute("board") BoardVO board
		
		
	) throws IOException {
		// 게시글 번호로 해당 글을 조회하고,
	
	
		String code = (String) session.getAttribute("code");
		board.setHead_code(code);
		String update = "update";
		 board = service.retrieveBoard(BoardVO.builder()
													.board_seq(bo_no)
													.head_code(board.getHead_code())
													.build());
		
		
		model.addAttribute("update", update);
		model.addAttribute("board", board);
		// 수정 폼으로 전달.		
		System.out.println("05555전형섭"+board.getAttatchList());
		return "/head/notice/noticeForm";
	}
	
	
	
	@RequestMapping(method=RequestMethod.POST)
	public String update(
			@ModelAttribute("board") BoardVO board
			,@RequestParam("what") int bo_no
			, Errors errors 
			, Model model
			, HttpSession session
			,RedirectAttributes redirectAttributes
		) {
		
		
		
	
		board.setBoard_seq(bo_no);
		String view = null;
		String message = null;
		if(!errors.hasErrors()) {
		
			
			// 검증 통과시 modify 로직 사용
			ServiceResult result = service.modifyBoard(board);
			if(ServiceResult.OK.equals(result)) {
				// 로직 실행 성공
				// 성공 결과를 확인할 수 있는 view 로 redirect
				System.out.println("여기로 안들어오나 ??"+result);
				view = "redirect:/head/notice/boardView.do?what="+board.getBoard_seq();
			}else {
				// 로직 실행 실패
				// 다시 명령이 발생할 수 있는 곳으로 이동
				message = "로직 실패";
				System.out.println("여기로 안들어오나 ??222222"+result);
				view = "/head/notice/noticeForm";
			}
		}else {
			view = "/head/notice/noticeForm";
		}
		
		model.addAttribute("message", message);
		
		return view;
	}	
}
