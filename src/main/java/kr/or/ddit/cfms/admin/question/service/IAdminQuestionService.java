package kr.or.ddit.cfms.admin.question.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;

public interface IAdminQuestionService {
	
	
	public ServiceResult insertQuestion(FranQuestionVO question);
	
	public int selectQuestionCount(PagingVO<FranQuestionVO> pagingVO);
	
	public List<FranQuestionVO> selectQuestionsList(PagingVO<FranQuestionVO> pagingVO);
	
	public FranQuestionVO selectQuestion(FranQuestionVO question);

}
