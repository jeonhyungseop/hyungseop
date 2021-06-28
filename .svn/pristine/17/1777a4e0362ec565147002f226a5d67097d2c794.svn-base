package kr.or.ddit.cfms.head.mypage.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.mypage.vo.headVO;
import kr.or.ddit.cfms.head.mypage.vo.vmemberVO;

public interface IHeadMypageService {
	
	//마이페이지 조회
	public EmployeeVO selectMyOne(String empId);
	
	//마이페이지 수정
	public ServiceResult updateMypage(EmployeeVO employeeVO);
	
	
	//공통코드 직급목록조회
	public List<ComCodeVO> comcodeECL();
	
	//공통코드 직원구분
	public List<ComCodeVO> comcodeESE();
	
	public vmemberVO selectSe(String id);
	public headVO selectHeadMy(String mem_id);
	
	public ServiceResult updateheadMypage(headVO headVO);

	
}
