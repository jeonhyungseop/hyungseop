package kr.or.ddit.cfms.fran.dayreport.service;

import java.util.List;

import org.springframework.ui.Model;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordlistVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordsalelistsVO;
import kr.or.ddit.cfms.head.dayreport.vo.TargetselectVO;

/**
 * @author 작성자명
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
public interface IFranDayReportService {
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
}
