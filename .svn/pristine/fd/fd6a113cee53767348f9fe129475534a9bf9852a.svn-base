package kr.or.ddit.cfms.head.question.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
import kr.or.ddit.cfms.head.question.vo.HeadAnswerVO;

public interface IHeadQuestionService {
	
	public List<FranQuestionVO> selectQuestionsList(PagingVO<FranQuestionVO> pagingVO);
	
	public int selectQuestionCount(PagingVO<FranQuestionVO> pagingVO);
	
	public FranQuestionVO selectQuestion(FranQuestionVO question);

	public ServiceResult insertQuestion(HeadAnswerVO headanswervo);

}
