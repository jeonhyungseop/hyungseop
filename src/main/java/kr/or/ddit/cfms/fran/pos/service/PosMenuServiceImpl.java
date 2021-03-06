package kr.or.ddit.cfms.fran.pos.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.fran.pos.dao.IPosMenuDAO;
import kr.or.ddit.cfms.fran.pos.vo.FranGoodsVO;
import kr.or.ddit.cfms.utils.ImageBase64Util;

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
@Service
public class PosMenuServiceImpl implements IPosMenuService{
	private static final Logger logger = LoggerFactory.getLogger(PosMenuServiceImpl.class);
	
	@Inject
	private IPosMenuDAO posMenuDAO;
	
	private ImageBase64Util imageBase = new ImageBase64Util();
	@Override
	public List<FranGoodsVO> retrieveFranGoodsList(FranGoodsVO franGoodsVO) {
		List<FranGoodsVO> saveGoodsList = posMenuDAO.selectFranGoodsList(franGoodsVO);
		for(FranGoodsVO franGoods : saveGoodsList) {
			imageBase.imageBase(franGoods.getAttachfileList());
		}
		return saveGoodsList;
	}

	@Override
	public List<FranGoodsVO> retrieveHeadGoodsList(FranGoodsVO franGoodsVO) {
		List<FranGoodsVO> saveGoodsList = posMenuDAO.selectHeadGoodsList(franGoodsVO);
		for(FranGoodsVO franGoods : saveGoodsList) {
			imageBase.imageBase(franGoods.getAttachfileList());
		}
		return saveGoodsList;
	}

	@Transactional
	@Override
	public int insertGoods(FranGoodsVO franGoodsVO) {
		
		int success = 0;
		for(String goods : franGoodsVO.getGoods_array()) {
			franGoodsVO.setGoods_code(goods);
			String franUse = posMenuDAO.selectGoods(franGoodsVO);
			if("N".equals(franUse)) {
				success += posMenuDAO.updateGoods(franGoodsVO);
			}else {
				success += posMenuDAO.insertGoods(franGoodsVO);
			}
		}
		return success;
	}

	@Transactional
	@Override
	public int deleteGoods(FranGoodsVO franGoodsVO) {
		int success = 0;
		for(String goods : franGoodsVO.getGoods_array()) {
			franGoodsVO.setGoods_code(goods);
			success += posMenuDAO.deleteGoods(franGoodsVO);
		}
		return success;
	}

	@Override
	public FranGoodsVO retrieveGoods(String goods_code) {
		FranGoodsVO franGoodsVO = posMenuDAO.selectGoodsDetail(goods_code);
		imageBase.imageBase(franGoodsVO.getAttachfileList());
		return franGoodsVO;
	}
	

}
