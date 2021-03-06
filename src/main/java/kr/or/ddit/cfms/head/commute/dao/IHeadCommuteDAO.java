package kr.or.ddit.cfms.head.commute.dao;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.head.commute.vo.DclzVO;

/**
 * @author 이진수
 * @since 2021. 5. 19
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 19      작성자명       최초작성
 * 2021. 6. 10      진예은          직원 출근체크
 * 2021. 6. 15      진예은          직원 퇴근체크
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IHeadCommuteDAO {
	
	//직원 출퇴근 체크
	public int insertGoToWork(DclzVO dclzVO);
	
	//직원 퇴근체크
	public int updateGoHome(DclzVO dclzVO);

}
