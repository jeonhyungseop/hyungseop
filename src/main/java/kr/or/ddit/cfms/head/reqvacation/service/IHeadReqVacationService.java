package kr.or.ddit.cfms.head.reqvacation.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.reqvacation.vo.ReqVacationListVO;
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
 * 2021. 6. 17    진예은           휴가요청승인(인사팀)
 * 2021. 6. 18    진예은           인사팀 휴가 캘린더조회
 * 2021. 6. 21    진예은           휴가요청 일괄승인
 * 2021. 6. 21    진예은           변경된 월에 휴가낸 사원목록 출력
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IHeadReqVacationService {

	//휴가승인 요청 리스트
	public List<VacationVO> reqVacationList(PagingVO<VacationVO> pagingVO);
	
	//휴가승인 요청 COUNT
	public int reqVacationCount(PagingVO<VacationVO> pagingVO);
	
	//휴가승인
	public ServiceResult okVacation(VacationVO vacationVO);
	
	//휴가반려
	public ServiceResult noVacation(int seq);
	
	//인사팀 휴가 캘린더 조회
	public List<VacationVO> reqCalendar(String headCode);
	
	//이번달 직원휴가목록
	public List<VacationVO> selectCurrentMonth(String code);
	
	//휴가요청 일괄승인
	public ServiceResult vacationAllUpdate(ReqVacationListVO reqVacationListVO);
	
	//변경된 월 출력
	public List<VacationVO> selectChangeMonth(VacationVO vacationVO);
	
	
}
