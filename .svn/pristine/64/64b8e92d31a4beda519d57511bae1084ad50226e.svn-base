package kr.or.ddit.cfms.fran.trade.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.limit.vo.InVO;
import kr.or.ddit.cfms.head.limit.vo.InlistVO;
import kr.or.ddit.cfms.head.limit.vo.OrdersVO;
import kr.or.ddit.cfms.head.limit.vo.OrdlistVO;
import kr.or.ddit.cfms.head.limit.vo.OutlistVO;

@Repository
public interface ITradeDAO {
	/**
	 * @param pagingVO
	 * @return int
	 * 가맹점 발주서의 총 레코드 수
	 */
	public int selectTradeCount(PagingVO<OrdersVO> pagingVO);
	/**
	 * @param pagingVO
	 * @return List<OrdersVO>
	 * 조회 된 가맹점 들의 발주서 리스트
	 */
	public List<OrdersVO> selectTradeList(PagingVO<OrdersVO> pagingVO);
	
	/**
	 * @param outCode
	 * @return List<OutlistVO>
	 * 조회 된 발주서의 출고내역 리스트
	 */
	public List<OutlistVO> selectOutList(String outCode);
	/**
	 * @param inNo
	 * @return List<InlistVO>
	 * 조회 된 발주서의 입고내역 리스트
	 */
	public List<InlistVO> selectInList(String inNo);
	/**
	 * @param orderNo
	 * @return OrdersVO
	 * 주문 상세 조회
	 */
	public OrdersVO selectTradeDetail(String orderNo);
	
	/**
	 * @param orderNo
	 * @return List<OrdlistVO>
	 * 제품 정보 및 첨부파일 가져오기
	 */
	public List<OrdlistVO> selectTradeProd(OrdersVO ordersVO);
	
	/**
	 * @param odersVO
	 * @return int
	 * 발주내역 리스트 총 갯
	 */
	public int totalRecode(OrdersVO odersVO);
	/**
	 * @param orderNo
	 * @return int
	 * 입고확인
	 */
	public int updateIn(String orderNo);
	public int updateInven(Map<String, Object> paramMap);
	
}
