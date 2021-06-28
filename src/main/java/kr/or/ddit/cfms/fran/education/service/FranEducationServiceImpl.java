package kr.or.ddit.cfms.fran.education.service;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.or.ddit.cfms.fran.education.dao.IFranEducationDAO;
import kr.or.ddit.cfms.fran.education.vo.FranEducationVO;

@Service
public class FranEducationServiceImpl implements IFranEducationService {
	@Inject
	private IFranEducationDAO dao;

	@Override
	public List<FranEducationVO> retrieveEducationList(Map<String, Object> pMap) {
		return dao.selectEducationList(pMap);
	}

	@Override
	public FranEducationVO retrieveEducationDetail(Map<String, Object> pMap) {
		return dao.selectEducationDetail(pMap);
	}

}