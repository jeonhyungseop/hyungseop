package kr.or.ddit.cfms.head.employee.service;
/**
 * @author 진예은
 * @since 2021. 6. 7
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24      작성자명       최초작성
 * 2021. 6. 7       진예은          직원목록 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

import java.util.List;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;

public interface IHeadEmployeeService {
	
	//직원목록조회
	public List<EmployeeVO> selectEmpList(PagingVO<EmployeeVO> pagingVO);
	
	//직원 COUNT
	public int selectEmpCount(PagingVO<EmployeeVO> pagingVO);

	//공통코드 직급목록조회
	public List<ComCodeVO> comcodeECL();
	
	//공통코드 직원구분
	public List<ComCodeVO> comcodeESE();
	
	//직원등록여부
	public List<EmployeeVO> selectEmpUseAt(String code);
	
	//직원있는 경우 등록
	public ServiceResult insertEmpOk(EmployeeVO employeeVO);
	
	//직원없는 경우 등록
	public ServiceResult insertEmpNo(EmployeeVO employeeVO);
	
	//부서코드모음
	public List<DeptVO> selectDept(String code);

	//직원상세조회
	public EmployeeVO selectEmpOne(String empId);

	//직원수정
	public ServiceResult updateEmployee(EmployeeVO employeeVO);
	
	//직원퇴사처리
	public ServiceResult retdeEmp(String empId);
	
}
