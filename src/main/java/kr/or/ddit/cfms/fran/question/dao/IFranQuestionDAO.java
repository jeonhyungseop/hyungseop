package kr.or.ddit.cfms.fran.question.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
import kr.or.ddit.cfms.head.question.vo.HeadAnswerVO;

@Repository
public interface IFranQuestionDAO {
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
	 * 글등록
	 * @param question
	 * @return
	 */
	public int insertQuestion(FranQuestionVO question);
	
	
	
	/**
	 * 글 삭제 
	 * @param search
	 * @return
	 */
	public int deleteQuestion(FranQuestionVO search);
	
	/**
	 * 글 수정
	 * @param question
	 * @return
	 */
	public int updateQuestion(FranQuestionVO question);
	/**
	 * 공통코드 조회 
	 * @param code
	 * @return
	 */
	public ComCodeGrpVO selectCodeList(String code);
	/**
	 * 
	 * 글 상태 업데이트 
	 * @param question
	 * @return
	 */
	public int updateQuestionStatus(HeadAnswerVO question);
	
	public HeadAnswerVO selectQuestionAnswerList(HeadAnswerVO question);

}
