package kr.or.ddit.cfms.head.employee.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;

/**
 * @author 진예은
 * @since 2021. 6. 7
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 7      진예은         직원목록 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IHeadEmployeeDAO {
	
	//직원목록조회
	public List<EmployeeVO> selectEmpList(PagingVO<EmployeeVO> pagingVO);

	//직원COUNT
	public int selectEmpCount(PagingVO<EmployeeVO> pagingVO);
	
	//공통코드 직급목록조회
	public List<ComCodeVO> comcodeECL();
	
	//공통코드 직원구분
	public List<ComCodeVO> comcodeESE();
	
	//직원등록여부
	public List<EmployeeVO> selectEmpUseAt(String code);
	
	//직원있는경우 등록
	public int insertEmpOk(EmployeeVO employeeVO);
	
	//직원없는경우 등록
	public int insertEmpNo(EmployeeVO employeeVO);
	
	//부서코드모음
	public List<DeptVO> selectDept(String code);
	
	//파일업로드
	public int insertEmpImage(EmployeeVO employeeVO);
	
	//직원상세조회
	public EmployeeVO selectEmpOne(String empId);
	
	//파일삭제
	public int deleteEmpAttatches(String before_file_no);
	
	//saveNames삭제 select
	public List<String> selectEmpSaveNamesForDelete(String before_file_no);
	
	//직원수정
	public int updateEmployee(EmployeeVO employeeVO);
	
	//직원 이미지 없을때 수정
	public int updateNoImgEmployee(EmployeeVO employeeVO);
	
	//직원퇴사처리
	public int retdeEmp(String empId);
	
	//직원출큰체크 여부 확인
	public DclzVO selectAttendCheck(String empId);
	
}
