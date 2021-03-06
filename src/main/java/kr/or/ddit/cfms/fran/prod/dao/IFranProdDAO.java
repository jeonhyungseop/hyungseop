package kr.or.ddit.cfms.fran.prod.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.prod.vo.OrderListVO;
import kr.or.ddit.cfms.fran.prod.vo.OrderVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.limit.vo.OrdlistVO;

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
@Repository
public interface IFranProdDAO {
	public int selectHeadProdCount(PagingVO<HeadInvenVO> pagingVO);
	public List<HeadInvenVO> selectHeadProdList(PagingVO<HeadInvenVO> pagingVO);
	
	public int insertOrder(OrderVO orderVO);
	public int insertOrderList(OrderListVO orderListVO);
	public HeadInvenVO selectProdList(String prod_code);
	public int insertInven(Map<String, String> paramMap);
}
