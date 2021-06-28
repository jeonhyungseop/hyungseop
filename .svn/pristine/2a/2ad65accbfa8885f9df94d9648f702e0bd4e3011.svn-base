package kr.or.ddit.cfms.head.question.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
import kr.or.ddit.cfms.head.question.vo.HeadAnswerVO;
@Repository
public interface IHeadQuestionDao {
	/**
	 * 
	 * 문의사항  리스트 조회
	 * @param pagingVO
	 * @return
	 */
	public List<FranQuestionVO> selectQuestionsList(PagingVO<FranQuestionVO>pagingVO);
	/**
	 * 글 수 카운트
	 * @param pagingVO
	 * @return
	 */
	public int selectQuestionCount(PagingVO<FranQuestionVO>pagingVO);
	/**
	 * 문의 상세 보기
	 * @param search
	 * @return
	 */
	public FranQuestionVO selectQuestion(FranQuestionVO question);
	/**
	 * 답변
	 * @param question
	 * @return
	 */
	public int insertQuestion(HeadAnswerVO question);
	public int updateQuestionStatus(HeadAnswerVO question);

}
