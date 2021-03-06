package kr.or.ddit.cfms.fran.pos.service;

import java.util.List;

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
public interface IPosOrderService {

	public List<ComCodeVO> retrieveComCodeList(String head_code);

	public List<FranGoodsVO> retrieveFranGoodsList(FranGoodsVO franGoodsVO);

	public FranGoodsVO retrieveGoods(FranGoodsVO franGoodsVO);

	public void createCorder(CustomerorderVO custommerorderVO);

	public List<CordsalelistsVO> retriveFranCordList(CordsalelistsVO cordsalelistsVO);

	public List<CordlistVO> retriveFranCord(CordlistVO cordlistVO);

	public ServiceResult cancleRefundSale(CordlistVO cordlistVO);
}
