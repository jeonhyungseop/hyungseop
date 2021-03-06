package kr.or.ddit.cfms.head.headmypage.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.employee.dao.IHeadEmployeeDAO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.headmypage.dao.IHHeadMypageDAO;
import kr.or.ddit.cfms.head.mypage.dao.IHeadMypageDAO;
import kr.or.ddit.cfms.head.mypage.service.IAuthenticateService;
import kr.or.ddit.cfms.head.mypage.vo.headVO;

@Service
public class HHeadMypageServiceImpl implements IHHeadMypageService {

	private static final Logger logger = LoggerFactory.getLogger(HHeadMypageServiceImpl.class);

	@Inject
	IHHeadMypageDAO headMyDao;
	@Inject
	IAuthenticateService authService;

	@Value("#{appInfo.attatch}")
	private String attatchPath;

	@Value("#{appInfo.emp}")
	private String subPath;

	private String saveFolder;
	private File folder;
	private String saveFolder_BL;
	private File folder_BL;


	/*
	 * //직원수정
	 * 
	 * @Transactional
	 * 
	 * @Override public ServiceResult updateMypage(EmployeeVO employeeVO) {
	 * 
	 * int cnt = 0; ServiceResult result = ServiceResult.FAIL;
	 * 
	 * logger.info("===========employeeVO : {}============", employeeVO);
	 * 
	 * if(employeeVO.getBefore_att_fileno()!=null &&
	 * employeeVO.getBefore_att_fileno().length()>0) {
	 * logger.info("===========employeeVO.getDelAttSeq() : {}============",
	 * employeeVO.getBefore_att_fileno()); cnt += deleteFileProcesses(employeeVO); }
	 * 
	 * cnt += headMyDAO.updateMypage(employeeVO); folder = new
	 * File(attatchPath+"/"+employeeVO.getHead_code()+"/"+employeeVO.getEmp_id()+
	 * "/emp/file"); saveFolder = folder.getAbsolutePath();
	 * 
	 * folder_BL = new File(attatchPath + "/" + employeeVO.getHead_code()+subPath);
	 * saveFolder_BL = folder_BL.getAbsolutePath();
	 * 
	 * if(!folder.exists()) { folder.mkdirs(); }
	 * 
	 * if(!folder_BL.exists()) { folder_BL.mkdirs(); }
	 * 
	 * logger.info("===========processes타기전======="); cnt += processes(employeeVO);
	 * logger.info("===========processes탄 후=======");
	 * 
	 * if(cnt > 0) { result = ServiceResult.OK; }
	 * 
	 * return result; }
	 */

	@Override
	public ServiceResult updateMypage(EmployeeVO employeeVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ComCodeVO> comcodeECL() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ComCodeVO> comcodeESE() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public headVO selectHeadMy(String mem_id) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * //첨부파일 삭제 private int deleteFileProcesses(EmployeeVO employeeVO) {
	 * 
	 * int cnt = 0;
	 * 
	 * if(employeeVO.getBefore_att_fileno()!=null) { List<String> saveNames =
	 * headEmpDAO.selectEmpSaveNamesForDelete(employeeVO.getBefore_att_fileno());
	 * cnt += headEmpDAO.deleteEmpAttatches(employeeVO.getBefore_att_fileno());
	 * 
	 * for(String saveName : saveNames) { File saveFile = new File(saveFolder,
	 * saveName); saveFile.delete(); }
	 * 
	 * }
	 * 
	 * return cnt; }
	 */

	/*
	 * private int processes(EmployeeVO employeeVO) {
	 * 
	 * int cnt = 0;
	 * 
	 * List<AttachfileVO> attatchList = employeeVO.getAttachfileList(); //
	 * attatchList.add(employeeVO.getEmp_files());
	 * logger.info("===========processes 진행 중 : attatchList {}=======",
	 * attatchList);
	 * 
	 * if (attatchList != null && attatchList.size() > 0) {
	 * 
	 * for (int i = 0; i < attatchList.size(); i++) { AttachfileVO att =
	 * attatchList.get(i);
	 * 
	 * if (i == 0) { att.setFile_path(saveFolder_BL); } else {
	 * att.setFile_path(saveFolder); } attatchList.set(i, att); } cnt +=
	 * headEmpDAO.insertEmpImage(employeeVO); try { for (int i = 0; i <
	 * attatchList.size(); i++) { AttachfileVO attatch = attatchList.get(i); if (i
	 * == 0) { attatch.saveTo(saveFolder_BL); } else { attatch.saveTo(saveFolder); }
	 * attatchList.set(i, attatch); } } catch (IOException e) { throw new
	 * RuntimeException(e); } }
	 * 
	 * return cnt; }
	 */

}
