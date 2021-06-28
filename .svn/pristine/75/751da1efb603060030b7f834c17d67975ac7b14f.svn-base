package kr.or.ddit.cfms.admin.prod.service;

import java.util.List;

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
 * 2021. 5. 25      진예은          상품등록
 * 2021. 5. 26      진예은          상품삭제
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

public interface IAdminProdService {

	//상품 개수
	public int retrieveProdCount(PagingVO<AdminProdVO> pagingVO);
	
	//상품 조회
	public List<AdminProdVO> retrieveProd(PagingVO<AdminProdVO> pagingVO);
	
	//상품 등록
	public ServiceResult createAdminProd(AdminProdVO adminprodVO);
	
	//상품 상세정보
	public AdminProdVO retrieveProdOne(String code);
	
	//상품 수정
	public ServiceResult modifyAdminProd(AdminProdVO adminprodVO);
	
	
	//상품 삭제
	public ServiceResult removeProd(AdminProdVO adminprodVO);
	
}
