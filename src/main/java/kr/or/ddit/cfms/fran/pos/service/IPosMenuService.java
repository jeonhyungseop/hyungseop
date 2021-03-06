package kr.or.ddit.cfms.fran.pos.service;

import java.util.List;

import kr.or.ddit.cfms.fran.pos.vo.FranGoodsVO;

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
public interface IPosMenuService {

	/**
	 * @param franGoodsVO
	 * @return
	 * 가맹점 상품 
	 */
	public List<FranGoodsVO> retrieveFranGoodsList(FranGoodsVO franGoodsVO);

	/**
	 * @param franGoodsVO
	 * @return
	 * 가맹본부 상품
	 */
	public List<FranGoodsVO> retrieveHeadGoodsList(FranGoodsVO franGoodsVO);

	public int insertGoods(FranGoodsVO franGoodsVO);

	public int deleteGoods(FranGoodsVO franGoodsVO);

	public FranGoodsVO retrieveGoods(String goods_code);
	
}
