package kr.or.ddit.cfms.admin.notice.service;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.admin.notice.dao.IboardDAO;
import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.exception.CustomException;
import kr.or.ddit.cfms.head.notice.dao.IHeadNoticeDao;
@Service
public class boardServiceImpl implements IboardService{
	private static final Logger logger =
			LoggerFactory.getLogger(boardServiceImpl.class);
	private IboardDAO boardDAO;
	
	private IHeadNoticeDao boardDAO2;
	@Inject
	public void setBoardDAO(IboardDAO boardDAO) {
		this.boardDAO = boardDAO;
		logger.info("주입된 boardDAO : {}", boardDAO.getClass().getName());
	}
	@Value("#{appInfo.adminNotice}")
	private String attatchPath;
	private String saveFolder;
	private File folder;
	@Override
	public List<BoardVO> retrieveBoardList(PagingVO<BoardVO>pagingVO) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList(pagingVO);
	}
	
	@Override
	public int selectBoardCount(PagingVO<BoardVO> pagingVO) {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardCount(pagingVO);
	}
	
	@Override
	public BoardVO retrieveBoard(BoardVO search) {
		BoardVO board = boardDAO.selectBoard(search);
		if(board==null)
			throw new CustomException(search.getBoard_seq()+"에 해당하는 게시글이 없음");
		
		boardDAO.incrementHit(board.getBoard_seq());
		return board;
		
	}
	
	@Transactional
	@Override
	public ServiceResult removeBoard(BoardVO search) {
		ServiceResult result = ServiceResult.FAIL;
		System.out.println("여기오냐?????"+search);
	
		
		
	
			
			// 게시글 삭제
			int cnt = boardDAO.deleteBoard(search);
			if(cnt>0) {
				result = ServiceResult.OK;
			}
		
		return result;
	}
	
	private int deleteFileProcesses(BoardVO board) {
		int[] delAttNos = board.getDelAttNos();
		int cnt = 0;
	
		if(delAttNos!=null && delAttNos.length > 0) {
			
			
			System.out.println("여기뭐가 있을까"+board);
			List<String> saveNames = 
					boardDAO2.selectSaveNamesForDelete(board);
			System.out.println("나한테왜그래2222222"+saveNames);
			// 첨부파일의 메타 데이터 삭제
			boardDAO2.deleteAttathes(board);
			// 이진 데이터 삭제
			for(String saveName : saveNames) {
				File saveFile = new File(saveFolder, saveName);
				saveFile.delete();
			}
		}
		return cnt;
	}

}
