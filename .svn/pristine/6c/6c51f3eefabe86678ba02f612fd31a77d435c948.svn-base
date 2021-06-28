package kr.or.ddit.cfms.head.salary.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.mysalary.vo.SalaryVO;
import kr.or.ddit.cfms.head.salary.dao.IHeadSalaryDAO;

/**
 * @author 진예은
 * @since 2021. 6. 23
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 23      진예은        인사팀 급여명세서 조회
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class HeadSalaryServiceImpl implements IHeadSalaryService {

	@Inject
	private IHeadSalaryDAO salaryDAO;

	//인사팀 급여명세서
	@Override
	public List<SalaryVO> selectSalaryList(PagingVO<SalaryVO> pagingVO) {

		return salaryDAO.selectSalaryList(pagingVO);
	}

	//인사팀 급여명세서 COUNT
	@Override
	public int selectSalaryCount(PagingVO<SalaryVO> pagingVO) {

		return salaryDAO.selectSalaryCount(pagingVO);
	}
	
	
}
