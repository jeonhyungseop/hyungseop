package kr.or.ddit.cfms.head.deposit.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.deposit.dao.IHeadDepositDAO;
import kr.or.ddit.cfms.head.deposit.vo.HeadsmnVO;

/**
 * @author 작성자명
 * @since 2021. 5. 25
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class HeadDepositServiceImpl implements IHeadDepositService {
	private static Logger logger = LoggerFactory.getLogger(HeadDepositServiceImpl.class);
	
	private IHeadDepositDAO depositDAO;
	
	@Inject
	public void setDepositDAO(IHeadDepositDAO depositDAO) {
		this.depositDAO = depositDAO;
		logger.info("주입된 depositDAO : {}", depositDAO.getClass().getName());
	}
	
	@Override
	public int retrieveHeadDepositCount(PagingVO<HeadsmnVO> pagingVO) {
		int count = depositDAO.selectHeadDepositCount(pagingVO);
		if(count == 0) count = 1;
		return count;
	}

	@Override
	public List<HeadsmnVO> retrieveHeadDepositList(PagingVO<HeadsmnVO> pagingVO) {
		return depositDAO.selectHeadDepositList(pagingVO);
	}

	@Override
	public int createHeadDeposit(HeadsmnVO depositVO) {
		return depositDAO.insertHeadDeposit(depositVO);
	}

	@Override
	public int retireveHeadDepositBlce(HeadsmnVO depositVO) {
		return depositDAO.selectHeadDepositblce(depositVO);
	}

	@Override
	public String retireveAuthIdTable(String authId) {
		return depositDAO.selectAuthIdTable(authId);
	}

}
