package kr.or.ddit.cfms.head.limit.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.limit.vo.InlistVO;
import kr.or.ddit.cfms.head.limit.vo.OrdersVO;
import kr.or.ddit.cfms.head.limit.vo.OrdlistVO;
import kr.or.ddit.cfms.head.limit.vo.OutVO;
import kr.or.ddit.cfms.head.limit.vo.OutlistVO;

/**
 * @author 배수진
 * @since 2021. 6. 1
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 1      배수진       최초작성
 * 2021. 6. 3      배수진       selectHeadLimitDetail 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IHeadLimitDAO {
	/**
	 * @param pagingVO
	 * @return int
	 * 가맹본부에서 조회한 가맹점 발주서의 총 레코드 수
	 */
	public int selectHeadLimitCount(PagingVO<OrdersVO> pagingVO);
	/**
	 * @param pagingVO
	 * @return List<OrdersVO>
	 * 조회 된 가맹점 들의 발주서 리스트
	 */
	public List<OrdersVO> selectHeadLimitList(PagingVO<OrdersVO> pagingVO);
	
	/**
	 * @param orderNo
	 * @return OrdersVO
	 * 주문 상세 조회
	 */
	public OrdersVO selectHeadLimitDetail(String orderNo);
	
	/**
	 * @param orderNo
	 * @return List<OrdersVO>
	 * 주문 상세 내역 조회 
	 */
	public List<OrdlistVO> selectHeadLimitOrderList (String orderNo);
	
	
	/**
	 * @param orderNo
	 * @return List<OrdlistVO>
	 * 제품 정보 및 첨부파일 가져오기
	 */
	public List<OrdlistVO> selectHeadInvenProd(String orderNo);
	
	/**
	 * @param odersVO
	 * @return int
	 * 발주내역 리스트 총 갯
	 */
	public int totalRecode(OrdersVO odersVO);
	
	/**
	 * @param orderMap
	 * @return int
	 * 발주 상태 업데이트 
	 */
	public int updateOrder(Map<String, String > orderMap);
	
	/**
	 * @param outMap
	 * @return int
	 * 출고 상태 업데이트 
	 */
	public int updateOut(Map<String, String > outMap);
	
	/**
	 * @param in_no
	 * @return int
	 * 입고 상태 업데이트
	 */
	public int updateIn(String in_no);
	
	/**
	 * @param outMap
	 * @return String
	 * 원하는 in_no 찾기
	 */
	public String getInNo(Map<String, String > outMap);
	
	/**
	 * @return String
	 * 다음 out_code 생성
	 */
	public String getOutCode();
	
	/**
	 * @param outVO
	 * @return int
	 * 출고지시서 insert 
	 */
	public int insertOut(OutVO outVO); 
	
	/**
	 * @param outVO
	 * @return int
	 * 입고확인서 insert
	 */
	public int insertIn(OrdersVO ordersVO);
	
	/**
	 * @param outlistVO
	 * @return int
	 * 출고지시서 내역 insert 
	 */
	public int insertOutlist(List<OutlistVO> outlist);
	
	/**
	 * @param inlists
	 * @return int
	 * 입고확인서 내역 insert
	 */
	public int insertInlist(List<InlistVO> inlists);
	
	/**
	 * @param ordersVO
	 * @return List<OrdlistVO>
	 * TB_OUTLIST에서 변경할 제품코드와 수량을 조회하기
	 */
	public List<OutlistVO> selectOutlist(OrdersVO ordersVO); 
	
	/**
	 * @param outlistVO
	 * @return int
	 * 출고 지시서에 있는 제품 리스트 만큼 TB_HEINVEN 의 재고 수량을 감소
	 */
	public void updateOutHeinven(Map<String, Object> paramMap);
	
	/**
	 * @param outlistVO
	 * @return int
	 * 출고 지시서에 있는 제품 리스트 만큼 TB_FRINVEN 의 재고 수량을 증가
	 */
	public int updateOutFrinven(List<OutlistVO> outlistVO);
	
}