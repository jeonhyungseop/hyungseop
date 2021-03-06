package kr.or.ddit.cfms.fran.prod.service;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.prod.dao.IFranProdDAO;
import kr.or.ddit.cfms.fran.prod.vo.OrderListVO;
import kr.or.ddit.cfms.fran.prod.vo.OrderVO;
import kr.or.ddit.cfms.head.inven.dao.IHeadInvenDAO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.limit.vo.OrdlistVO;

/**
 * @author 이진수
 * @since 2021. 6. 4
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 4      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class FranProdServiceImpl implements IFranProdService {
	private static final Logger logger = LoggerFactory.getLogger(FranProdServiceImpl.class);
	
	@Inject
	private IHeadInvenDAO invenDAO;
	
	@Inject
	private IFranProdDAO prodDAO;
	
	
	public void selectMainInfo(PagingVO<HeadInvenVO> pagingVO) {
		
		int totalRecord = retrieveHeadProdCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		// 재고 조회
		List<HeadInvenVO> invenList = retrieveHeadProdList(pagingVO);
		
		/** 결과 데이터 송신 */ 
		// 재고 조회한 데이터 저장
		pagingVO.setDataList(invenList);
		
		// 이미지 처리
		for(HeadInvenVO headInven : pagingVO.getDataList()) {
			imageBase(headInven);
		}
	}
	
	
	@Override
	public int retrieveHeadProdCount(PagingVO<HeadInvenVO> pagingVO) {
		return prodDAO.selectHeadProdCount(pagingVO);
	}

	@Override
	public List<HeadInvenVO> retrieveHeadProdList(PagingVO<HeadInvenVO> pagingVO) {
		return prodDAO.selectHeadProdList(pagingVO);
	}

	
	private void imageBase(HeadInvenVO headInven) {
		InputStream imageStream;
		if(headInven.getAttachfileList().size() > 0 || !headInven.getAttachfileList().isEmpty()) {
			
			for(AttachfileVO attach : headInven.getAttachfileList()) {
				try {
					
					/** 썸네일 이미지 */ 
					
					// FileInputStream으로 파일을 불러온다
					imageStream = new FileInputStream(attach.getFile_path()+"/"+attach.getSave_filenm());
					// IOUtils.toByteArray 바이트배열로 바꿔서 저장
					byte[] imageBtyeArray = IOUtils.toByteArray(imageStream);
					imageStream.close();
					// 이진데이터로 바꾼다
					// 바이트배열을 Base64.encodeBase64형식에 맞춰서 인코딩 하는 작업
					byte[] encodeBase64 = Base64.encodeBase64(imageBtyeArray);
					// 인코딩 된 데이터를 보내준다.
					String base64DataString = new String(encodeBase64, "UTF-8");
					// file_img저장될때는 사용되는게 아니고 이미지를 표현할떄 사용된다.
					attach.setFile_img(base64DataString);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			
		}
	}

	@Transactional
	@Override
	public ServiceResult insertOrder(OrderListVO orderListVO) {
		ServiceResult result = ServiceResult.FAIL;
		suplypcSum(orderListVO);
		int cnt = 0;
		cnt = prodDAO.insertOrder(orderListVO.getOrderVO());
		orderListVO.setOrder_no(orderListVO.getOrderVO().getOrder_no());
		if(cnt > 0) {
			cnt = prodDAO.insertOrderList(orderListVO);
			if(cnt > 0) {
				for(OrdlistVO order : orderListVO.getOrderListVO()) {
					Map<String, String> paramMap = new HashedMap();
					paramMap.put("fran_code", orderListVO.getOrderVO().getFran_code());
					paramMap.put("prod_code", order.getProd_code());
					cnt = prodDAO.insertInven(paramMap);
				}
				if(cnt > 0) {
					result = ServiceResult.OK;
				}
			}
		}
		return result;
	}
	
	private void suplypcSum(OrderListVO orderListVO) {
		int sum = 0;
		for(OrdlistVO ordlistVO : orderListVO.getOrderListVO()) {
			sum += ordlistVO.getProd_suply_pc() * ordlistVO.getOrder_qy();
		}
		orderListVO.getOrderVO().setOrder_suplypc_sm(sum);
	}


	@Override
	public void selectProdList(OrderListVO orderListVO) {
		for(OrdlistVO ordlistVO : orderListVO.getOrderListVO()) {
			HeadInvenVO headInvenVO = prodDAO.selectProdList(ordlistVO.getProd_code());
			ordlistVO.setHeadInvenVO(headInvenVO);
		}
	}
	
	
}
