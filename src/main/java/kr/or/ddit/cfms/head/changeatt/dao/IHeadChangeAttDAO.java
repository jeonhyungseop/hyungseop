package kr.or.ddit.cfms.head.changeatt.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.changeatt.vo.ChangeAttendanceListVO;
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
 * 2021. 6. 11      진예은         수정요청관리
 * 2021, 6. 14      진예은         수정요청 반려
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IHeadChangeAttDAO {

	//수정요청관리
	public List<DclzVO> selectChangeAtt(PagingVO<DclzVO> pagingVO);
	
	//수정요청관리 COUNT
	public int selectChangeAttCount(PagingVO<DclzVO> pagingVO);
	
	//수정요청 승인
	public int ChangeOKUpdate(DclzVO dclzVO);

	//수정요청 승인
	public int ChangeOKBeforeUpdate(DclzVO dclzVO);
	
	
	//수정요청 반려
	public int ChangeRejectUpdate(int seq);
	
	//수정 일괄승인
	public int ChangeAllUpdate(ChangeAttendanceListVO changeAttendanceListVO);
	
	
	
	
}
