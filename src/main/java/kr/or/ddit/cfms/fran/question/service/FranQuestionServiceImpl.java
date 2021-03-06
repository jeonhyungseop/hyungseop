package kr.or.ddit.cfms.fran.question.service;

import java.io.File;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.question.dao.IFranQuestionDAO;
import kr.or.ddit.cfms.fran.question.vo.FranQuestionVO;
import kr.or.ddit.cfms.head.question.vo.HeadAnswerVO;

@Service
public class FranQuestionServiceImpl implements IFranQuestionService{
	private static final Logger logger =
			LoggerFactory.getLogger(FranQuestionServiceImpl.class);
	private IFranQuestionDAO questionDAO;
	
	@Inject
	public void setQuestionDAO(IFranQuestionDAO questionDAO) {
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
	public FranQuestionVO selectQuestion(FranQuestionVO question) {

	
		return questionDAO.selectQuestion(question);
	}



	@Transactional
	@Override
	public ServiceResult updateQuestion(FranQuestionVO question) {
		logger.info("수정 board  {}",    question );
		ServiceResult result = ServiceResult.FAIL;
		int cnt = questionDAO.updateQuestion(question);
		if(cnt > 0) {
			
			result = ServiceResult.OK;
		}else {
			System.out.println("선생님");
			result = ServiceResult.FAIL;
		}
		return result;
	}
	
	@Override
	public ComCodeGrpVO selectCodeList(String code) {
		
		return questionDAO.selectCodeList(code);
	}
	
	@Transactional
	@Override
	public ServiceResult deleteQuestion(FranQuestionVO search) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = questionDAO.deleteQuestion(search);
		if(cnt>0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public HeadAnswerVO selectQuestionAnswerList(HeadAnswerVO question) {
	
		return questionDAO.selectQuestionAnswerList(question);
	}
	@Override
	public ServiceResult updateQuestionStatus(HeadAnswerVO question) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

	
	
	
	

}
