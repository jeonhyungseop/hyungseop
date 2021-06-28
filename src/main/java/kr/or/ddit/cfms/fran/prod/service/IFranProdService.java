package kr.or.ddit.cfms.fran.prod.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.prod.vo.OrderListVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;

/**
 * @author 이진수
 * @since 2021. 6. 4
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 4      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IFranProdService {
	public int retrieveHeadProdCount(PagingVO<HeadInvenVO> pagingVO);
	public List<HeadInvenVO> retrieveHeadProdList(PagingVO<HeadInvenVO> pagingVO);
	
	public void selectMainInfo(PagingVO<HeadInvenVO> pagingVO);
	
	public ServiceResult insertOrder(OrderListVO orderListVO);
	
	public void selectProdList(OrderListVO orderListVO);
}