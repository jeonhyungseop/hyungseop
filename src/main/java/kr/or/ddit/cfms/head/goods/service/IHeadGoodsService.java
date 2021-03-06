package kr.or.ddit.cfms.head.goods.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.goods.vo.HeadGoodsVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenListVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;

/**
 * @author 이진수
 * @since 2021. 6. 15
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 15      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IHeadGoodsService {

	public void selectMainInfo(PagingVO<HeadGoodsVO> pagingVO);
	public int retrieveHeadGoodsCount(PagingVO<HeadGoodsVO> pagingVO);
	public List<HeadGoodsVO> retrieveHeadGoodsList(PagingVO<HeadGoodsVO> pagingVO);
	
	/**
	 * @param string
	 * @return
	 * 공통 코드
	 */
	public ComCodeGrpVO retrieveCodeList(String code);
	/**
	 * 상세보기
	 * @param headGoods
	 * @return
	 */
	public HeadGoodsVO retrieveHeadGoods(HeadGoodsVO headGoods);
	
	public ServiceResult insertGoods(HeadGoodsVO headGoods);
	
	public ServiceResult deleteGoods(String[] goods_code);
	
	public List<HeadGoodsVO> retrieveHeadGoods(String[] goods_code);
	
	public int modifyGoods(HeadGoodsVO headGoodsList);
}
