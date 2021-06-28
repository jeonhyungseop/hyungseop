package kr.or.ddit.cfms.fran.dayreport.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordlistVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordsalelistsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CustomerorderVO;
import kr.or.ddit.cfms.head.dayreport.vo.TargetVO;
import kr.or.ddit.cfms.head.dayreport.vo.TargetselectVO;

/**
 * @author 배수진
 * @since 2021. 6. 21
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 21      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IFranDayReportDAO {
	/**
	 * @param params
	 * @return List<CustomerorderVO>
	 * 단일 가맹점 한달 매출 리스트
	 */
	public List<CustomerorderVO> selectDaySaleByFranList(Map<String, String> params);  
	
	/**
	 * @param franCode
	 * @return List<CordsalelistsVO>
	 * 가맹점 코드로 주문 내역 조회
	 */
	public List<CordsalelistsVO> selectFranCordList(PagingVO<CordsalelistsVO> pagingVO);
	
	/**
	 * @param franCode
	 * @return int
	 * 가맹점 코드를 이용하여 한달 목표 매출 조회
	 */
	public int selectFranTargetMoney(String franCode);
	
	
	/**
	 * @param franCode
	 * @return int
	 * 가맹점 코드를 이용하여 한달 매출 총액 조회
	 */
	public int selectFranSumMoney(String franCode);
	
	
	/**
	 * @param franCode
	 * @return double
	 * 가맹점 코드를 이용하여 목표 달성률 조회
	 */
	public double selectFranTargetRate(String franCode);
	
	/**
	 * @param franCode
	 * @return int
	 * 가맹점 코드를 이용하여 한달 주문 건수 조회
	 */
	public int selectTotalCord(String franCode);
	
	
	/**
	 * @param pagingVO
	 * @return int
	 * 총 레코드 수 조회
	 */
	public int selectFranCordListCount(PagingVO<CordsalelistsVO> pagingVO);

	/**
	 * @param orderpayNo
	 * @return List<CordlistVO>
	 * 결제코드를 이용하여 주문 결제 상세 내역
	 */
	public List<CordlistVO> selectPaylist(String ordpayNo);
	
	/**
	 * @param franCode
	 * @return int
	 * 다음 달 목표매출 작성 여부 판단 및 목표매출 금액 조회
	 */
	public int selectPostTargetMoney(String franCode);

	/**
	 * @param franCode
	 * @return List<TargetselectVO>
	 * 전년도 현재달, 전달, 다음 달 매출 조회
	 */
	public List<TargetselectVO> selectYesrAgoMoney(String franCode);

	/**
	 * @param franCode
	 * @return int
	 * 전년도 매출 평균값 조회
	 */
	public int selectYearAgoAvg(String franCode);


}
