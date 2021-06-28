package kr.or.ddit.cfms.admin.headmanage.service;

import java.util.List;

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
 * 2021. 5. 27     진예은        최초작성
 * 2021. 5. 28     진예은         가맹본부 상세조회(상품정보)
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

public interface IAdminHeadmanageService {

	//가맹본부 개수
	public int retrieveHeadCount(PagingVO<HeadquartersVO> pagingVO);

	//가맹본부 조회
	public List<HeadquartersVO> retrieveAdHeadmanageList(PagingVO<HeadquartersVO> pagingVO);
	
	//가맹본부 상세조회
	public HeadquartersVO retrieveHeadOne(String code);
	
	//가맹본부 상세조회 - 상품조회
	public PayListVO retrievePay(String code);
	
}
