package kr.or.ddit.cfms.admin.mail.service;

import kr.or.ddit.cfms.admin.mail.vo.EmailDTO;
import kr.or.ddit.cfms.head.question.vo.HeadAnswerVO;

public interface IEmailService {
	 public void sendMail(HeadAnswerVO dto);
}
