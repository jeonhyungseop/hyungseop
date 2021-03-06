package kr.or.ddit.cfms.head.changeatt.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.attendance.dao.IHeadAttendanceDAO;
import kr.or.ddit.cfms.head.changeatt.dao.IHeadChangeAttDAO;
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
 * 2021. 6. 11      진예은        수정요청관리
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class HeadChangeAttServiceImpl implements IHeadChangeAttService {

	@Inject
	private IHeadChangeAttDAO headChangeDAO;
	
	//수정요청관리
	@Override
	public List<DclzVO> selectChangeAtt(PagingVO<DclzVO> pagingVO) {
		
		return headChangeDAO.selectChangeAtt(pagingVO);
	}

	//수정요청관리 COUNT
	@Override
	public int selectChangeAttCount(PagingVO<DclzVO> pagingVO) {
		
		return headChangeDAO.selectChangeAttCount(pagingVO);
	}

	//수정요청 승인
	@Override
	public ServiceResult ChangeOKUpdate(DclzVO dclzVO) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = headChangeDAO.ChangeOKUpdate(dclzVO);
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}
	
	//9시전 수정요청 승인
	@Override
	public ServiceResult ChangeOKBeforeUpdate(DclzVO dclzVO) {

		ServiceResult result = ServiceResult.FAIL;
		int cnt = headChangeDAO.ChangeOKBeforeUpdate(dclzVO);
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}

	
	//수정요청 반려
	@Override
	public ServiceResult ChangeRejectUpdate(int seq) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = headChangeDAO.ChangeRejectUpdate(seq);
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}

	
	//수정 일괄 승인
	@Override
	public ServiceResult ChangeAllUpdate(ChangeAttendanceListVO changeAttendanceListVO) {
		
		ServiceResult result = ServiceResult.FAIL;
		int cnt = headChangeDAO.ChangeAllUpdate(changeAttendanceListVO);
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}

	

	
}
