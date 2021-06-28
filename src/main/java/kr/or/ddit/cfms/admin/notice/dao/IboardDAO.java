package kr.or.ddit.cfms.admin.notice.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;

@Repository
public interface IboardDAO {
	/**
	 * 공지사항 리스트 조회
	 * @return
	 */
	public List<BoardVO> selectBoardList(PagingVO<BoardVO>pagingVO);
	/**
	 * 
	 * 글 수 카운트
	 * @param pagingVO
	 * @return
	 */
	public int selectBoardCount(PagingVO<BoardVO> pagingVO);
	
	
	
	/**
	 * 조회수 증가
	 * @param bo_no
	 * @return
	 */
	public int incrementHit(int bo_no);
	/**
	 * 
	 * 상세보기
	 * @param search
	 * @return
	 */
	public BoardVO selectBoard(BoardVO search);
	
	public int deleteBoard(BoardVO search);
}
