package kr.or.ddit.cfms.admin.commons.service;

import java.util.List;

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
public interface IAdminMainService {
	
	//dash보드 순서조회
	public List<DashVO> selectAdminDashOrd();

	//dash보드 순서 업데이트
	public ServiceResult updateAdminDashOrd(DashListVO dashListVO);
}
