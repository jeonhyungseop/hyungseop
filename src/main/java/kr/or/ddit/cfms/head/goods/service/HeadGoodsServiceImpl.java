package kr.or.ddit.cfms.head.goods.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.goods.dao.IHeadGoodsDAO;
import kr.or.ddit.cfms.head.goods.vo.HeadGoodsVO;
import kr.or.ddit.cfms.head.inven.dao.IHeadInvenDAO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenListVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.utils.ImageBase64Util;

/**
 * @author 이진수
 * @since 2021. 6. 15
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 15      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class HeadGoodsServiceImpl implements IHeadGoodsService{
private static final Logger logger = LoggerFactory.getLogger(HeadGoodsServiceImpl.class);
	
	@Inject
	private IHeadGoodsDAO headGoodsDAO;
	@Inject
	private IHeadInvenDAO codeDAO; 
	
	@Value("#{appInfo.attatch}")
	private String attatchPath;
	
	private String saveFolder;
	private File folder;
	
	private ImageBase64Util imageBase = new ImageBase64Util();
	
	
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
	public void selectMainInfo(PagingVO<HeadGoodsVO> pagingVO) {
		int totalRecord = retrieveHeadGoodsCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<HeadGoodsVO> goodsList = retrieveHeadGoodsList(pagingVO);
		
		pagingVO.setDataList(goodsList);
		
		for(HeadGoodsVO headgoods : pagingVO.getDataList()) {
			imageBase.imageBase(headgoods.getAttachfileList());
		}
		
	}

	@Override
	public int retrieveHeadGoodsCount(PagingVO<HeadGoodsVO> pagingVO) {
		return headGoodsDAO.selectHeadGoodsCount(pagingVO);
	}

	@Override
	public List<HeadGoodsVO> retrieveHeadGoodsList(PagingVO<HeadGoodsVO> pagingVO) {
		return headGoodsDAO.selectHeadGoodsList(pagingVO);
	}

	@Override
	public ComCodeGrpVO retrieveCodeList(String code) {
		return codeDAO.selectCodeList(code);
	}

	@Override
	public HeadGoodsVO retrieveHeadGoods(HeadGoodsVO headGoods) {
		
		HeadGoodsVO saveGoods = headGoodsDAO.selectHeadGoods(headGoods);
		imageBase.imageBase(saveGoods.getAttachfileList());
		return saveGoods;
	}
	@Transactional
	@Override
	public ServiceResult insertGoods(HeadGoodsVO headGoods) {
		ServiceResult result = ServiceResult.FAIL;
		
		//제품등록
		int cnt = headGoodsDAO.insertGoods(headGoods);
		// 재고 등록
		
		//첨부파일 등록
		if(cnt > 0) {
			System.out.println("여기안옴");
			cnt += prodcesses(headGoods);
		}
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
	
		return result;
	}
	
	private int prodcesses(HeadGoodsVO headGoods) {
		int cnt = 0;
		List<AttachfileVO> attatchList = headGoods.getAttachfileList();
		System.out.println(attatchList);
		if(attatchList != null && attatchList.size()>0) {
			System.out.println("파일첨부리스트");
			
			for(AttachfileVO att : attatchList) {
				att.setFile_path(saveFolder);
			}
			cnt += headGoodsDAO.insertAttatches(headGoods);
			try {
				for(AttachfileVO attatch : attatchList) {
					attatch.saveTo(saveFolder);
				}
				System.out.println("파일첨부성공");
			} catch (IOException e){
				throw new RuntimeException(e);
			}
		}
		return cnt;
	}


	
	@Override
	public ServiceResult deleteGoods(String[] goods_code) {
		int cnt = 0;
		ServiceResult result = ServiceResult.FAIL;
		for(String goods_codes : goods_code) {
			cnt += removeInvenList(goods_codes); 
		}
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}
	
	@Transactional
	public int removeInvenList(String goods_codes) {
		int cnt = 0;
//		HeadInvenVO headInvenVO = invenDAO.selectProd(prod_code);
//		cnt = invenDAO.deleteUnitpclist(prod_code);
//		cnt += invenDAO.deleteInvenlist(prod_code);
		cnt += headGoodsDAO.deleteGoods(goods_codes);
//		cnt += deleteFileProcesses(headInvenVO);
		return cnt;
	}
	
	@Override
	public List<HeadGoodsVO> retrieveHeadGoods(String[] prod_codes) {
		List<HeadGoodsVO> headGoodsList = new ArrayList<>();
		for (String prod_codee : prod_codes) {
			HeadGoodsVO headInvenVO = headGoodsDAO.selectGoods(prod_codee);
			if(headInvenVO!=null) {
				headGoodsList.add(headInvenVO);
			}
		}
		return headGoodsList;
	}
	
	@Override
	public int modifyGoods(HeadGoodsVO headGoodsList) {
		int success = 0;
		for(HeadGoodsVO headInvenVO : headGoodsList.getHeadGoodsListVO()) {
			int cnt = modifyList(headInvenVO);
			if(cnt > 0) {
				success++;
			}
		}
		return success;
	}
	
	@Transactional
	public int modifyList(HeadGoodsVO headInvenVO) {
		int cnt = 0;
		if(headInvenVO.getAtt_fileno().equals("")) {
			headInvenVO.setAtt_fileno(headGoodsDAO.selectAttNo());
			logger.info("{}",headInvenVO.getAtt_fileno());
		}
		cnt += headGoodsDAO.updateGoods(headInvenVO);
		
		
		if(headInvenVO.getDelAttSeq()!=null && headInvenVO.getDelAttSeq().length>0) {
			cnt += deleteFileProcesses(headInvenVO);
		}
		cnt += prodcesses(headInvenVO);
		return cnt;
	}
	
	private int deleteFileProcesses(HeadGoodsVO headInvenVO) {
		int cnt = 0;

		if(headInvenVO.getAtt_fileno()!=null) {
			List<String> saveNames = headGoodsDAO.selectSaveNamesForDelete(headInvenVO);
			cnt += headGoodsDAO.deleteAttatches(headInvenVO);
//			for(String saveName : saveNames) {
//				File saveFile = new File(saveFolder, saveName);
//				saveFile.delete();
//			}
		}
		
		return cnt;
	}
	
	
	
}
