package kr.or.ddit.cfms.fran.mypage.service;

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
import kr.or.ddit.cfms.fran.mypage.dao.IFranMypageDAO;
import kr.or.ddit.cfms.fran.mypage.vo.franMypageVO;
import kr.or.ddit.cfms.head.employee.dao.IHeadEmployeeDAO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.mypage.dao.IHeadMypageDAO;
import kr.or.ddit.cfms.head.mypage.service.IAuthenticateService;
import kr.or.ddit.cfms.head.mypage.vo.headVO;
import kr.or.ddit.cfms.head.mypage.vo.vmemberVO;

@Service
public class FranMypageServiceImpl implements IFranMypageService {

	private static final Logger logger = LoggerFactory.getLogger(FranMypageServiceImpl.class);

	@Inject
	private IFranMypageDAO franMyDAO;
	@Inject
	private IHeadEmployeeDAO headEmpDAO;

	@Inject
	IAuthenticateService authService;

	@Value("#{appInfo.attatch}")
	private String attatchPath;

	@Value("#{appInfo.fran}")
	private String subPath;

	private String saveFolder;
	private File folder;
	private String saveFolder_BL;
	private File folder_BL;

	@Override
	public franMypageVO selectFranMy(String mem_id) {

		return franMyDAO.selectFranMy(mem_id);
	}

	@Override
	public ServiceResult updatefranMypage(franMypageVO franmypagevo) {

		int cnt = 0;
		ServiceResult result = ServiceResult.FAIL;

		logger.info("===========employeeVO : {}============", franmypagevo);
		if (franmypagevo.getAttachfileList() != null) {

			if (franmypagevo.getBefore_att_fileno() != null && franmypagevo.getBefore_att_fileno().length() > 0) {
				logger.info("===========employeeVO.getDelAttSeq() : {}============", franmypagevo.getBefore_att_fileno());
				logger.info("===========employeeVO.getAttachfileList() if??? : {}============",
						franmypagevo.getAttachfileList());
				cnt += deleteFileProcesses(franmypagevo);
			}

			cnt += franMyDAO.updatefranMypage(franmypagevo);
		} else {
			cnt += franMyDAO.updatenoImgfranMypage(franmypagevo);
		}

		folder = new File(
				attatchPath + "/" + franmypagevo.getHead_code() + "/" + franmypagevo.getFran_id() + "/emp/file");
		saveFolder = folder.getAbsolutePath();

		folder_BL = new File(attatchPath + "/" + franmypagevo.getHead_code() + subPath);
		saveFolder_BL = folder_BL.getAbsolutePath();

		if (!folder.exists()) {
			folder.mkdirs();
		}

		if (!folder_BL.exists()) {
			folder_BL.mkdirs();
		}

		logger.info("===========processes?????????=======");
		cnt += processes(franmypagevo);
		logger.info("===========processes??? ???=======");

		if (cnt > 0) {
			result = ServiceResult.OK;
		}

		return result;
	}

	// ???????????? ??????
	private int deleteFileProcesses(franMypageVO employeeVO) {

		int cnt = 0;

		if (employeeVO.getBefore_att_fileno() != null) {
			List<String> saveNames = headEmpDAO.selectEmpSaveNamesForDelete(employeeVO.getBefore_att_fileno());
			cnt += headEmpDAO.deleteEmpAttatches(employeeVO.getBefore_att_fileno());
			/*
			 * for(String saveName : saveNames) { File saveFile = new File(saveFolder,
			 * saveName); saveFile.delete(); }
			 */
		}

		return cnt;
	}

	private int processes(franMypageVO employeeVO) {

		int cnt = 0;

		List<AttachfileVO> attatchList = employeeVO.getAttachfileList();
		// attatchList.add(employeeVO.getEmp_files());
		logger.info("===========processes ?????? ??? : attatchList {}=======", attatchList);

		if (attatchList != null && attatchList.size() > 0) {

			for (int i = 0; i < attatchList.size(); i++) {
				AttachfileVO att = attatchList.get(i);

				if (i == 0) {
					att.setFile_path(saveFolder_BL);
				} else {
					att.setFile_path(saveFolder);
				}
				attatchList.set(i, att);
			}
			cnt += franMyDAO.insertfranMyImage(employeeVO);
			try {
				for (int i = 0; i < attatchList.size(); i++) {
					AttachfileVO attatch = attatchList.get(i);
					if (i == 0) {
						attatch.saveTo(saveFolder_BL);
					} else {
						attatch.saveTo(saveFolder);
					}
					attatchList.set(i, attatch);
				}
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}

		return cnt;
	}

}
