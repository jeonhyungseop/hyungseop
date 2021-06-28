package kr.or.ddit.cfms.admin.notice.controller;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.notice.service.IHeadNoticeService;
import kr.or.ddit.cfms.utils.RegexUtils;

@Controller
@RequestMapping("/admin/notice")
public class AdminInsertController {
	 @Inject
	 private IHeadNoticeService service;
		@Inject
		private WebApplicationContext container;
		private ServletContext application;
		@PostConstruct
		public void init() {
			application = container.getServletContext();
		}
	
	@GetMapping("/form")
	public String noticeForm(@ModelAttribute("board") BoardVO board
			, HttpSession session) {
		board.setBoard_se_code("A0001");
	
		board.setBoard_writer((String) session.getAttribute("authId"));
		
		
		return "/admin/notice/noticeForm";	
	}
	@RequestMapping(value="/form", method=RequestMethod.POST)
	public String insert(
			@ModelAttribute("board") BoardVO board
			, Errors errors
			, Model model
			, HttpSession session
			) {
		board.setHead_code((String) session.getAttribute("code"));
		board.setBoard_writer((String) session.getAttribute("authId"));
		boolean valid = !errors.hasErrors();
		
		String view = null;
		String message = null;
		if(valid) {
			
			
			System.out.println(board.getAttatchList()+"060317전형섭");
			ServiceResult result = service.createBoard(board);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/admin/notice";
			}else {
				message = "서버 오류";
				view = "/head/notice/noticeForm";
			}
		}else {
			view = "/head/notice/noticeForm";
		}
		
		model.addAttribute("message", message);
		
		return view;
	}

}
