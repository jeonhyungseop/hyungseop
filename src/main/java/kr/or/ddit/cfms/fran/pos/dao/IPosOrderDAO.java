package kr.or.ddit.cfms.fran.pos.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.pos.vo.FranGoodsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordlistVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordsalelistsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CustomerorderVO;

/**
 * @author 이진수
 * @since 2021. 6. 17
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 17      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IPosOrderDAO {

	public List<ComCodeVO> selectComCodeList(String head_code);

	public List<FranGoodsVO> selectFranGoodsList(FranGoodsVO franGoodsVO);

	public FranGoodsVO selectFranGoods(FranGoodsVO franGoodsVO);

	public int insertOrder(CustomerorderVO custommerorderVO);

	public void insertSalelist(CustomerorderVO custommerorderVO);

	public void insertOrdlist(CustomerorderVO custommerorderVO);

	public int updateOrder(CustomerorderVO custommerorderVO);

	public List<CordsalelistsVO> selectFranCordList(CordsalelistsVO cordsalelistsVO);

	public List<CordlistVO> selectFranCord(CordlistVO cordlistVO);

	public int cancleRefundFranSale(CordlistVO cordlistVO);
}
