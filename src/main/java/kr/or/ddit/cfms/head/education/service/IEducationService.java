package kr.or.ddit.cfms.head.education.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.education.vo.EducationVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;

/**
 * @author 진유리
 * @since 2021. 06. 15
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * ------------     --------    ----------------------
 * 2021. 06. 15     진유리         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

public interface IEducationService {
	//공통코드 조회
	public ComCodeGrpVO retrieveCodeList(String code);
		
	//교육 리스트 조회
	public List<EducationVO> retrieveEducationList(String code);
	
	//교육 상세 내역 조회
	public EducationVO retrieveEducation(Map<String, Object> pMap);
	
	//가맹본부의 직원 리스트 조회
	public List<EmployeeVO> retrieveEmpList(String code);
	
	//교육 내용 삽입
	public int insertEducation(EducationVO education);
	
	//캘린더 날짜만 변경(eventDrop)
	public int updateEducationDay(EducationVO education);
	
	//교육 내용 수정
	public int updateEducation(EducationVO education);
	
	//직원 조회
	public EmployeeVO retrieveEmployee(String id);
	
	//본부 조회
	public int retrieveHead(String id);
	
	//교육 일정 삭제
	public int deleteEducation(Map<String, Object> pMap);
	
	//교육 삭제 리스트 조회
	public List<EducationVO> retrieveDeleteEduList(String code);
	
	//삭제된 교육 상세 내역 조회
	public EducationVO retrieveDelEducation(Map<String, Object> pMap);
	
	//교육일정 복구
	public int restoreEducation(Map<String, Object> pMap);
	
	//프랜차이즈 정보리스트 조회
//	public List<FranchiseVO> retrieveFran(String code);
}		