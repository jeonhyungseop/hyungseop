package kr.or.ddit.cfms.head.dayreport.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordlistVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordsalelistsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CustomerorderVO;
import kr.or.ddit.cfms.head.dayreport.vo.SaleVO;
import kr.or.ddit.cfms.head.dayreport.vo.TargetVO;
import kr.or.ddit.cfms.head.dayreport.vo.TargetselectVO;

/**
 * @author 배수진
 * @since 2021. 6. 11
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IHeadDayReportDAO { 
	
	
	/**
	 * @param franchiseVO
	 * @return List<FranchiseVO>
	 * 해당 가맹본부의 가맹점 조회
	 */
	public List<FranchiseVO> selectFranchiseList(Map<String, String> params);
	
	
	/**
	 * @param params
	 * @return List<CustomerorderVO>
	 * 가맹점 별 매출 판매 리스트
	 */
	public List<CustomerorderVO> selectDaySaleList(Map<String, String> params); 
	
	/**
	 * @param params
	 * @return List<CustomerorderVO>
	 * 단일 가맹점 한달 매출 리스트
	 */
	public List<CustomerorderVO> selectDaySaleByFranList(Map<String, String> params);  
	
	/**
	 * @param head_code
	 * @return int
	 * 가맹점의 총 일일 매출 합계
	 */
	public int selectDayTotalSale(String headCode); 
	
	/**
	 * @param head_code
	 * @return
	 * 가맹점의 한달 매출 합계
	 */
	public int selectMonthTotalSale(String headCode);
	
	/**
	 * @param head_code
	 * @return double
	 * 가맹점의 목표금액 달성 률 조회
	 */
	public double selectStatisticsSale(String headCode);
	
	/**
	 * @param head_code
	 * @return String
	 * 현재 달의 실적 우수 지점 조회
	 */
	public String selectTopFranchise(String headCode);
	
	
	/**
	 * @param head_code
	 * @return String
	 * 현재 달의 관리 대상 지점 조회
	 */
	public String selectEndFranshise(String headCode);
	
	/**
	 * @param head_code
	 * @return SaleVO
	 * 현재 달의 지역별 매출 금액
	 */
	public List<SaleVO> selectAreaTotalSale(String headCode);

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
	 * @param authId
	 * @return String
	 * 담당 가맹점 찾기
	 */
	public List<String> selectFranchiseCharge(String authId);
	
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

	/**
	 * @param targetVO
	 * @return int
	 * TB_target에 목표매출 insert 
	 */
	public int insertTarget(TargetVO targetVO);

	/**
	 * @param targetVO
	 * @return int
	 * TB_target에 목표매출 수정
	 */
	public int updateTarget(TargetVO targetVO); 
	
	
}