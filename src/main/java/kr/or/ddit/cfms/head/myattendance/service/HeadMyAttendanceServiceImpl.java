package kr.or.ddit.cfms.head.myattendance.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.myattendance.dao.IHeadMyAttendanceDAO;

/**
 * @author 진예은
 * @since 2021. 6. 7
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11       진예은        나의 근태내역 조회
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class HeadMyAttendanceServiceImpl implements IHeadMyAttendanceService {

	@Inject
	private IHeadMyAttendanceDAO myAttendanceDAO;

	//나의 근태목록 조회
	@Override
	public List<DclzVO> selectMyAttendanceList(PagingVO<DclzVO> pagingVO) {
		
		return myAttendanceDAO.selectMyAttendanceList(pagingVO);
	}

	//나의 근태목록COUNT
	@Override
	public int selectMyAttendanceCount(PagingVO<DclzVO> pagingVO) {
		
		return myAttendanceDAO.selectMyAttendanceCount(pagingVO);
	}

	//나의 근태내역 수정
	@Override
	public ServiceResult updateWorkList(DclzVO dclzVO) {

		ServiceResult result = ServiceResult.FAIL;
		int cnt = myAttendanceDAO.updateWorkList(dclzVO);
		
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}
	
	
}
