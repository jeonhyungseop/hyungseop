package kr.or.ddit.cfms.head.attendance.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.attendance.dao.IHeadAttendanceDAO;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;

/**
 * @author 진예은
 * @since 2021. 6. 7
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 7       진예은        직원근태 조회
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class HeadAttendanceServiceImpl implements IHeadAttendanceService {

	@Inject
	private IHeadAttendanceDAO headAttendanceDAO;

	//직원근태 목록조회
	@Override
	public List<DclzVO> selectEmpWorkList(PagingVO<DclzVO> pagingVO) {

		return headAttendanceDAO.selectEmpWorkList(pagingVO);
	}

	//직원근태 목록COUNT
	@Override
	public int selectEmpWorkCount(PagingVO<DclzVO> pagingVO) {
		
		return headAttendanceDAO.selectEmpWorkCount(pagingVO);
	}
	
	
}
