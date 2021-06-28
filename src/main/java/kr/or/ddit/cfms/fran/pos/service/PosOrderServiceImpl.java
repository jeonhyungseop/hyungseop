package kr.or.ddit.cfms.fran.pos.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.pos.controller.PosMenuController;
import kr.or.ddit.cfms.fran.pos.dao.IPosOrderDAO;
import kr.or.ddit.cfms.fran.pos.vo.FranGoodsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordlistVO;
import kr.or.ddit.cfms.head.dayreport.vo.CordsalelistsVO;
import kr.or.ddit.cfms.head.dayreport.vo.CustomerorderVO;
import kr.or.ddit.cfms.utils.ImageBase64Util;

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
@Service
public class PosOrderServiceImpl implements IPosOrderService{
	private static final Logger logger = LoggerFactory.getLogger(PosOrderServiceImpl.class);
	
	private ImageBase64Util imageBase = new ImageBase64Util();
	
	@Inject
	private IPosOrderDAO posOrderDAO;
	
	@Override
	public List<ComCodeVO> retrieveComCodeList(String head_code) {
		List<ComCodeVO> comCodeList = posOrderDAO.selectComCodeList(head_code);
		return comCodeList;
	}

	@Override
	public List<FranGoodsVO> retrieveFranGoodsList(FranGoodsVO franGoodsVO) {
		List<FranGoodsVO> FranGoodsList = posOrderDAO.selectFranGoodsList(franGoodsVO);
		for(FranGoodsVO franGoods : FranGoodsList) {
			imageBase.imageBase(franGoods.getAttachfileList());
		}
		return FranGoodsList;
	}

	@Override
	public FranGoodsVO retrieveGoods(FranGoodsVO franGoodsVO) {
		FranGoodsVO saveGoodsVO = posOrderDAO.selectFranGoods(franGoodsVO);
		imageBase.imageBase(saveGoodsVO.getAttachfileList());
		return saveGoodsVO;
	}

	@Transactional
	@Override
	public void createCorder(CustomerorderVO custommerorderVO) {
		for(int i = 0; i < custommerorderVO.getCOrderListVO().size(); i++) {
			if(custommerorderVO.getCOrderListVO().get(i).getGoods_code() == null) {
				custommerorderVO.getCOrderListVO().remove(i);
			}
		}
		
		
		int cnt = 0;
		if(custommerorderVO.getCord_code() == null) {
			// 주문서 입력
			cnt = posOrderDAO.insertOrder(custommerorderVO);
		}else {
			// 주문서 업데이트
			logger.info("{}",custommerorderVO);
			cnt = posOrderDAO.updateOrder(custommerorderVO);
		}
		if(cnt > 0) {
			// 결제 내역 입력
			posOrderDAO.insertSalelist(custommerorderVO);
			// 주문 내역 입력
			posOrderDAO.insertOrdlist(custommerorderVO);
		}
		
	}

	@Override
	public List<CordsalelistsVO> retriveFranCordList(CordsalelistsVO cordsalelistsVO) {
		return posOrderDAO.selectFranCordList(cordsalelistsVO);
	}

	@Override
	public List<CordlistVO> retriveFranCord(CordlistVO cordlistVO) {
		return posOrderDAO.selectFranCord(cordlistVO);
	}

	@Override
	public ServiceResult cancleRefundSale(CordlistVO cordlistVO) {
		int cnt = 0;
		ServiceResult result = ServiceResult.FAIL;
		cnt = posOrderDAO.cancleRefundFranSale(cordlistVO);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

}
