package kr.or.ddit.cfms.admin.mail.comtroller;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.cfms.admin.mail.service.IEmailService;
import kr.or.ddit.cfms.admin.mail.vo.EmailDTO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
import kr.or.ddit.cfms.head.question.service.IHeadQuestionService;
import kr.or.ddit.cfms.head.question.vo.HeadAnswerVO;
 
@Controller // 컨트롤러 어노테이션 선언

public class EmailController {
 
    @Inject
    IEmailService emailService; // 서비스를 호출하기위한 의존성 주입
    @Inject
	 private IHeadQuestionService answerservice;
    
	@Inject
	private WebApplicationContext container;
	private ServletContext application;
	@PostConstruct
	public void init() {
		application = container.getServletContext();
	}
	/*
	 * @RequestMapping("write.do") // 이메일 쓰기를 누르면 이 메소드로 맵핑되어서 public String write()
	 * { return "/email/write"; // 다시 write jsp 페이지로 이동하고 jsp페이지에서 내용을 다 채운 뒤에 확인
	 * 버튼을 누르면 send.do로 넘어감 }
	 */
    @RequestMapping(value ="/admin/question/insert", method=RequestMethod.POST) // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
    public String send(@ModelAttribute EmailDTO dto, Model model,

			@ModelAttribute("headanswervo") HeadAnswerVO headanswervo,
			@ModelAttribute("questionVO") FranQuestionVO questionVO,
			HttpSession session)
    {
    
    	String em = headanswervo.getAdmin_email();
    	System.out.println(em+"없?");
    	
    	String view = null;
		String message = null;
		int seq = questionVO.getQues_seq();
		headanswervo.setQues_seq(seq);
		ServiceResult result =answerservice.insertQuestion(headanswervo);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/admin/question";
		}else {
			message = "서버 오류";
			view = "/admin/question/insert";
		}
		
		 try {
			  
			  emailService.sendMail(headanswervo); // dto (메일관련 정보)를 sendMail에 저장함
			
			  
			  } catch (Exception e) { e.printStackTrace(); model.addAttribute("message",
			  "이메일 발송 실패..."); // 이메일 발송이 실패되었다는 메시지를 출력 }
			
	     
			  }
		 
		   
	        return view; // 실패했으므로 다시 write jsp 페이지로 이동함
		  }
}
    
