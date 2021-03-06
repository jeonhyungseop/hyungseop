package kr.or.ddit.cfms.head.employee.service;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.employee.dao.IHeadEmployeeDAO;
import kr.or.ddit.cfms.head.employee.vo.DeptVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.utils.CryptoUtil;

/**
 * @author 진예은
 * @since 2021. 6. 7
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 7       진예은        직원목록조회
 * 2021, 6. 8.      진예은        직원등록(파일첨부)
 * 2021. 6. 9.      진예은        직원수정(파일첨부 삭제)
 * 2021. 6. 10      진예은        직원근태관리(출근)
 * 2021. 6. 15      진예은        직원출근체크 여부 확인
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class HeadEmployeeServiceImpl implements IHeadEmployeeService {

	private static final Logger logger = LoggerFactory.getLogger(HeadEmployeeServiceImpl.class);
	
	
	@Inject
	private IHeadEmployeeDAO headEmpDAO;
	
	@Value("#{appInfo.attatch}")
	private String attatchPath;
	
	@Value("#{appInfo.emp}")
	private String subPath;
	
	private String saveFolder;
	private File folder;
	private String saveFolder_BL;
	private File folder_BL;
	
	//직원목록조회
	@Override
	public List<EmployeeVO> selectEmpList(PagingVO<EmployeeVO> pagingVO) {

		return headEmpDAO.selectEmpList(pagingVO);
	}

	//직원 COUNT
	@Override
	public int selectEmpCount(PagingVO<EmployeeVO> pagingVO) {

		return headEmpDAO.selectEmpCount(pagingVO);
	}

	//공통코드 직급목록조회
	@Override
	public List<ComCodeVO> comcodeECL() {
		
		return headEmpDAO.comcodeECL();
	}

	//공통코드 직원구분
	@Override
	public List<ComCodeVO> comcodeESE() {
		
		return headEmpDAO.comcodeESE();
	}

	//직원등록여부
	@Override
	public List<EmployeeVO> selectEmpUseAt(String code) {
		
		return headEmpDAO.selectEmpUseAt(code);
	}

	//직원있는경우 등록
	@Transactional
	@Override
	public ServiceResult insertEmpOk(EmployeeVO employeeVO) {
		ServiceResult result = ServiceResult.FAIL;
		
		folder = new File(attatchPath+"/"+employeeVO.getHead_code()+"/"+employeeVO.getEmp_id()+"/emp/file");
		saveFolder = folder.getAbsolutePath();
		
		folder_BL = new File(attatchPath + "/" + employeeVO.getHead_code()+subPath);
		saveFolder_BL = folder_BL.getAbsolutePath();
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		if(!folder_BL.exists()) {
			folder_BL.mkdirs();
		}
		
		encodePassword(employeeVO);
		
		int cnt = headEmpDAO.insertEmpOk(employeeVO);
		
		if(cnt > 0) {
			cnt = 0;
			cnt += processes(employeeVO);
		}
		
		if(cnt>0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}

	//직원없는경우 등록
	@Transactional
	@Override
	public ServiceResult insertEmpNo(EmployeeVO employeeVO) {
		ServiceResult result = ServiceResult.FAIL;
		
		encodePassword(employeeVO);
		
		int cnt = headEmpDAO.insertEmpNo(employeeVO);
		
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}
	
	
	//첨부파일등록
	private int processes(EmployeeVO employeeVO) {
		
		int cnt = 0;
		
		
		List<AttachfileVO> attatchList = employeeVO.getAttachfileList();
		//attatchList.add(employeeVO.getEmp_files());
		logger.info("===========processes 진행 중 : attatchList {}=======", attatchList);
		
		if(attatchList != null && attatchList.size() > 0) {
			
			for(int i=0; i<attatchList.size(); i++) {
				AttachfileVO att = attatchList.get(i);
				
				if(i==0) {
					att.setFile_path(saveFolder_BL);
				}else {
					att.setFile_path(saveFolder);
				}
				attatchList.set(i, att);
			}
			cnt += headEmpDAO.insertEmpImage(employeeVO);
			try {
				for(int i=0; i<attatchList.size(); i++) {
					AttachfileVO attatch = attatchList.get(i);
					if(i==0) {
						attatch.saveTo(saveFolder_BL);
					}else {
						attatch.saveTo(saveFolder);
					}
					attatchList.set(i, attatch);
				}
			} catch (IOException e){
				throw new RuntimeException(e);
			}
		}
		
		return cnt;
	}
	
	
	
	//첨부파일 삭제
	private int deleteFileProcesses(EmployeeVO employeeVO) {

		int cnt = 0;
		
		if(employeeVO.getBefore_att_fileno()!=null) {
			List<String> saveNames = headEmpDAO.selectEmpSaveNamesForDelete(employeeVO.getBefore_att_fileno());
			cnt += headEmpDAO.deleteEmpAttatches(employeeVO.getBefore_att_fileno());
			/*
			 * for(String saveName : saveNames) { File saveFile = new File(saveFolder,
			 * saveName); saveFile.delete(); }
			 */
		}
		
		return cnt;
	}
	
	
	//비밀번호 암호화
	private void encodePassword(EmployeeVO employeeVO) {
		String emp_pass = employeeVO.getEmp_pass();
		if(StringUtils.isBlank(emp_pass)) return;
		
		try {
			String encodedPass = CryptoUtil.sha512(emp_pass);
			employeeVO.setEmp_pass(encodedPass);
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
	
	

	//부서코드모음
	@Override
	public List<DeptVO> selectDept(String code) {
		
		
		return headEmpDAO.selectDept(code);
	}

	//직원상세보기
	@Override
	public EmployeeVO selectEmpOne(String empId) {

		
		return headEmpDAO.selectEmpOne(empId);
	}

	//직원수정
	@Transactional
	@Override
	public ServiceResult updateEmployee(EmployeeVO employeeVO) {

		int cnt = 0;
		ServiceResult result = ServiceResult.FAIL;
		
		logger.info("===========employeeVO : {}============", employeeVO);
		logger.info("===========employeeVO.getAttachfileList() : {}============", employeeVO.getAttachfileList());
		
		if(employeeVO.getAttachfileList() != null) {
			
			if(employeeVO.getBefore_att_fileno()!=null && employeeVO.getBefore_att_fileno().length()>0) {
				logger.info("===========employeeVO.getDelAttSeq() : {}============", employeeVO.getBefore_att_fileno());
				logger.info("===========employeeVO.getAttachfileList() if문 : {}============", employeeVO.getAttachfileList());
				cnt += deleteFileProcesses(employeeVO);
			}
			
			cnt += headEmpDAO.updateEmployee(employeeVO);
		}else {
			cnt += headEmpDAO.updateNoImgEmployee(employeeVO);
		}
		
		folder = new File(attatchPath+"/"+employeeVO.getHead_code()+"/"+employeeVO.getEmp_id()+"/emp/file");
		saveFolder = folder.getAbsolutePath();
		
		folder_BL = new File(attatchPath + "/" + employeeVO.getHead_code()+subPath);
		saveFolder_BL = folder_BL.getAbsolutePath();
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		if(!folder_BL.exists()) {
			folder_BL.mkdirs();
		}
		if(employeeVO.getAttachfileList() != null) {
		logger.info("===========processes타기전=======");
		cnt += processes(employeeVO);
		logger.info("===========processes탄 후=======");
		}
		
		if(cnt > 0) {
			
			result =  ServiceResult.OK;
		}
		
		return result;
	}

	
	//직원퇴사 처리
	@Override
	public ServiceResult retdeEmp(String empId) {

		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = headEmpDAO.retdeEmp(empId);
		
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}

	
	
	
}
