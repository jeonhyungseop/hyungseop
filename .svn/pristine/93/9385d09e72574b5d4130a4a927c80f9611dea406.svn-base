package kr.or.ddit.cfms.head.attendance.service;
/**
 * @author 진예은
 * @since 2021. 6. 7
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 7       진예은         직원근태 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

import java.util.List;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;

public interface IHeadAttendanceService {

	//직원근태 목록
	public List<DclzVO> selectEmpWorkList(PagingVO<DclzVO> pagingVO);
	
	//직원근태 COUNT
	public int selectEmpWorkCount(PagingVO<DclzVO> pagingVO);
	
	
}
