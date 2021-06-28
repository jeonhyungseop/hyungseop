package kr.or.ddit.cfms.admin.commons.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.admin.commons.dao.IAdminMainDAO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commons.vo.DashListVO;
import kr.or.ddit.cfms.head.commons.vo.DashVO;

/**
 * @author 진예은
 * @since 2021. 6. 7
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 22      진예은        dash보드 순서 조회
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class AdminMainServiceImpl implements IAdminMainService {

	@Inject
	private IAdminMainDAO adminDAO;

	//dash보드 순서조회
	@Override
	public List<DashVO> selectAdminDashOrd() {
		
		return adminDAO.selectAdminDashOrd();
	}

	@Override
	public ServiceResult updateAdminDashOrd(DashListVO dashListVO) {

		ServiceResult result = ServiceResult.FAIL;
		int cnt = adminDAO.updateAdminDashOrd(dashListVO);
		
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}
	
}

