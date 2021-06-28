package kr.or.ddit.cfms.fran.inven.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.exception.CustomException;
import kr.or.ddit.cfms.fran.inven.dao.IFranInvenDAO;
import kr.or.ddit.cfms.fran.inven.vo.FranInvenListVO;
import kr.or.ddit.cfms.fran.inven.vo.FranInvenVO;
import kr.or.ddit.cfms.fran.prod.vo.FranProdVO;
import kr.or.ddit.cfms.head.inven.service.HeadInvenServiceImpl;

/**
 * @author 이진수
 * @since 2021. 5. 26
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 26      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class FranInvenServiceImpl implements IFranInvenService{
	private static final Logger logger = LoggerFactory.getLogger(FranInvenServiceImpl.class);
	
	@Inject
	private IFranInvenDAO franDAO;

	@Override
	public int retrieveFranInvenCount(PagingVO<FranInvenVO> pagingVO) {
		return franDAO.selectFranInvenCount(pagingVO);
	}
	
	@Override
	public List<FranInvenVO> retrieveFranInvenList(PagingVO<FranInvenVO> pagingVO) {
		return franDAO.selectFranInvenList(pagingVO);
	}

	@Override
	public FranInvenVO retrieveFranInven(FranInvenVO franInvenVO) {
		FranInvenVO franInven = franDAO.selectFranInven(franInvenVO);
		if(franInven == null) {
			throw new CustomException(franInven+"에 해당하는 게시글이 없습니다.");
		}
		return franInven;
	}

	@Transactional
	@Override
	public ServiceResult removeFranInven(FranInvenVO franInvenVO) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = franDAO.deleteFranInven(franInvenVO);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public List<FranInvenVO> retrieveFranProdList(FranInvenVO franInvenVO) {
		return franDAO.selectFranProdList(franInvenVO);
	}

	@Override
	public int modifyFranInven(FranInvenListVO franInvenListVO) {
		int success = 0;
		for(FranInvenVO franInvenVO : franInvenListVO.getFranInvenListVO()) {
			ServiceResult result =  modifyFranInvenList(franInvenVO);
			if(ServiceResult.OK.equals(result)) {
				success++;
			}
		}
		return success;
	}
	private ServiceResult modifyFranInvenList(FranInvenVO franInvenVO) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = franDAO.updateFranInven(franInvenVO);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}
	

}
