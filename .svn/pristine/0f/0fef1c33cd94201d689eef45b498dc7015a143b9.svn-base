package kr.or.ddit.cfms.login.dao;

import org.springframework.stereotype.Repository;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.login.vo.UserVO;

@Repository
public interface ILoginDAO {
	//로그인 확인
	public UserVO selectForAuth(String user_id);
	
	//가맹본부 조회
	public HeadquartersVO selectHead(String id);

	//가맹본부 직원 조회
	public EmployeeVO selectEmp(String id);

	//가맹점 조회
	public FranchiseVO selectFran(String id);
}