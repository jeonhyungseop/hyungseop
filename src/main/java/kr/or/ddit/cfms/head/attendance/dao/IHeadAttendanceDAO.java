package kr.or.ddit.cfms.head.attendance.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
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
 * 2021. 6. 7      진예은         직원 근태내역 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IHeadAttendanceDAO {

	//직원근태 목록
	public List<DclzVO> selectEmpWorkList(PagingVO<DclzVO> pagingVO);
	
	//직원근태 COUNT
	public int selectEmpWorkCount(PagingVO<DclzVO> pagingVO);
	
	//직원 출근 시간
	public String selectAttendanceTime(DclzVO dclzVO);
	
	//직원 퇴근시간
	public String selectLvffcTime(DclzVO dclzVO);
	
	//직원근태시간 합계 업데이트
	public int updateAttLvfTime(DclzVO dclzVO);
	
}
