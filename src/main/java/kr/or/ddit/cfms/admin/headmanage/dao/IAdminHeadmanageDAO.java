package kr.or.ddit.cfms.admin.headmanage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

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
 * 2021. 5. 27     진예은         최초작성
 * 2021. 5. 28     진예은         가맹본부 상세조회(상품정보)
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IAdminHeadmanageDAO {

	//가맹본부 개수
	public int selectHeadCount(PagingVO<HeadquartersVO> pagingVO);
	
	//가맹본부 조회
	public List<HeadquartersVO> selectHeadmanageList(PagingVO<HeadquartersVO> pagingVO);

	//가맹본부 상세조회
	public HeadquartersVO selectHeadmanage(String code);
	
	//가맹본부 상세조회 - 상품조회
	public PayListVO selectPayOne(String code);
	
}
