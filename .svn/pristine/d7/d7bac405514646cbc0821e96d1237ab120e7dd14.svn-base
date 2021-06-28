package kr.or.ddit.cfms.admin.notice.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;

public interface IboardService {
	public List<BoardVO> retrieveBoardList(PagingVO<BoardVO>pagingVO);
	
	public int selectBoardCount(PagingVO<BoardVO> pagingVO);
	
	

	public BoardVO retrieveBoard(BoardVO search);
	
	public ServiceResult removeBoard(BoardVO search);
}
