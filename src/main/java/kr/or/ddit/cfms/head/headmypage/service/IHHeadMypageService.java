package kr.or.ddit.cfms.head.headmypage.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.mypage.vo.headVO;

public interface IHHeadMypageService {
	

	
	//마이페이지 수정
	public ServiceResult updateMypage(EmployeeVO employeeVO);
	
	
	//공통코드 직급목록조회
	public List<ComCodeVO> comcodeECL();
	
	//공통코드 직원구분
	public List<ComCodeVO> comcodeESE();

	public headVO selectHeadMy(String mem_id);

}
