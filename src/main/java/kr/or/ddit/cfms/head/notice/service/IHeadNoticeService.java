package kr.or.ddit.cfms.head.notice.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;

public interface IHeadNoticeService {
	public List<BoardVO> retrieveBoardList(PagingVO<BoardVO>pagingVO);
	
	public int selectBoardCount(PagingVO<BoardVO> pagingVO);
	
	public AttachfileVO download(AttachfileVO attachfileVO);

	public BoardVO retrieveBoard(BoardVO search);
	
	public ServiceResult createBoard(BoardVO board);
	
	public ServiceResult removeBoard(BoardVO search);
	
	public ServiceResult modifyBoard(BoardVO board);
}
