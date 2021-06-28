package kr.or.ddit.cfms.fran.question.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
import kr.or.ddit.cfms.head.question.vo.HeadAnswerVO;

public interface IFranQuestionService {

	public List<FranQuestionVO> selectQuestionsList(PagingVO<FranQuestionVO> pagingVO);
	
	public int selectQuestionCount(PagingVO<FranQuestionVO> pagingVO);
	
	public FranQuestionVO selectQuestion(FranQuestionVO question);
	
	public HeadAnswerVO selectQuestionAnswerList(HeadAnswerVO question);
	
	public ServiceResult insertQuestion(FranQuestionVO question);
	
	public ServiceResult deleteQuestion(FranQuestionVO search);
	
	public ServiceResult updateQuestion(FranQuestionVO question);
	
	public ServiceResult updateQuestionStatus(HeadAnswerVO question);
	
	public ComCodeGrpVO selectCodeList(String code);
}
