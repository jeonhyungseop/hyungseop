package kr.or.ddit.cfms.head.inven.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.exception.CustomException;
import kr.or.ddit.cfms.head.inven.dao.IHeadInvenDAO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenListVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.inven.vo.UnitpcListVO;

/**
 * @author 이진수
 * @since 2021. 5. 21
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 21      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class HeadInvenServiceImpl implements IHeadInvenService {
	private static final Logger logger = LoggerFactory.getLogger(HeadInvenServiceImpl.class);
	
	@Inject
	private IHeadInvenDAO invenDAO;
	
	@Value("#{appInfo.attatch}")
	private String attatchPath;
	
//	@Value("#{appInfo.attatch}")
//	private Resource saveRes;
//	private File saveFolder;
	
	private String saveFolder;
	private File folder;
	
//	@Value("${user.home}")
//	private String userHome;
	
	@PostConstruct
	public void init() throws IOException {
//		saveFolder = saveRes.getFile().getAbsolutePath();
		folder = new File(attatchPath);
		saveFolder = folder.getAbsolutePath();
		logger.info("{} 초기화, {} 주입됨. {}"
					, getClass().getSimpleName()
					, folder.getAbsolutePath()
					, folder
					);
//		logger.info("{} 초기화, {} 주입됨.{}"
//				, getClass().getSimpleName()
//				, saveFolder.getAbsolutePath()
//				, saveFolder.isAbsolute());
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
	}
	
	@Override
	public int retrieveHeadInvenCount(PagingVO<HeadInvenVO> pagingVO) {
		return invenDAO.selectHeadInvenCount(pagingVO);
	}

	@Override
	public List<HeadInvenVO> retrieveHeadInvenList(PagingVO<HeadInvenVO> pagingVO) {
		return invenDAO.selectHeadInvenList(pagingVO);
	}

	@Override
	public HeadInvenVO retrieveHeadInven(HeadInvenVO headInvenVO) {
		return invenDAO.selectHeadInven(headInvenVO);
	}

	@Override
	public ComCodeGrpVO retrieveCodeList(String code) {
		return invenDAO.selectCodeList(code);
	}
	

	@Override
	public ServiceResult createInven(HeadInvenListVO headInvenList) {
		ServiceResult result = ServiceResult.FAIL;
		int success = 0;
		for(HeadInvenVO headInven : headInvenList.getHeadInvenListVO()) {
			if(headInven.getProd_cl_code()==null || headInven.getProd_nm()==null || headInven.getProd_unit_code()==null || headInven.getProd_unit_qy()==null) continue;
			success += createInvenList(headInven);
			result = ServiceResult.OK;
		}
		return result;
	}
	@Transactional
	public int createInvenList(HeadInvenVO headInven) {
		int success = 0;
		//제품등록
		int cnt = invenDAO.insertProd(headInven);
		// 재고 등록
		if(cnt > 0) {
			cnt = 0;
			cnt += invenDAO.insertInven(headInven);
		}
		//첨부파일 등록
		if(cnt > 0) {
			cnt += prodcesses(headInven);
		}
		// 단가 변동 내역 등록
		if(cnt > 0) {
			cnt = 0;
			cnt += invenDAO.insertUnitpclist(headInven);
			if(cnt > 0) {
				success++;
			}
		}
		return success;
	}
	private int prodcesses(HeadInvenVO headInven) {
		int cnt = 0;
		List<AttachfileVO> attatchList = headInven.getAttachfileList();
		System.out.println(attatchList);
		if(attatchList != null && attatchList.size()>0) {
			
			for(AttachfileVO att : attatchList) {
				att.setFile_path(saveFolder);
			}
			cnt += invenDAO.insertAttatches(headInven);
			try {
				for(AttachfileVO attatch : attatchList) {
					attatch.saveTo(saveFolder);
				}
			} catch (IOException e){
				throw new RuntimeException(e);
			}
		}
		return cnt;
	}
	
	private int deleteFileProcesses(HeadInvenVO headInvenVO) {
		int cnt = 0;

		if(headInvenVO.getAtt_fileno()!=null) {
			List<String> saveNames = invenDAO.selectSaveNamesForDelete(headInvenVO);
			cnt += invenDAO.deleteAttatches(headInvenVO);
//			for(String saveName : saveNames) {
//				File saveFile = new File(saveFolder, saveName);
//				saveFile.delete();
//			}
		}
		
		return cnt;
	}

	@Override
	public ServiceResult removeInven(String[] prod_codes) {
		int cnt = 0;
		ServiceResult result = ServiceResult.FAIL;
		for(String prod_code : prod_codes) {
			cnt += removeInvenList(prod_code); 
		}
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}
	
	@Transactional
	public int removeInvenList(String prod_code) {
		int cnt = 0;
//		HeadInvenVO headInvenVO = invenDAO.selectProd(prod_code);
//		cnt = invenDAO.deleteUnitpclist(prod_code);
//		cnt += invenDAO.deleteInvenlist(prod_code);
		cnt += invenDAO.deleteProdList(prod_code);
//		cnt += deleteFileProcesses(headInvenVO);
		return cnt;
	}

	@Override
	public List<HeadInvenVO> retrieveHeadProd(String[] prod_codes) {
		List<HeadInvenVO> headInvenList = new ArrayList<>();
		for (String prod_code : prod_codes) {
			HeadInvenVO headInvenVO = invenDAO.selectProd(prod_code);
			if(headInvenVO!=null) {
				headInvenList.add(headInvenVO);
			}
		}
		return headInvenList;
	}

	@Override
	public AttachfileVO retrieveAttachFile(AttachfileVO attachFile) {
		return invenDAO.selectFile(attachFile);
	}

	@Override
	public int modifyInven(HeadInvenListVO headInvenList) {
		int success = 0;
		for(HeadInvenVO headInvenVO : headInvenList.getHeadInvenListVO()) {
			int cnt = modifyList(headInvenVO);
			if(cnt > 0) {
				success++;
			}
		}
		return success;
	}
	@Transactional
	public int modifyList(HeadInvenVO headInvenVO) {
		int cnt = 0;
		if(headInvenVO.getAtt_fileno().equals("")) {
			headInvenVO.setAtt_fileno(invenDAO.selectAttNo());
			logger.info("{}",headInvenVO.getAtt_fileno());
		}
		cnt += invenDAO.updateProd(headInvenVO);
		cnt += invenDAO.updateInven(headInvenVO);
		cnt += invenDAO.insertUnitpclist(headInvenVO);
		if(headInvenVO.getDelAttSeq()!=null && headInvenVO.getDelAttSeq().length>0) {
			cnt += deleteFileProcesses(headInvenVO);
		}
		cnt += prodcesses(headInvenVO);
		return cnt;
	}

	@Override
	public List<UnitpcListVO> retrieveUnitpcList(String prod_code) {
		return invenDAO.selectUnitpcList(prod_code);
	}
	

}
