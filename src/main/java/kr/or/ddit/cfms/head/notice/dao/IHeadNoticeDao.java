package kr.or.ddit.cfms.head.notice.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;

@Repository
public interface IHeadNoticeDao {
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
	/**
	 * 
	 * 글 등록
	 * @param board
	 * @return
	 */
	public int insertBoard(BoardVO board);
	
	public int insertAttatches(BoardVO board);
	/**
	 * 글상세보기할때 파일첨부 가져오기 
	 * @param att_no
	 * @return
	 */
	/**
	 * update 첨부파일 등록
	 * @param board
	 * @return
	 */
	public int insertUpdateAttatches(BoardVO board);
	public AttachfileVO selectAttatch(AttachfileVO attachfileVO);
	/**
	 * 글 삭제 업데이트
	 * @param search
	 * @return
	 */
	public int deleteBoard(BoardVO search);
	/**
	 * 글 수정
	 * @param board
	 * @return
	 */
	public int updateBoard(BoardVO board);
	
	public List<String> selectSaveNamesForDelete(BoardVO board);
	public int deleteAttathes(BoardVO board);
}
