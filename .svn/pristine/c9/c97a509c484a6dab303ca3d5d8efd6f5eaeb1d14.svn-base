package kr.or.ddit.cfms.head.myattendance.dao;

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
 * 2021. 6. 11      진예은         나의 근태내역 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IHeadMyAttendanceDAO {

	//나의 근태내역 조회
	public List<DclzVO> selectMyAttendanceList(PagingVO<DclzVO> pagingVO);
	
	//나의 근태내역 COUNT
	public int selectMyAttendanceCount(PagingVO<DclzVO> pagingVO);
	
	//나의 근태내역 수정
	public int updateWorkList(DclzVO dclzVO);
	
}
