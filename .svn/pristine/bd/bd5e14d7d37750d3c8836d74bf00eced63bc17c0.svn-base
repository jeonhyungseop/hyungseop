package kr.or.ddit.cfms.admin.prod.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.admin.prod.vo.AdminProdVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;

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
 * 2021. 5. 25      진예은          상품등록, 상품조회, 상세정보, 상품수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IAdminProdDAO {

	//상품개수
	public int selectProdCount(PagingVO<AdminProdVO> pagingVO);
	
	//상품 조회
	public List<AdminProdVO> selectProdList(PagingVO<AdminProdVO> pagingVO);
	
	
	//상품등록
	public int insertProd(AdminProdVO adminprodVO);
	
	//상품 상세정보
	public AdminProdVO selectProdOne(String code);
	
	//상품수정
	public int updateProd (AdminProdVO adminprodVO);
	
	//상품 삭제
	public int deleteProd(AdminProdVO adminprodVO);
	
}
