package kr.or.ddit.cfms.head.dayreport.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.dayreport.dao.IHeadDayReportDAO;
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
@Service
public class HeadDayReportSerivceImpl implements IHeadDayReportService {
	private Logger logger = LoggerFactory.getLogger(HeadDayReportSerivceImpl.class);
	
	
	private IHeadDayReportDAO dayReportDAO;
	
	@Inject
	public void setDayReportDAO(IHeadDayReportDAO dayReportDAO) {
		this.dayReportDAO = dayReportDAO;
		logger.info("주입된 codeDAO : {}", dayReportDAO.getClass().getName());
	}

	
	/**
	 * @param params
	 * 초기 데이터 조회
	 */
	@Override
	public void settingDatas(Model model, String headCode) {
		
		// 가맹점 리스트
		Map<String,String> param = new HashMap<>();
		param.put("headCode",headCode);
		List<FranchiseVO> franlist = new ArrayList<>();
		franlist = retriveFranchiseList(param);
		
		//월 통계 내역
		Map<String, Object> statistics = new HashMap<>();
		int dayTotal = dayReportDAO.selectDayTotalSale(headCode);
		int momthTotal = dayReportDAO.selectMonthTotalSale(headCode);
		double nowStatistics= dayReportDAO.selectStatisticsSale(headCode);
		String topFran = dayReportDAO.selectTopFranchise(headCode);
		String endFran = dayReportDAO.selectEndFranshise(headCode);
		statistics.put("dayTotal",dayTotal);
		statistics.put("momthTotal",momthTotal);
		statistics.put("nowStatistics",nowStatistics);
		statistics.put("topFran",topFran);
		statistics.put("endFran",endFran);
		
		//지역별 매출
		List<SaleVO> areaList = dayReportDAO.selectAreaTotalSale(headCode);
		
		model.addAttribute("franlist", franlist);
		model.addAttribute("statistics", statistics);
		model.addAttribute("areaList", areaList);
	}
	
	/**
	 * @param head_code
	 * @return List<FranchiseVO>
	 * 해당 가맹본부에 존재하는 가맹점 리스트 조회
	 */
	@Override
	public List<FranchiseVO> retriveFranchiseList(Map<String, String> params) {
		return dayReportDAO.selectFranchiseList(params);
	}


	/**
	 * @param params
	 * @return List<CustomerorderVO>
	 * 가맹점 별 매출 판매 리스트
	 */
	@Override
	public List<CustomerorderVO> retriveDaySaleList(Map<String, String> params) {
		
		List<CustomerorderVO> result = new ArrayList<>();
		
		if(StringUtils.isNotBlank(params.get("franCode"))) {
			result = dayReportDAO.selectDaySaleByFranList(params);
		}else {
			result =  dayReportDAO.selectDaySaleList(params);
		}
		
		return result;
	}

	/**
	 * @param model
	 * @param franCode
	 * 초기 상세 디테일  데이터
	 */
	@Override
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
		
	}

	
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
	 * @param authId
	 * @return String
	 * 담당 가맹점 찾기
	 */
	@Override
	public List<String> retriveFranchiseCharge(String authId) {
		return dayReportDAO.selectFranchiseCharge(authId);
	}
	
	
	/**
	 * @param franCode
	 * @return int
	 * 다음 달 목표매출 작성 여부 판단 및 목표매출 금액 조회
	 */
	@Override
	public int retrivePostTargetMoney(String franCode) {
		return dayReportDAO.selectPostTargetMoney(franCode);
	}
	
	
	/**
	 * @param franCode
	 * @return List<TargetselectVO>
	 * 전년도 현재달, 전달, 다음 달 매출 조회
	 */
	@Override
	public List<TargetselectVO> retriveYearAgoMoney(String franCode){
		return dayReportDAO.selectYesrAgoMoney(franCode);
	};
	
	
	/**
	 * @param franCode
	 * @return int
	 * 전년도 매출 평균값 조회
	 */
	@Override
	public int retriveYearAgoAvg(String franCode) {
		return dayReportDAO.selectYearAgoAvg(franCode);
	}; 
	
	/**
	 * @param targetVO
	 * @return int
	 * TB_target에 목표매출 insert 
	 */
	@Override
	public int createTarget(TargetVO targetVO) {
		return dayReportDAO.insertTarget(targetVO);
	};
	
	/**
	 * @param targetVO
	 * @return int
	 * TB_target에 목표매출 수정
	 */
	@Override
	public int modifyTarget(TargetVO targetVO) {
		int cnt = 0;
		cnt = dayReportDAO.updateTarget(targetVO);
		return cnt;
	};
}
