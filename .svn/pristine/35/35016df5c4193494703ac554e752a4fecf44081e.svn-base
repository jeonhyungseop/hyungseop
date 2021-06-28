package kr.or.ddit.cfms.admin.question.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;

@Repository
public interface IAdminQuestionDAO {

	/**
	 * 포탈 사용자 문의사항 글 등록 
	 * @param question
	 * @return
	 */
	public int insertQuestion(FranQuestionVO question);
	
	/**
	 * 
	 * 문의사항  리스트 조회
	 * @param pagingVO
	 * @return
	 */
	public List<FranQuestionVO> selectQuestionsList(PagingVO<FranQuestionVO>pagingVO);
	
	/**
	 * 문의 사항 글 카운트
	 * @param pagingVO
	 * @return
	 */
	public int selectQuestionCount(PagingVO<FranQuestionVO>pagingVO);
	/**
	 * 문의 글 상세보기
	 * @param question
	 * @return
	 */
	public FranQuestionVO selectQuestion(FranQuestionVO question);
}
