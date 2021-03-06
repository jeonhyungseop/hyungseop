package kr.or.ddit.cfms.head.dayreport.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordlistVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordsalelistsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CustomerorderVO;
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
public interface IHeadDayReportService {
	
	/**
	 * @param params
	 * 초기 데이터 조회
	 */
	public void settingDatas(Model model, String headCode);
	

	/**
	 * @param head_code
	 * @return List<FranchiseVO>
	 * 해당 가맹본부에 존재하는 가맹점 리스트 조회
	 */
	public List<FranchiseVO> retriveFranchiseList(Map<String, String> params);
	
	/**
	 * @param params
	 * @return List<CustomerorderVO>
	 * 가맹점 별 매출 판매 리스트
	 */
	public List<CustomerorderVO> retriveDaySaleList(Map<String, String> params); 
	
	/**
	 * @param model
	 * @param franCode
	 * 초기 상세 디테일  데이터
	 */
	public void settingDetailDatas(Model model, String franCode);
	
	
	/**
	 * @param pagingVO
	 * @return int
	 * 가맹점 한 곳에 대한 조회 리스트 총 갯수 
	 */
	public int retirveFranCordListCount(PagingVO<CordsalelistsVO> pagingVO);
	
	
	/**
	 * @param pagingVO
	 * @return  List<CustomerorderVO>
	 * 가맹점 한 곳에 대한 페이징 처리 된 조회 리스트
	 */
	public List<CordsalelistsVO> retriveFranCordList(PagingVO<CordsalelistsVO> pagingVO);
	
	/**
	 * @param orderpayNo
	 * @return List<CordlistVO>
	 * 주문 결제 상세 내역
	 */
	public List<CordlistVO> retrivePaylist(String ordpayNo);
	
	/**
	 * @param authId
	 * @return String
	 * 담당 가맹점 찾기
	 */
	public List<String> retriveFranchiseCharge(String authId);
	
	/**
	 * @param franCode
	 * @return int
	 * 다음 달 목표매출 작성 여부 판단 및 목표매출 금액 조회
	 */
	public int retrivePostTargetMoney(String franCode); 
	
	
	/**
	 * @param franCode
	 * @return List<TargetselectVO>
	 * 전년도 현재달, 전달, 다음 달 매출 조회
	 */
	public List<TargetselectVO> retriveYearAgoMoney(String franCode); 
	
	/**
	 * @param franCode
	 * @return int
	 * 전년도 매출 평균값 조회
	 */
	public int retriveYearAgoAvg(String franCode); 
	
	/**
	 * @param targetVO
	 * @return int
	 * TB_target에 목표매출 insert 
	 */
	public int createTarget(TargetVO targetVO);
	
	
	/**
	 * @param targetVO
	 * @return int
	 * TB_target에 목표매출 수정
	 */
	public int modifyTarget(TargetVO targetVO);
}