package kr.or.ddit.cfms.fran.deposit.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.deposit.dao.IFranDepositDAO;
import kr.or.ddit.cfms.fran.deposit.vo.FrdsmnVO;

/**
 * @author 배수진
 * @since 2021. 5. 31
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class FranDepositServiceImpl implements IFranDepositService {

private static Logger logger = LoggerFactory.getLogger(FranDepositServiceImpl.class);
	
	private IFranDepositDAO depositDAO;
	
	@Inject
	public void setDepositDAO(IFranDepositDAO depositDAO) {
		this.depositDAO = depositDAO;
		logger.info("주입된 boardDAO : {}", depositDAO.getClass().getName());
	}
	
	@Override
	public int retrieveFranDepositCount(PagingVO<FrdsmnVO> pagingVO) {
		int count = depositDAO.selectFranDepositCount(pagingVO);
		if(count == 0) count = 1;
		return count;
	}

	@Override
	public List<FrdsmnVO> retrieveFranDepositList(PagingVO<FrdsmnVO> pagingVO) {
		return depositDAO.selectFranDepositList(pagingVO);
	}

	@Override
	public int createFranDeposit(FrdsmnVO depositVO) {
		return depositDAO.insertFranDeposit(depositVO);
	}

	@Override
	public int retireveFranDepositBlce(FrdsmnVO depositVO) {
		return depositDAO.selectFranDepositblce(depositVO);
	}
	
	@Override
	public String retireveAuthIdTable(String authId) {
		return depositDAO.selectAuthIdTable(authId);
	}

}
