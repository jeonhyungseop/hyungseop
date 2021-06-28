package kr.or.ddit.cfms.head.commute.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commute.dao.IHeadCommuteDAO;
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
 * 2021. 6. 10      진예은        직원근태관리(출근)
 * 2921, 6. 15      진예은        직원퇴근체크
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class HeadCommuteServiceImpl implements IHeadCommuteService {

	@Inject
	private IHeadCommuteDAO headCommuteDAO;
	
	//직원출근 체크
	@Transactional
	@Override
	public ServiceResult insertGoToWork(DclzVO dclzVO) {

		ServiceResult result = ServiceResult.FAIL;
		int cnt = headCommuteDAO.insertGoToWork(dclzVO);
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		return result;
	}
	
	
	//직원퇴근 체크
	@Transactional
	@Override
	public ServiceResult updateGoHome(DclzVO dclzVO) {
		
		ServiceResult result = ServiceResult.FAIL;
		int cnt = headCommuteDAO.updateGoHome(dclzVO);
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		return result;
	}

}
