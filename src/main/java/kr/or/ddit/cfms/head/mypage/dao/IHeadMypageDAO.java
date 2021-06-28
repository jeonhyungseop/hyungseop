package kr.or.ddit.cfms.head.mypage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.mypage.vo.headVO;
import kr.or.ddit.cfms.head.mypage.vo.vmemberVO;

@Repository
public interface IHeadMypageDAO {

	// 마이페이지 조회
	public EmployeeVO selectMyOne(String empId);

	// 마이페이지 수정
	public int updateMypage(EmployeeVO employeeVO);

	public int updateNoImgEmpMyloyee(EmployeeVO headvo);

	// 공통코드 직급목록조회
	public List<ComCodeVO> comcodeECL();

	// 공통코드 직원구분
	public List<ComCodeVO> comcodeESE();

	public EmployeeVO selectMemberForAuth(String mem_id);

	public vmemberVO selectSe(String id);

	public headVO selectHeadMemberForAuth(String mem_id);

	public headVO selectHeadMy(String mem_id);

	public int updateheadMypage(headVO headVO);

	// 파일업로드
	public int insertheadMyImage(headVO employeeVO);
	public int updateheadNoImgMypage(headVO headvo);

}
