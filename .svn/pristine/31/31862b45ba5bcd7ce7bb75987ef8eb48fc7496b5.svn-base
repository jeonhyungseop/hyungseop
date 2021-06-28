package kr.or.ddit.cfms.head.deposit.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.deposit.vo.HeadsmnVO;

/**
 * @author 배수진 
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

@Repository
public interface IHeadDepositDAO {
	public int selectHeadDepositCount(PagingVO<HeadsmnVO> pagingVO);
	public List<HeadsmnVO> selectHeadDepositList(PagingVO<HeadsmnVO> pagingVO);
	public int insertHeadDeposit(HeadsmnVO depositVO);
	public int selectHeadDepositblce(HeadsmnVO depositVO);
	public String selectAuthIdTable(String authId);
}
