package kr.or.ddit.cfms.admin.commons.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

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
 * 2021, 6. 22     진예은          dash보드 순서 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IAdminMainDAO {
	
	//dash보드 순서 조회
	public List<DashVO> selectAdminDashOrd();

	
	//dash보드 순서 업데이트
	public int updateAdminDashOrd(DashListVO dashListVO);
}
