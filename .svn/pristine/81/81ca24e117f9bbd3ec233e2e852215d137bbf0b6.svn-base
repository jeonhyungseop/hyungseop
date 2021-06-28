package kr.or.ddit.cfms.head.education.service;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.education.dao.IEducationDAO;
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

@Service
public class EducationServiceImpl implements IEducationService {
	private static final Logger logger = LoggerFactory.getLogger(EducationServiceImpl.class);
	
	@Inject
	private IEducationDAO dao;
	
	@Override
	public ComCodeGrpVO retrieveCodeList(String code) {
		return dao.selectCodeList(code);
	}
	
	@Override
	public List<EducationVO> retrieveEducationList(String code) {
		return dao.selectEducationList(code);
	}

	@Override
	public EducationVO retrieveEducation(Map<String, Object> pMap) {
		return dao.selectEducation(pMap);
	}

	@Override
	public List<EmployeeVO> retrieveEmpList(String code) {
		return dao.selectEmpList(code);
	}

	@Override
//	@Transactional
	public int insertEducation(EducationVO education) {
		int cnt = dao.insertEducation(education);
		
//		logger.info("cnt"+ cnt +"education" + education);
//		if(cnt > 0) {
//			cnt = 0;
//			cnt += dao.insertEduList(education);
//		}
		
		return cnt;
	}

	@Override
	public int updateEducationDay(EducationVO education) {
		return dao.updateEducationDay(education);
	}

	@Override
	public int updateEducation(EducationVO education) {
		return dao.updateEducation(education);
	}

	@Override
	public EmployeeVO retrieveEmployee(String id) {
		return dao.selectEmployee(id);
	}

	@Override
	public int retrieveHead(String id) {
		return dao.selectHead(id);
	}

	@Override
	public int deleteEducation(Map<String, Object> pMap) {
		return dao.deleteEducation(pMap);
	}

	@Override
	public List<EducationVO> retrieveDeleteEduList(String code) {
		return dao.selectDeleteEduList(code);
	}

	@Override
	public EducationVO retrieveDelEducation(Map<String, Object> pMap) {
		return dao.selectDelEducation(pMap);
	}

	@Override
	public int restoreEducation(Map<String, Object> pMap) {
		return dao.restoreEducation(pMap);
	}

//	@Override
//	public List<FranchiseVO> retrieveFran(String code) {
//		return dao.selectFran(code);
//	}
}