package kr.or.ddit.cfms.head.royal.service;

import java.util.List;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.royal.dao.IHeadRoyalDAO;
import kr.or.ddit.cfms.head.royal.vo.HeadBillVO;
import kr.or.ddit.cfms.head.royal.vo.HeadRoyalVO;

/**
 * @author 진유리
 * @since 2021. 06. 09
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * ------------     --------    ----------------------
 * 2021. 06. 09     진유리         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class HeadRoyalServiceImpl implements IHeadRoyalService {
	private static final Logger logger = LoggerFactory.getLogger(HeadRoyalServiceImpl.class);
	
	@Inject
	private IHeadRoyalDAO royalDAO;
		
	@Override
	public ComCodeGrpVO retrieveCodeList(String code) {
		return royalDAO.selectCodeList(code);
	}

	@Override
	public int retrievetBillCount(PagingVO<HeadBillVO> pagingVO) {
		return royalDAO.selectBillCount(pagingVO);
	}

	@Override
	public List<HeadBillVO> retrieveBillList(PagingVO<HeadBillVO> pagingVO) {
		return royalDAO.selectBillList(pagingVO);
	}

	@Override
	public List<HeadRoyalVO> retrieveRoyalChart(String code) {
		return royalDAO.selectRoyalChart(code);
	}

	@Override
	public List<HeadRoyalVO> retrieveRoyalList(PagingVO<HeadRoyalVO> pagingVO) {
		return royalDAO.selectRoyalList(pagingVO);
	}

	@Override
	public int retrieveRoyalCount(PagingVO<HeadRoyalVO> pagingVO) {
		return royalDAO.selectRoyalCount(pagingVO);
	}

	@Override
	public int insertRoyal(HeadRoyalVO royal) {
		return royalDAO.insertRoyal(royal);
	}
	
}