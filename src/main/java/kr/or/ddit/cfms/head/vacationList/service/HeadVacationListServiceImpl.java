package kr.or.ddit.cfms.head.vacationList.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.vacationList.dao.IHeadVacationListDAO;
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
 * 2021. 6. 16      진예은       휴가현황조회
 * 2021. 6. 17      진예은       휴가 등록(직원) 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class HeadVacationListServiceImpl implements IHeadVacationListService {

	@Inject
	private IHeadVacationListDAO vacationlistDAO;

	//휴가현황 조회
	@Override
	public List<VacationVO> selectVacationList(PagingVO<VacationVO> pagingVO) {
		
		return vacationlistDAO.selectVacationList(pagingVO);
	}

	//휴가현황 COUNT
	@Override
	public int selectVacationCount(PagingVO<VacationVO> pagingVO) {

		return vacationlistDAO.selectVacationCount(pagingVO);
	}

	//휴가 잔여일 조회
	@Override
	public EmployeeVO selectEmpBaseVacation(String empId) {

		return vacationlistDAO.selectEmpBaseVacation(empId);
	}

	//휴가 구분코드 조회
	@Override
	public List<ComCodeVO> selectComCodeVSC() {
		
		return vacationlistDAO.selectComCodeVSC();
	}

	
	//휴가등록
	@Override
	public ServiceResult insertVacation(VacationVO vacationVO) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = vacationlistDAO.insertVacation(vacationVO);
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}
	
	
}
