package kr.or.ddit.cfms.fran.dayreport.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.dayreport.dao.IFranDayReportDAO;
import kr.or.ddit.cfms.head.dayreport.dao.IHeadDayReportDAO;
import kr.or.ddit.cfms.head.dayreport.service.HeadDayReportSerivceImpl;
import kr.or.ddit.cfms.head.dayreport.vo.CordlistVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordsalelistsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CustomerorderVO;
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
@Service
public class FranDayReportServiceImpl implements IFranDayReportService {
	private Logger logger = LoggerFactory.getLogger(HeadDayReportSerivceImpl.class);
	
	
	private IFranDayReportDAO dayReportDAO;
	
	@Inject
	public void setDayReportDAO(IFranDayReportDAO dayReportDAO) {
		this.dayReportDAO = dayReportDAO;
		logger.info("주입된 codeDAO : {}", dayReportDAO.getClass().getName());
	}

	/**
	 * @param model
	 * @param franCode
	 * 초기 상세 디테일  데이터
	 */
	public void settingDetailDatas(Model model, String franCode) {
		Map<String, Object> statistics = new HashMap<>();
		int goleMoney = dayReportDAO.selectFranTargetMoney(franCode);
		int sumMoney = dayReportDAO.selectFranSumMoney(franCode);
		double targetRate = dayReportDAO.selectFranTargetRate(franCode);
		int cordCnt = dayReportDAO.selectTotalCord(franCode);
		
		statistics.put("goleMoney", goleMoney);
		statistics.put("sumMoney", sumMoney);
		statistics.put("targetRate", targetRate);
		statistics.put("cordCnt", cordCnt);
		
		Map<String, String> params = new HashMap<>();
		params.put("franCode", franCode);
		
		List<CustomerorderVO> moneyByDay =  dayReportDAO.selectDaySaleByFranList(params);
		
		
		model.addAttribute("statistics", statistics);
		model.addAttribute("franCode", franCode);
		model.addAttribute("moneyByDay", moneyByDay);
	};
	
	/**
	 * @param pagingVO
	 * @return int
	 * 가맹점 한 곳에 대한 조회 리스트 총 갯수 
	 */
	@Override
	public int retirveFranCordListCount(PagingVO<CordsalelistsVO> pagingVO) {
		return dayReportDAO.selectFranCordListCount(pagingVO);
	}

	/**
	 * @param pagingVO
	 * @return  List<CustomerorderVO>
	 * 가맹점 한 곳에 대한 페이징 처리 된 조회 리스트
	 */
	@Override
	public List<CordsalelistsVO> retriveFranCordList(PagingVO<CordsalelistsVO> pagingVO) {
		int totalRecorde = retirveFranCordListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecorde);
		
		List<CordsalelistsVO> cordlists = dayReportDAO.selectFranCordList(pagingVO);
		return cordlists;
	}

	/**
	 * @param orderpayNo
	 * @return List<CordlistVO>
	 * 주문 결제 상세 내역
	 */
	@Override
	public List<CordlistVO> retrivePaylist(String ordpayNo) {
		return dayReportDAO.selectPaylist(ordpayNo);
	}

	/**
	 * @param franCode
	 * @return List<TargetselectVO>
	 * 전년도 현재달, 전달, 다음 달 매출 조회
	 */
	@Override
	public List<TargetselectVO> retriveYearAgoMoney(String franCode) {
		return dayReportDAO.selectYesrAgoMoney(franCode);
	}

	/**
	 * @param franCode
	 * @return int
	 * 전년도 매출 평균값 조회
	 */
	@Override
	public int retriveYearAgoAvg(String franCode) {
		return dayReportDAO.selectYearAgoAvg(franCode);
	}
	
}
