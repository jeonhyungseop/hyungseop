package kr.or.ddit.cfms.head.notice.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.notice.service.IHeadNoticeService;
import kr.or.ddit.cfms.validator.DeleteGroup;

@Controller
@RequestMapping("/head/notice")
public class HNoticeDeleteController {
	@Inject
	private IHeadNoticeService service; 
	
	@GetMapping("/delete")
	public String delete( @ModelAttribute("board")BoardVO board
			,BindingResult errors
			,Model model
			,RedirectAttributes redirectAttributes
			,@RequestParam("what") int board_seq	
			, HttpSession session
			) {
		String code = (String) session.getAttribute("code");
		board.setHead_code(code);
		board.setBoard_seq(board_seq);
		String view = null;
		
		if(!errors.hasErrors()) {
			
			ServiceResult result = service.removeBoard(board);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/head/notice";
			}else {
				redirectAttributes.addFlashAttribute("message", "비밀번호 오류");
				view= "redirect:/head/notice/boardView.do?what="+board.getBoard_seq(); 
			}
		}else {
			redirectAttributes.addFlashAttribute("message", "필수 데이터 누락");
			view= "redirect:/head/notice/boardView.do="+board.getBoard_seq();
		}
		
		return view;
	}
	
}
