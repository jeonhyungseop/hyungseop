package kr.or.ddit.cfms.fran.commons.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.commons.dao.IFranMainDAO;
import kr.or.ddit.cfms.fran.inven.vo.CordClVO;
import kr.or.ddit.cfms.fran.inven.vo.FranInvenVO;
import kr.or.ddit.cfms.head.commons.vo.DashListVO;
import kr.or.ddit.cfms.head.commons.vo.DashVO;
import kr.or.ddit.cfms.head.dayreport.vo.CustomerorderVO;

/**
 * @author 진예은
 * @since 2021. 6. 7
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 22      진예은        dash보드 순서 조회
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class FranMainServiceImpl implements IFranMainService {

	@Inject
	private IFranMainDAO franDAO;

	//dash보드 순서조회
	@Override
	public List<DashVO> selectFranDashOrd() {
		
		return franDAO.selectFranDashOrd();
	}

	//dash보드 순서 업데이트
	@Override
	@Transactional
	public ServiceResult updateFranDashOrd(DashListVO dashListVO) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = franDAO.updateFranDashOrd(dashListVO);
		
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		return result;
	}

	/**
	 * @param model
	 * @param franCode
	 * 가맹점 매출 15일 조회
	 */
	@Override
	public void settingDetailDatas(Model model, String franCode) {
		Map<String, String> params = new HashMap<>();
		params.put("franCode", franCode);
		
		List<CustomerorderVO> moneyByDay =  franDAO.selectDaySaleByFranList(params);
		model.addAttribute("moneyByDay", moneyByDay);
		model.addAttribute("franCode", franCode);
		
	}
	
	/**
	 * @param pagingVO
	 * @return int
	 * 가맹본부 공지사항 총 레코드 갯수
	 */
	@Override
	public int selectBoardCount(PagingVO<BoardVO> pagingVO) {
		return franDAO.selectBoardCount(pagingVO);
	}

	/**
	 * @param pagingVO
	 * @return List<BoardVO>
	 * 가맹본부 공지사항 조회
	 */
	@Override
	public List<BoardVO> retrieveBoardList(PagingVO<BoardVO> pagingVO) {
		return franDAO.selectBoardList(pagingVO);
	}
	
	/**
	 * @param pagingVO
	 * @return int
	 * 재고게시판 총 갯수
	 */
	@Override
	public int retrieveFranInvenCount(PagingVO<FranInvenVO> pagingVO) {
		return franDAO.selectFranInvenCount(pagingVO);
	}
	
	/**
	 * @param pagingVO
	 * @return List<FranInvenVO>
	 * 재고 조회 리스트
	 */
	@Override
	public List<FranInvenVO> retrieveFranInvenList(PagingVO<FranInvenVO> pagingVO) {
		return franDAO.selectFranInvenList(pagingVO);
	}
	
	/**
	 * @param franCode
	 * @return List<CordClVO>
	 * 주문 구분별 주문갯수 리스트
	 */
	@Override
	public void retriveCordClRateList(String franCode, Model model){
		
		List<CordClVO> clA0001 = franDAO.selectCordClA0001(franCode);
		List<CordClVO> clB0001 = franDAO.selectCordClB0001(franCode);
		List<CordClVO> clC0001 = franDAO.selectCordClC0001(franCode);
		
		model.addAttribute("clA0001", clA0001);
		model.addAttribute("clB0001", clB0001);
		model.addAttribute("clC0001", clC0001);
		
		
	}

	/**
	 * @param franCode
	 * @return int
	 * 가맹점 주문 달성 비율 조회 
	 */
	@Override
	public double retriveTargetRate(String franCode) {
		return franDAO.selectTargetRate(franCode);
	}
}
