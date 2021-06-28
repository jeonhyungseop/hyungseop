package kr.or.ddit.cfms.admin.question.service;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.admin.question.dao.IAdminQuestionDAO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
@Service
public class AdminQuestionServiceImpl implements IAdminQuestionService {
	private static final Logger logger =
			LoggerFactory.getLogger(AdminQuestionServiceImpl.class);
	private IAdminQuestionDAO questionDAO;
	@Inject
	public void setQuestionDAO(IAdminQuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
		logger.info("주입된 boardDAO : {}", questionDAO.getClass().getName());
	}
	
	@PostConstruct
	public void init() {
		logger.info("{} 초기화, {} 주입됨."
					, getClass().getSimpleName()					
				);
	}
	
	@Transactional
	@Override
	public ServiceResult insertQuestion(FranQuestionVO question) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = questionDAO.insertQuestion(question);
		
	if(cnt > 0) {
		if(cnt > 0) {				
				result = ServiceResult.OK;
			}	
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public int selectQuestionCount(PagingVO<FranQuestionVO> pagingVO) {
	
		return questionDAO.selectQuestionCount(pagingVO);
	}

	@Override
	public List<FranQuestionVO> selectQuestionsList(PagingVO<FranQuestionVO> pagingVO) {
		
		return questionDAO.selectQuestionsList(pagingVO);
	}

	@Override
	public FranQuestionVO selectQuestion(FranQuestionVO question) {
	
		return questionDAO.selectQuestion(question);
	}

}
