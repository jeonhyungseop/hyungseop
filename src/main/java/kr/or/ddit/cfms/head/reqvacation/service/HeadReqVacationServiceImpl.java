package kr.or.ddit.cfms.head.reqvacation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.reqvacation.dao.IHeadReqVacationDAO;
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
 * 2021. 6. 18      진예은      인사팀 휴가 캘린더 조회
 * 2021. 6. 21      진예은      휴가요청 일괄승인
 * 2021. 6. 21      진예은      변경된 월에 휴가낸 사원목록 출력
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class HeadReqVacationServiceImpl implements IHeadReqVacationService {

	@Inject
	private IHeadReqVacationDAO reqDAO;

	//휴가 승인요청 리스트
	@Override
	public List<VacationVO> reqVacationList(PagingVO<VacationVO> pagingVO) {

		
		return reqDAO.reqVacationList(pagingVO);
	}

	//휴가 승인요청 COUNT
	@Override
	public int reqVacationCount(PagingVO<VacationVO> pagingVO) {

		return reqDAO.reqVacationCount(pagingVO);
	}

	//휴가승인
	@Transactional
	@Override
	public ServiceResult okVacation(VacationVO vacationVO) {
		
		ServiceResult result = ServiceResult.FAIL;
		int cnt = reqDAO.okVacation(vacationVO);
		if(cnt > 0) {
			reqDAO.updateRemndrVcde(vacationVO);
			result =  ServiceResult.OK;
		}
		
		return result;
	}

	//휴가반려
	@Override
	public ServiceResult noVacation(int seq) {
		
		ServiceResult result = ServiceResult.FAIL;
		int cnt = reqDAO.noVacation(seq);
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}

	//인사팀 휴가 캘린더 조회
	@Override
	public List<VacationVO> reqCalendar(String headCode) {
		
		
		return reqDAO.reqCalendar(headCode);
	}

	//이번달 직원 휴가
	@Override
	public List<VacationVO> selectCurrentMonth(String code) {
		
		return reqDAO.selectCurrentMonth(code);
	}

	//휴가요청 일괄승인
	@Override
	@Transactional
	public ServiceResult vacationAllUpdate(ReqVacationListVO reqVacationListVO) {
		
		ServiceResult result = ServiceResult.FAIL;
		int cnt = reqDAO.vacationAllUpdate(reqVacationListVO);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

	
	
	@Override
	public List<VacationVO> selectChangeMonth(VacationVO vacationVO) {

		return reqDAO.selectChangeMonth(vacationVO);
	}
	
}
