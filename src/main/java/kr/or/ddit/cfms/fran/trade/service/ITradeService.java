package kr.or.ddit.cfms.fran.trade.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.limit.vo.OrdersVO;

public interface ITradeService {
	/**
	 * @param pagingVO
	 * 페이지의 총 갯수 구한 후 datalist를 저장하는 메소드 
	 */
	public void selectMainInfo(PagingVO<OrdersVO>  pagingVO); 
	/**
	 * @param code
	 * @return ComCodeGrpVO
	 * 검색에 넣을 공통코드 가져오기
	 */
	public ComCodeGrpVO retrieveCodeList(String code);
	
	/**
	 * @param pagingVO
	 * @return int
	 * 가맹본부에서 조회한 가맹점 발주서의 총 레코드 수
	 */
	public int retirveTradeCount(PagingVO<OrdersVO> pagingVO);
	/**
	 * @param pagingVO
	 * @return List<OrdersVO>
	 * 조회 된 가맹점 들의 발주서 리스트
	 */
	public List<OrdersVO> retirveTradeList(PagingVO<OrdersVO> pagingVO);
	
	public OrdersVO retriveTradeDetail(OrdersVO ordersVO);
	public ServiceResult updateIn(String orderNo);
}
