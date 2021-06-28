package kr.or.ddit.cfms.head.mysalary.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
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
 * 2021. 6. 23      진예은         나의 급여명세서 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IHeadMySalaryDAO {
	
	//급여명세서 조회
	public List<SalaryVO> selectMySalaryList(PagingVO<SalaryVO> pagingVO);

	//급여명세서 COUNT
	public int selectMySalaryCount(PagingVO<SalaryVO> pagingVO);
	
	
	
}
