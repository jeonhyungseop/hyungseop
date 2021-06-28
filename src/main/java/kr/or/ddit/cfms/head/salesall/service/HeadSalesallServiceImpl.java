package kr.or.ddit.cfms.head.salesall.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.prod.vo.HeadProdVO;
import kr.or.ddit.cfms.head.salesall.dao.IHeadSalesallDAO;
import kr.or.ddit.cfms.head.salesall.vo.SalesProdVO;
import kr.or.ddit.cfms.utils.ImageBase64Util;

@Service
public class HeadSalesallServiceImpl implements IHeadSalesallService{
	private static final Logger logger = LoggerFactory.getLogger(HeadSalesallServiceImpl.class);
	private ImageBase64Util imageBase64Util = new ImageBase64Util();;
	@Inject
	private IHeadSalesallDAO salesallDAO;
	
	@Override
	public void selectMainInfo(PagingVO<HeadProdVO> pagingVO) {
		int totalRecord = retrieveSalesallCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		// 재고 조회
		List<HeadProdVO> headsalesallVO = retrieveSalesallList(pagingVO);
		// 이미지 처리
		for(HeadProdVO headProdVO : headsalesallVO) {
			if(headProdVO.getAttachfileList().size() > 0) {
				imageBase64Util.imageBase(headProdVO.getAttachfileList());
			}
		}
		
		/** 결과 데이터 송신 */ 
		// 재고 조회한 데이터 저장
		pagingVO.setDataList(headsalesallVO);
		
	}

	@Override
	public int retrieveSalesallCount(PagingVO<HeadProdVO> pagingVO) {
		return salesallDAO.selectSalesallCount(pagingVO);
	}

	@Override
	public List<HeadProdVO> retrieveSalesallList(PagingVO<HeadProdVO> pagingVO) {
		return salesallDAO.selectSalesallList(pagingVO);
	}

	@Override
	public HeadInvenVO selectSalesProdInfo(HeadInvenVO headInvenVO) {
		headInvenVO = retrieveProd(headInvenVO);
		imageBase64Util.imageBase(headInvenVO.getAttachfileList());
		headInvenVO.setProd_cl_nm(retrieveClName(headInvenVO.getProd_cl_code()));
		headInvenVO.setProd_unit_nm(retrieveUnitName(headInvenVO.getProd_unit_code()));
		return headInvenVO;
	}
	
	private String retrieveClName(String prod_cl_code) {
		return salesallDAO.selectClName(prod_cl_code);
	}
	private String retrieveUnitName(String prod_unit_code) {
		return salesallDAO.selectUnitName(prod_unit_code);
	}

	@Override
	public HeadInvenVO retrieveProd(HeadInvenVO headInvenVO) {
		return salesallDAO.selectProd(headInvenVO);
	}

	@Override
	public void selectSalesProdListInfo(PagingVO<SalesProdVO> pagingVO) {
		int totalRecord = retrieveSalesProdListCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		// 판매 출고 조회
		List<SalesProdVO> salesProdListVO = retrieveSalesProdList(pagingVO);
		
		/** 결과 데이터 송신 */ 
		// 판매출고  조회한 데이터 저장
		pagingVO.setDataList(salesProdListVO);
		
	}

	private int retrieveSalesProdListCount(PagingVO<SalesProdVO> pagingVO) {
		return salesallDAO.selectProdListCount(pagingVO);
	}

	private List<SalesProdVO> retrieveSalesProdList(PagingVO<SalesProdVO> pagingVO) {
		return salesallDAO.selectProdList(pagingVO);
	}

	@Override
	public List<SalesProdVO> retrieveChart(SalesProdVO searchChart) {
		return salesallDAO.selectChart(searchChart);
	}

}
