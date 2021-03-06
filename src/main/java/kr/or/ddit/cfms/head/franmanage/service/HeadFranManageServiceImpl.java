package kr.or.ddit.cfms.head.franmanage.service;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.franmanage.dao.IHeadFranManageDAO;
import kr.or.ddit.cfms.head.royal.vo.HeadBillVO;
import kr.or.ddit.cfms.utils.CryptoUtil;

/**
 * @author 진유리
 * @since 2021. 06. 02
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * ------------     --------    ----------------------
 * 2021. 06. 02     진유리         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class HeadFranManageServiceImpl implements IHeadFranManageService{
	private static final Logger logger = LoggerFactory.getLogger(HeadFranManageServiceImpl.class);
	
	@Inject
	private IHeadFranManageDAO hfmanageDAO;
	
	@Value("#{appInfo.attatch}")
	private String attatchPath;
	
	@Value("#{appInfo.franBL}")
	private String subPath;
	
	private String saveFolder;
	private File folder;
	private String saveFolder_BL;
	private File folder_BL;
	
	@Override
	public int retrieveFranCount(PagingVO<FranchiseVO> pagingVO) {
		return hfmanageDAO.selectFranCount(pagingVO);
	}

	@Override
	public List<FranchiseVO> retrieveFranList(PagingVO<FranchiseVO> pagingVO) {
		return hfmanageDAO.selectFranList(pagingVO);
	}

	@Override
	public FranchiseVO retrieveFran(Map<String, Object> map) {
		return hfmanageDAO.selectFran(map);
	}

	@Override
	public ComCodeGrpVO retrieveCodeList(String code) {
		return hfmanageDAO.selectCodeList(code);
	}

	@Override
	@Transactional
	public ServiceResult createFranchise(FranchiseVO fran) {
		ServiceResult result = ServiceResult.FAIL;
		folder = new File(attatchPath+"/"+fran.getHead_code()+"/fran/file");
		saveFolder = folder.getAbsolutePath();
		folder_BL = new File(attatchPath+"/"+fran.getHead_code()+subPath);
		saveFolder_BL = folder_BL.getAbsolutePath();
	
		if(!folder.exists()) {
			folder.mkdirs();
		}
		if(!folder_BL.exists()) {
			folder_BL.mkdirs();
		}
				
		encodePassword(fran);
		
		int cnt = hfmanageDAO.insertFran(fran);
		
		logger.info("가맹점 삽입후 cnt : " + cnt);
		
		if(cnt>0) {
			cnt = 0;
			cnt += prodcesses(fran);
		}
		
		logger.info("가맹점 파일첨부 후 cnt : " + cnt);
		
		String code = fran.getHead_code();
		String RoyaltyApliDay = hfmanageDAO.selectRoyaltyApliDay(code);
		HeadBillVO bill = new HeadBillVO();
		bill.setFran_code(fran.getFran_code());
		bill.setHead_code(code);
		bill.setBilclct_schde(fran.getFran_opende());
		bill.setRoyalty_apli_start_de(RoyaltyApliDay);
		
		if(cnt>0) {
			cnt = 0;
			cnt += hfmanageDAO.insertBill(bill);
		}
		
		logger.info("가맹비 내역 추가후 cnt : " + cnt);
		
		if(cnt>0) {
			result = ServiceResult.OK;
		}

		return result;
	}
	
	private int prodcesses(FranchiseVO vo) {
		int cnt = 0;
		List<AttachfileVO> attatchList = vo.getAttachfileList();
		
		if(attatchList != null && attatchList.size()>0) {
			
			for(int i=0; i<attatchList.size(); i++) {
				AttachfileVO att = attatchList.get(i);
				if(i==0) {
					att.setFile_path(saveFolder_BL);
				}else {
					att.setFile_path(saveFolder);
				}
				attatchList.set(i, att);
			}
			cnt += hfmanageDAO.insertAttatches(vo);
			try {
				for(int i=0; i<attatchList.size(); i++) {
					AttachfileVO attatch = attatchList.get(i);
					if(i==0) {
						attatch.saveTo(saveFolder_BL);
					}else {
						attatch.saveTo(saveFolder);
					}
					attatchList.set(i, attatch);
				}
			} catch (IOException e){
				throw new RuntimeException(e);
			}
		}
		return cnt;
	}
	
	private void encodePassword(FranchiseVO vo) {
		String head_pass = vo.getFran_pass();
		if(StringUtils.isBlank(head_pass)) return;
		try {
			String encodedPass = CryptoUtil.sha512(head_pass);
			vo.setFran_pass(encodedPass);
		} catch(NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public Map<String, String> retrieveHeadInfo(String head_code) {
		return hfmanageDAO.selectHeadInfo(head_code);
	}
	
	@Override
	public List<FranchiseVO> retrieveFranMap(String code) {
		return hfmanageDAO.selectFranMap(code);
	}

	@Override
	public int updateFranClose(String fran_code) {
		return hfmanageDAO.updateFranClose(fran_code);
	}

	@Override
	public int updateFranRestore(String fran_code) {
		return hfmanageDAO.updateFranRestore(fran_code);
	}
}