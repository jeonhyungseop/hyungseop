package kr.or.ddit.cfms.sign.service;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.mail.Multipart;
import javax.management.RuntimeErrorException;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.sign.dao.ISignDAO;
import kr.or.ddit.cfms.utils.CryptoUtil;

/**
 * @author 진유리
 * @since 2021. 5. 26
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 26   진유리       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class SignServiceImpl implements ISignService {
	private static final Logger logger = LoggerFactory.getLogger(SignServiceImpl.class);
	
	@Inject
	private ISignDAO signDAO;
	
	@Value("#{appInfo.attatch}")
	private String attatchPath;
	
	private String saveFolder;
	private File folder;
	
	@Override
	public int idCheck(String id) {
		return signDAO.idcheck(id);
	}
	
	@Override
	public int bizrnoCheck(String bizrno) {
		return signDAO.bizrnocheck(bizrno);
	}

	@Override
	public ComCodeGrpVO retrieveCodeList(String code) {
		return signDAO.selectCodeList(code);
	}

	@Override
	public int selectNumber(String name) {
		return signDAO.selectNumber(name);
	}
	
	@Override
	@Transactional
	public ServiceResult insertHeadQuarter(HeadquartersVO vo) {
		ServiceResult result = ServiceResult.FAIL;
		folder = new File(attatchPath+"/"+vo.getHead_code()+"/headBL");
		saveFolder = folder.getAbsolutePath();
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		encodePassword(vo);
		
		int cnt = signDAO.insertHeadQuarter(vo);
		
		logger.info("가맹본부 삽입후 cnt : " + cnt);
		
		if(cnt>0){
			cnt = 0;
			cnt += signDAO.insertStipulation(vo);
		}
		logger.info("약관이후 cnt : " + cnt);
		
		if(cnt>0) {
			cnt = 0;
			cnt += prodcesses(vo);
		}
		logger.info("파일첨부후 cnt : " + cnt);
		if(cnt>0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}
	
	private int prodcesses(HeadquartersVO vo) {
		int cnt = 0;
		List<AttachfileVO> attatchList = vo.getAttachfileList();
		
		if(attatchList != null && attatchList.size()>0) {
			
			for(AttachfileVO att : attatchList) {
				att.setFile_path(saveFolder);
			}
			cnt += signDAO.insertAttatches(vo);
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

	private void encodePassword(HeadquartersVO vo) {
		String head_pass = vo.getHead_pass();
		if(StringUtils.isBlank(head_pass)) return;
		try {
			String encodedPass = CryptoUtil.sha512(head_pass);
			vo.setHead_pass(encodedPass);
		} catch(NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

}
