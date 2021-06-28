package kr.or.ddit.cfms.head.deposit.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.deposit.vo.HeadsmnVO;

/**
 * @author 작성자명
 * @since 2021. 5. 25
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IHeadDepositService {
	public int retrieveHeadDepositCount(PagingVO<HeadsmnVO> pagingVO);
	public List<HeadsmnVO> retrieveHeadDepositList(PagingVO<HeadsmnVO> pagingVO);
	public int createHeadDeposit(HeadsmnVO depositVO);
	public int retireveHeadDepositBlce(HeadsmnVO depositVO);
	public String retireveAuthIdTable(String authId);
}
