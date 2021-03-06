package kr.or.ddit.cfms.head.commute.service;

import kr.or.ddit.cfms.enumpkg.ServiceResult;
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
 * 2021. 5. 24      작성자명       최초작성
 * 2021. 6. 7       진예은          직원출근체크
 * 2021. 6. 15      진예은          직원퇴근체크
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IHeadCommuteService {

	//직원출근체크
	public ServiceResult insertGoToWork(DclzVO dclzVO);
	
	//직원퇴근체크
	public ServiceResult updateGoHome(DclzVO dclzVO);
	
}
