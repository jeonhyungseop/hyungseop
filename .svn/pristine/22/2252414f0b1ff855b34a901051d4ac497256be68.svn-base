package kr.or.ddit.cfms.admin.prod.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.admin.prod.dao.IAdminProdDAO;
import kr.or.ddit.cfms.admin.prod.vo.AdminProdVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;

/**
 * @author 진예은
 * @since 2021. 5. 24
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24      작성자명       최초작성
 * 2021. 5. 25      진예은          상품등록, 상품 조회, 상세정보
 * 2021. 5. 26      진예은          상품삭제
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class AdminProdServiceImpl implements IAdminProdService {

	@Inject
	private IAdminProdDAO prodDAO;
	
	//상품 개수
	@Override
	public int retrieveProdCount(PagingVO<AdminProdVO> pagingVO) {
		
		int cnt = prodDAO.selectProdCount(pagingVO);
		
		if(cnt == 0 ) cnt = 1;
		
		return cnt;
	}

	//상품 조회
	@Override
	public List<AdminProdVO> retrieveProd(PagingVO<AdminProdVO> pagingVO) {
		return prodDAO.selectProdList(pagingVO);
	}

	//상품 등록
	@Transactional
	@Override
	public ServiceResult createAdminProd(AdminProdVO adminprodVO) {
		
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = prodDAO.insertProd(adminprodVO);
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}

	//상품 상세정보
	@Override
	public AdminProdVO retrieveProdOne(String code) {
		
		return prodDAO.selectProdOne(code);
	}

	//상품 수정
	@Transactional
	@Override
	public ServiceResult modifyAdminProd(AdminProdVO adminprodVO) {
		
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = prodDAO.updateProd(adminprodVO);
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}

	//상품삭제
	@Transactional
	@Override
	public ServiceResult removeProd(AdminProdVO adminprodVO) {
		
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = prodDAO.deleteProd(adminprodVO);
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}

}
