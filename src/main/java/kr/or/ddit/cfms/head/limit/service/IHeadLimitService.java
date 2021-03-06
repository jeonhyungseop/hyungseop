package kr.or.ddit.cfms.head.limit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.limit.vo.OrdersVO;
import kr.or.ddit.cfms.head.limit.vo.OutVO;

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
 * 2021. 6. 3      배수진		  retriveHeadLimitDetail 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IHeadLimitService {
	
	
	/**
	 * @param pagingVO
	 * 페이지의 총 갯수 구한 후 datalist를 저장하는 메소드 
	 */
	public void selectMainInfo(PagingVO<OrdersVO>  pagingVO); 
	
	/**
	 * @param pagingVO
	 * @return int
	 * 가맹본부에서 조회한 가맹점 발주서의 총 레코드 수
	 */
	public int retirveHeadLimitCount(PagingVO<OrdersVO> pagingVO);
	/**
	 * @param pagingVO
	 * @return List<OrdersVO>
	 * 조회 된 가맹점 들의 발주서 리스트
	 */
	public List<OrdersVO> retirveHeadLimitList(PagingVO<OrdersVO> pagingVO);
	
	/**
	 * @param code
	 * @return ComCodeGrpVO
	 * 검색에 넣을 공통코드 가져오기
	 */
	public ComCodeGrpVO retrieveCodeList(String code);
	
	/**
	 * @param orderNo
	 * @return OrdersVO
	 * 주문 상세 조회
	 */
	public OrdersVO retriveHeadLimitDetail(String orderNo);
	
	/**
	 * @param orderMap
	 * @return int
	 * 발주 상태 업데이트 
	 */
	public int modifyOrder(Map<String, String> orderMap);
	
	/**
	 * @param orderMap
	 * @return int
	 * 출고 상태 업데이트 
	 */
	public int modifyOut(Map<String, String> orderMap);
	
	/**
	 * @param pagingVO
	 * 발주 상세 내역 가져오기 
	 */
	public void selectOutlist(PagingVO<OrdersVO> pagingVO, String orderNo);
	
	/**
	 * @param outvo
	 * @return int
	 * 출고지시서 등록
	 */
	public int insertOut(OutVO outVO);
	
	/**
	 * @param orderNo
	 * @return int
	 * 입고 확인서 및 내역 등록
	 */
	public int insertIn(String orderNo);
	
	/**
	 * @param OrdersVO
	 * @return int
	 * 출고완료 버튼 클릭 후 TB_HEINVEN 및 입고 상태코드 변경  로직  
	 */
	public int outItems(OrdersVO ordersVO);
}
