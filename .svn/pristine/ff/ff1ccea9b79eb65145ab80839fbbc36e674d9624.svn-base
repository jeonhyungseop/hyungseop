package kr.or.ddit.cfms.head.commons.service;
/**
 * @author 진예은
 * @since 2021. 6. 22
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 22       진예은       dash보드 순서조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

import java.util.List;
import java.util.Map;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.commons.vo.DashListVO;
import kr.or.ddit.cfms.head.commons.vo.DashVO;
import kr.or.ddit.cfms.head.commons.vo.GoodsByDateVO;
import kr.or.ddit.cfms.head.commons.vo.RankGoodsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CustomerorderVO;

public interface IHeadMainService {

	//dash보드 순서 조회
	public List<DashVO> selectDashOrd();
	
	//dash보드 순서 업데이트
	public ServiceResult updateDashOrd(DashListVO dashListVO);

	/**
	 * @param params
	 * @return List<CustomerorderVO> 
	 * 파라미터로 온 가맹본부 코드를 통해 가맹점 별 일일 매출조회
	 */
	public List<CustomerorderVO> retriveDaySaleList(Map<String, String> params);

	/**
	 * @param params
	 * @return List<FranchiseVO> 
	 * 파라미터로 온 가맹본부 코드를 통해  가맹본부의 가맹점 리스트 조회
	 */
	public List<FranchiseVO> retriveFranchiseList(Map<String, String> params);
	
	/**
	 * @param headCode
	 * @return List<RankGoodsVO>
	 * 가맹본부 코드를 이용하여 상위 3개의 누적 판매 수  및 상품 조회
	 */
	public List<RankGoodsVO> retriveRankGoodsList(String headCode);

	/**
	 * @return int
	 * 가맹본부 코드를 이용하여 전체 가맹점 수 조회
	 */
	public int retriveTotalFranchiseCnt(String headCode);

	/**
	 * @param pagingVO
	 * @return int
	 * 가맹본부 공지사항 총 레코드 갯수
	 */
	public int selectBoardCount(PagingVO<BoardVO> pagingVO);

	/**
	 * @param pagingVO
	 * @return List<BoardVO>
	 * 가맹본부 공지사항 조회
	 */
	public List<BoardVO> retrieveBoardList(PagingVO<BoardVO> pagingVO);
	
}
