package kr.or.ddit.cfms.head.commons.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.exception.CustomException;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.commons.dao.IHeadMainDAO;
import kr.or.ddit.cfms.head.commons.vo.DashListVO;
import kr.or.ddit.cfms.head.commons.vo.DashVO;
import kr.or.ddit.cfms.head.commons.vo.GoodsByDateVO;
import kr.or.ddit.cfms.head.commons.vo.RankGoodsVO;
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
public class HeadMainServiceImpl implements IHeadMainService {

	@Inject
	private IHeadMainDAO mainDAO;
	
	
	//dash보드 순서조회
	@Override
	public List<DashVO> selectDashOrd() {
		
		return mainDAO.selectDashOrd();
	}

	//dash보드 순서 업데이트
	@Override
	@Transactional
	public ServiceResult updateDashOrd(DashListVO dashListVO) {

		ServiceResult result = ServiceResult.FAIL;
		int cnt = mainDAO.updateDashOrd(dashListVO);
		
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}

	/**
	 * @param params
	 * @return List<CustomerorderVO> 
	 * 파라미터로 온 가맹본부 코드를 통해 가맹점 별 일일 매출조회
	 */
	@Override
	public List<CustomerorderVO> retriveDaySaleList(Map<String, String> params) {
		return mainDAO.selectDaySaleList(params);
	}

	/**
	 * @param params
	 * @return List<FranchiseVO> 
	 * 파라미터로 온 가맹본부 코드를 통해  가맹본부의 가맹점 리스트 조회
	 */
	@Override
	public List<FranchiseVO> retriveFranchiseList(Map<String, String> params) {
		return mainDAO.selectFranchiseList(params);
	}

	/**
	 * @param headCode
	 * @return List<RankGoodsVO>
	 * 가맹본부 코드를 이용하여 상위 3개의 누적 판매 수  및 상품 조회
	 */
	@Override
	public List<RankGoodsVO> retriveRankGoodsList(String headCode) {
		
		List<RankGoodsVO> rankGoods = mainDAO.selectRankGoodsList(headCode);
		
		for(RankGoodsVO goods :rankGoods) {
			String goodsCode = goods.getGoods_code();
			List<GoodsByDateVO> goodsByDate =  mainDAO.selectGoodsByDateList(goodsCode);
			goods.setGoodsByDateList(goodsByDate);
		}
		
		return rankGoods;
	}

	/**
	 * @return int
	 * 가맹본부 코드를 이용하여 전체 가맹점 수 조회
	 */
	@Override
	public int retriveTotalFranchiseCnt(String headCode) {
		return mainDAO.selectTotalFranchiseCnt(headCode);
	}

	
	/**
	 * @param pagingVO
	 * @return int
	 * 가맹본부 공지사항 총 레코드 갯수
	 */
	@Override
	public int selectBoardCount(PagingVO<BoardVO> pagingVO) {
		return mainDAO.selectBoardCount(pagingVO);
	}

	/**
	 * @param pagingVO
	 * @return List<BoardVO>
	 * 가맹본부 공지사항 조회
	 */
	@Override
	public List<BoardVO> retrieveBoardList(PagingVO<BoardVO> pagingVO) {
		return mainDAO.selectBoardList(pagingVO);
	}

	
	
}
