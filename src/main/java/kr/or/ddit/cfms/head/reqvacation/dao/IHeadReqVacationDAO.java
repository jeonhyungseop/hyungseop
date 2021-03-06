package kr.or.ddit.cfms.head.reqvacation.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
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
 * 2021. 6. 17      진예은       휴가 요청승인(인사팀)
 * 2021. 6. 18      진예은       인사팀 휴가 캘린더조회
 * 2021. 6. 19      진예은       이번달  직원 휴가 목록
 * 2021. 6. 21      진예은       휴가요청 일괄승인
 * 2021. 6. 21      진예은       변경된 월에 휴가낸 사원목록 출력
 * 2021. 6. 23      진예은        휴가 승인시 남은 휴가일 빼기
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IHeadReqVacationDAO {

	//휴가승인요청 리스트
	public List<VacationVO> reqVacationList(PagingVO<VacationVO> pagingVO);
	
	//휴가승인 요청 COUNT
	public int reqVacationCount(PagingVO<VacationVO> pagingVO);
	
	//휴가승인
	public int okVacation(VacationVO vacationVO);
	
	//잔여 휴가일 빼기
	public int updateRemndrVcde(VacationVO vacationVO);
	
	//휴가반려
	public int noVacation(int seq);
	
	//인사팀 휴가 캘린더 조회
	public List<VacationVO> reqCalendar(String headCode);
	
	//이번달 직원 휴가목록
	public List<VacationVO> selectCurrentMonth(String headCode);
	
	//휴가요청 일괄승인
	public int vacationAllUpdate(ReqVacationListVO reqVacationListVO);
	
	//변경된 월 출력
	public List<VacationVO> selectChangeMonth(VacationVO vacationVO);
}

