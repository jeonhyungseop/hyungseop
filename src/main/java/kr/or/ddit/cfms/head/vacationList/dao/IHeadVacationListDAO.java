package kr.or.ddit.cfms.head.vacationList.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.vacationList.vo.VacationVO;

/**
 * @author 진예은
 * @since 2021. 6. 16
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 16      진예은       휴가현황 조회
 * 2021. 6. 17      진예은       휴가 등록(직원)
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IHeadVacationListDAO {
	
	//휴가현황 조회하기
	public List<VacationVO> selectVacationList(PagingVO<VacationVO> pagingVO);

	//휴가현황 COUNT
	public int selectVacationCount(PagingVO<VacationVO> pagingVO);
	
	//휴가 잔여일 조회
	public EmployeeVO selectEmpBaseVacation(String empId);

	//휴가 구분코드 조회
	public List<ComCodeVO> selectComCodeVSC();
	
	//휴가등록
	public int insertVacation(VacationVO vacationVO);
	
}
