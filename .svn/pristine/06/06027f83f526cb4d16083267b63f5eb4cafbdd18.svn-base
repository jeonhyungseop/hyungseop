package kr.or.ddit.cfms.head.vacation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.head.vacation.dao.IHeadVacationDAO;
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
 * 2021. 6. 17      진예은       휴가 조회(캘린더) 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class HeadVacationServiceImpl implements IHeadVacationService {

	@Inject
	private IHeadVacationDAO headvacationDAO;

	//휴가조회
	@Override
	public List<VacationVO> selectCalendarList(String empId) {
		
		
		return headvacationDAO.selectCalendarList(empId);
	}
	
	
	
}
