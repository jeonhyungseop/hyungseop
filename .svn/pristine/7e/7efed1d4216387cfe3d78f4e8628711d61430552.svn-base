package kr.or.ddit.cfms.head.notice.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.exception.CustomException;
import kr.or.ddit.cfms.head.notice.dao.IHeadNoticeDao;
@Service
public class HeadNoticeServiceImpl implements IHeadNoticeService {
	private static final Logger logger =
			LoggerFactory.getLogger(HeadNoticeServiceImpl.class);
	private IHeadNoticeDao boardDAO;

	@Inject
	public void setBoardDAO(IHeadNoticeDao boardDAO) {
		this.boardDAO = boardDAO;
		logger.info("주입된 boardDAO : {}", boardDAO.getClass().getName());
	}
	


	@Value("#{appInfo.adminNotice}")
	private String attatchPath;
	
/*	@Value("#{appInfo.attatchPath}")
	private Resource saveRes;
	private File saveFolder;*/
	
	private String saveFolder;
	private File folder;
	
/*	@Value("${user.home}")
	private String userHome;*/

	
	@PostConstruct
	public void init() {
		
		folder = new File(attatchPath);
		saveFolder = folder.getAbsolutePath();
		logger.info("{} 초기화, {} 주입됨."
					, getClass().getSimpleName()
					, folder.getAbsolutePath()
					,folder
				);
		if(!folder.exists()) {
			folder.mkdirs();
		}
	}
	

	
	private int processes(BoardVO board) {
		int cnt = 0;
		List<AttachfileVO> attatchList = board.getAttatchList();
		System.out.println(attatchList+"성공ㅋㅋㅋㅋㅋㅋ");
		if(attatchList!=null && attatchList.size()>0) {
		
			for(AttachfileVO att : attatchList) {
				att.setFile_path(saveFolder);
			}
			cnt += boardDAO.insertAttatches(board);
			if(cnt>0) {
				System.out.println("성공 ㅋㅋㅋ"+cnt);
			}
			try {
				for(AttachfileVO attatch : attatchList) {
					System.out.println("왜 널값이야???"+saveFolder);
					
					attatch.saveTo(saveFolder);
					System.out.println("야하나둘셋넷"+attatch);
					
				}
				
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		return cnt;
	}
	private int processes2(BoardVO board) {
		int cnt = 0;
		List<AttachfileVO> attatchList = board.getAttatchList();
		System.out.println(attatchList+"성공ㅋㅋㅋㅋㅋㅋ");
		if(attatchList!=null && attatchList.size()>0) {
		
			for(AttachfileVO att : attatchList) {
				att.setFile_path(saveFolder);
			}
			cnt += boardDAO.insertUpdateAttatches(board);
			if(cnt>0) {
				System.out.println("성공 ㅋㅋㅋ"+cnt);
			}
			try {
				for(AttachfileVO attatch : attatchList) {
					System.out.println("왜 널값이야???"+saveFolder);
					
					attatch.saveTo(saveFolder);
					System.out.println("야하나둘셋넷"+attatch);
					
				}
				
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		return cnt;
	}
	@Override
	public List<BoardVO> retrieveBoardList(PagingVO<BoardVO> pagingVO) {
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
	public ServiceResult createBoard(BoardVO board) {
		ServiceResult result = ServiceResult.FAIL;
		
		//===============================
		System.out.println("등록폼createboard"+board.getAttatchList());
		int cnt = boardDAO.insertBoard(board);
		if(cnt > 0) {
			
			//==========첨부파일 처리==========
			cnt += processes(board);
			//==============================
			if(cnt > 0) {
				
				result = ServiceResult.OK;
			}	
		}else {
			System.out.println("실패 ㅋㅋㅋ");
		}
		return result;
	}



	@Override
	public AttachfileVO download(AttachfileVO attachfileVO) {
		System.out.println("전혀섭123"+attachfileVO);
		AttachfileVO attatch = boardDAO.selectAttatch(attachfileVO);
		System.out.println("전혀섭123"+attachfileVO);
		if(attatch==null)
			throw new CustomException(attachfileVO+" 에 해당하는 파일이 없음.");
		return attatch;
	}
	
	@Transactional
	@Override
	public ServiceResult removeBoard(BoardVO search) {
		ServiceResult result = ServiceResult.FAIL;
		System.out.println("여기오냐?????"+search);
		
		BoardVO savedBoard = boardDAO.selectBoard(search);
		System.out.println("여기오냐?"+savedBoard);
			// 첨부파일 삭제
			List<AttachfileVO> attatchList 
				= savedBoard.getAttatchList();
			System.out.println("여기오냐?22"+attatchList);
			String fileNo = savedBoard.getAtt_fileno();
			search.setAtt_fileno(fileNo);
			if(attatchList.size()>0) {
				int[] delAttNos = new int[attatchList.size()];
				search.setDelAttNos(delAttNos);
				for(int i = 0; i < delAttNos.length; i++) {
					delAttNos[i] = 
							attatchList.get(i).getAtt_seq();
				}	
				
				deleteFileProcesses(search);
			}// if(attatchList.size) end		
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
					boardDAO.selectSaveNamesForDelete(board);
			System.out.println("나한테왜그래2222222"+saveNames);
			// 첨부파일의 메타 데이터 삭제
			boardDAO.deleteAttathes(board);
			// 이진 데이터 삭제
			for(String saveName : saveNames) {
				File saveFile = new File(saveFolder, saveName);
				saveFile.delete();
			}
		}
		return cnt;
	}
	
	@Transactional
	@Override
	public ServiceResult modifyBoard(BoardVO board) {
		// 게시글 존재 여부 확인
		// 비번 인증
		// 인증 성공시
		// 게시글의 일반 데이터 수정
		System.out.println("수정createboard"+board.getAttatchList());
		
		logger.info("수정 board  {}",    board );
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = boardDAO.updateBoard(board);
		if(cnt>0) {
			// 신규 파일에 대한 등록
		    cnt += processes2(board);
			// 삭제할 파일에 대한 처리
			cnt += deleteFileProcesses(board);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}

	

}
