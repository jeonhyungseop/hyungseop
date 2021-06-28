package kr.or.ddit.cfms.head.changeatt.service;
/**
 * @author 진예은
 * @since 2021. 6. 7
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11       진예은       수정요청관리
 * 2021, 6. 15       진예은       수정요청반려
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

import java.util.List;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.changeatt.vo.ChangeAttendanceListVO;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;

public interface IHeadChangeAttService {

	//수정요청관리
	public List<DclzVO> selectChangeAtt(PagingVO<DclzVO> pagingVO);
	
	//수정요청관리 COUNT
	public int selectChangeAttCount(PagingVO<DclzVO> pagingVO);
	
	//수정요청 승인
	public ServiceResult ChangeOKUpdate(DclzVO dclzVO);
	
	//수정요청 승인 9시이전
	public ServiceResult ChangeOKBeforeUpdate(DclzVO dclzVO);
	
	//수정요청 반려
	public ServiceResult ChangeRejectUpdate(int seq);
	
	//수정 일괄 승인
	public ServiceResult ChangeAllUpdate(ChangeAttendanceListVO changeAttendanceListVO);
	
}
