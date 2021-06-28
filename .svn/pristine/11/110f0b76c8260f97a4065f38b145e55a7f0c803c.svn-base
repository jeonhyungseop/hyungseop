package kr.or.ddit.cfms.head.headmypage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.mypage.vo.headVO;
@Repository
public interface IHHeadMypageDAO {

	
	//마이페이지 조회
	public EmployeeVO selectMyOne(String empId);	
	
	//마이페이지 수정
	public int updateMypage(EmployeeVO employeeVO);
	
	//공통코드 직급목록조회
	public List<ComCodeVO> comcodeECL();
	
	//공통코드 직원구분
	public List<ComCodeVO> comcodeESE();
	
	public EmployeeVO selectMemberForAuth(String mem_id);
	
	
}
