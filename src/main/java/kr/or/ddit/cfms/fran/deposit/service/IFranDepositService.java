package kr.or.ddit.cfms.fran.deposit.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.deposit.vo.FrdsmnVO;

/**
 * @author 배수진
 * @since 2021. 5. 31
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IFranDepositService { 
	public int retrieveFranDepositCount(PagingVO<FrdsmnVO> pagingVO);
	public List<FrdsmnVO> retrieveFranDepositList(PagingVO<FrdsmnVO> pagingVO);
	public int createFranDeposit(FrdsmnVO depositVO);
	public int retireveFranDepositBlce(FrdsmnVO depositVO);
	public String retireveAuthIdTable(String authId);
}
