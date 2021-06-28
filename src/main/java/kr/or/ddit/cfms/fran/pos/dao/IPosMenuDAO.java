package kr.or.ddit.cfms.fran.pos.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

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
@Repository
public interface IPosMenuDAO {

	public List<FranGoodsVO> selectFranGoodsList(FranGoodsVO franGoodsVO);

	public List<FranGoodsVO> selectHeadGoodsList(FranGoodsVO franGoodsVO);

	public String selectGoods(FranGoodsVO franGoodsVO);

	public int insertGoods(FranGoodsVO franGoodsVO);

	public int updateGoods(FranGoodsVO franGoodsVO);

	public int deleteGoods(FranGoodsVO franGoodsVO);

	public FranGoodsVO selectGoodsDetail(String goods_code);

	

}
