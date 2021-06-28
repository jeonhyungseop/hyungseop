package kr.or.ddit.cfms.head.mysalary.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.mysalary.dao.IHeadMySalaryDAO;
import kr.or.ddit.cfms.head.mysalary.vo.SalaryVO;

/**
 * @author 진예은
 * @since 2021. 6. 23
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 23      진예은        직원 급여명세서 조회
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class HeadMySalaryServiceImpl implements IHeadMySalaryService {

	@Inject
	private IHeadMySalaryDAO mySalaryDAO;

	//급여명세서 조회
	@Override
	public List<SalaryVO> selectMySalaryList(PagingVO<SalaryVO> pagingVO) {

		return mySalaryDAO.selectMySalaryList(pagingVO);
	}

	@Override
	public int selectMySalaryCount(PagingVO<SalaryVO> pagingVO) {

		return mySalaryDAO.selectMySalaryCount(pagingVO);
	}
	
	
	
}
