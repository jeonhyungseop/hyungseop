package kr.or.ddit.cfms.admin.headmanage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.admin.headmanage.dao.IAdminHeadmanageDAO;
import kr.or.ddit.cfms.admin.headmanage.vo.PayListVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;

/**
 * @author 진예은
 * @since 2021. 5. 27
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 27      진예은       최초작성
 * 2021. 5. 28     진예은         가맹본부 상세조회(상품정보)
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class AdminHeadmanageServiceImpl implements IAdminHeadmanageService {

	@Inject
	private IAdminHeadmanageDAO hdmanageDAO;
	
	//가맹본부 조회
	@Override
	public List<HeadquartersVO> retrieveAdHeadmanageList(PagingVO<HeadquartersVO> pagingVO) {

		return hdmanageDAO.selectHeadmanageList(pagingVO);
	}

	//가맹본부 개수
	@Override
	public int retrieveHeadCount(PagingVO<HeadquartersVO> pagingVO) {

		return hdmanageDAO.selectHeadCount(pagingVO);
	}

	//가맹본부 상세조회
	@Override
	public HeadquartersVO retrieveHeadOne(String code) {

		return hdmanageDAO.selectHeadmanage(code);
	}

	//가맹본부 상세조회 - 상품조회
	@Override
	public PayListVO retrievePay(String code) {

		return hdmanageDAO.selectPayOne(code);
	}
	
}
