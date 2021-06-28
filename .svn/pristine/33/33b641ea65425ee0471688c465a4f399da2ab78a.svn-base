package kr.or.ddit.cfms.head.question.service;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.dao.IFranQuestionDAO;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
import kr.or.ddit.cfms.head.question.dao.IHeadQuestionDao;
import kr.or.ddit.cfms.head.question.vo.HeadAnswerVO;

@Service
public class HeadQuestionServiceImpl implements IHeadQuestionService {
	private static final Logger logger =
			LoggerFactory.getLogger(HeadQuestionServiceImpl.class);
	private IHeadQuestionDao questionDAO;
	private IFranQuestionDAO franquesionDAO;
	
	@Inject
	public void setQuestionDAO(IHeadQuestionDao questionDAO) {
		this.questionDAO = questionDAO;
		logger.info("주입된 boardDAO : {}", questionDAO.getClass().getName());
	}
	@PostConstruct
	public void init() {	
		logger.info("{} 초기화, {} 주입됨."
					, getClass().getSimpleName()					
				);
	
	}
	@Override
	public List<FranQuestionVO> selectQuestionsList(PagingVO<FranQuestionVO> pagingVO) {
	
		return questionDAO.selectQuestionsList(pagingVO);
	}
	@Override
	public int selectQuestionCount(PagingVO<FranQuestionVO> pagingVO) {

		return questionDAO.selectQuestionCount(pagingVO);
	}
	@Override
	public FranQuestionVO selectQuestion(FranQuestionVO question) {
		// TODO Auto-generated method stub
		return questionDAO.selectQuestion(question);
	}
	@Transactional
	@Override
	public ServiceResult insertQuestion(HeadAnswerVO question) {
	ServiceResult result = ServiceResult.FAIL;
		
		
		int cnt = questionDAO.insertQuestion(question);
		
			
			
			if(cnt > 0) {
				
				result = ServiceResult.OK;
				int cnt2 = questionDAO.updateQuestionStatus(question);
				{
					result =ServiceResult.OK;
				}
				
				
			}	
		else {
			result = ServiceResult.FAIL;
		}
			
		return result;
	
	}
	
	

	

}
