package kr.or.ddit.cfms.fran.mypage.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.mypage.vo.franMypageVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.mypage.vo.headVO;
import kr.or.ddit.cfms.head.mypage.vo.vmemberVO;

public interface IFranMypageService {
	
	public franMypageVO selectFranMy(String mem_id);
	
	public ServiceResult updatefranMypage(franMypageVO franmypagevo);
	

	
	
	
}
