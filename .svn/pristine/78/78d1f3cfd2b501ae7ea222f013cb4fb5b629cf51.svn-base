package kr.or.ddit.cfms.head.salesall.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.prod.vo.HeadProdVO;
import kr.or.ddit.cfms.head.salesall.vo.SalesProdVO;

@Repository
public interface IHeadSalesallDAO {

	public int selectSalesallCount(PagingVO<HeadProdVO> pagingVO);

	public List<HeadProdVO> selectSalesallList(PagingVO<HeadProdVO> pagingVO);

	/**
	 * @param headInvenVO
	 * @return HeadInvenVO
	 * 제품 한개에 대한 판매 출고 내역
	 */
	public HeadInvenVO selectProd(HeadInvenVO headInvenVO);

	/**
	 * @param prod_cl_code
	 * 공통 코드 제품 분류 명
	 * @return 
	 */
	public String selectClName(String prod_cl_code);
	
	
	public String selectUnitName(String prod_unit_code);

	public int selectProdListCount(PagingVO<SalesProdVO> pagingVO);

	public List<SalesProdVO> selectProdList(PagingVO<SalesProdVO> pagingVO);

	public List<SalesProdVO> selectChart(SalesProdVO prod_code);
}
