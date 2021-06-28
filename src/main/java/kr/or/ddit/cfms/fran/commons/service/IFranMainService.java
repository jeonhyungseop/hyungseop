package kr.or.ddit.cfms.fran.commons.service;

import java.util.List;

import org.springframework.ui.Model;

import kr.or.ddit.cfms.commons.vo.BoardVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.inven.vo.CordClVO;
import kr.or.ddit.cfms.fran.inven.vo.FranInvenVO;
import kr.or.ddit.cfms.head.commons.vo.DashListVO;
import kr.or.ddit.cfms.head.commons.vo.DashVO;

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
public interface IFranMainService {
	
	//dash보드 순서조회
	public List<DashVO> selectFranDashOrd();

	//dash보드 순서 업데이트
	public ServiceResult updateFranDashOrd(DashListVO dashListVO);

	/**
	 * @param model
	 * @param franCode
	 * 가맹점 매출 15일 조회
	 */
	public void settingDetailDatas(Model model, String franCode);
	
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
	
	/**
	 * @param pagingVO
	 * @return int
	 * 재고게시판 총 갯수
	 */
	public int retrieveFranInvenCount(PagingVO<FranInvenVO> pagingVO);
	
	/**
	 * @param pagingVO
	 * @return List<FranInvenVO>
	 * 재고 조회 리스트
	 */
	public List<FranInvenVO> retrieveFranInvenList(PagingVO<FranInvenVO> pagingVO);

	/**
	 * @param franCode
	 * @return List<CordClVO>
	 * 주문 구분별 주문갯수 리스트
	 */
	public void retriveCordClRateList(String franCode, Model model);

	/**
	 * @param franCode
	 * @return double
	 * 가맹점 주문 달성 비율 조회 
	 */
	public double retriveTargetRate(String franCode);
}
