package kr.or.ddit.cfms.head.salesall.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.prod.vo.HeadProdVO;
import kr.or.ddit.cfms.head.salesall.vo.SalesProdVO;

public interface IHeadSalesallService {

	public void selectMainInfo(PagingVO<HeadProdVO> pagingVO);
	public int retrieveSalesallCount(PagingVO<HeadProdVO> pagingVO);
	public List<HeadProdVO> retrieveSalesallList(PagingVO<HeadProdVO> pagingVO);
	
	
	
	public HeadInvenVO selectSalesProdInfo(HeadInvenVO ordersVO); 
	public HeadInvenVO retrieveProd(HeadInvenVO headInvenVO);
	
	public void selectSalesProdListInfo(PagingVO<SalesProdVO> pagingVO);
	
	/**
	 * @param searchChart
	 * @return List<Map<String, String>>
	 * chart 데이터 가져오기
	 */
	public List<SalesProdVO> retrieveChart(SalesProdVO searchChart);

	
}
