package kr.or.ddit.cfms.head.systemprod.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.admin.headmanage.vo.PayListVO;
import kr.or.ddit.cfms.admin.headmanage.vo.systempaymentVO;
import kr.or.ddit.cfms.admin.prod.vo.AdminProdVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.deposit.vo.HeadsmnVO;
import kr.or.ddit.cfms.head.systemprod.controller.SystemprodController;
import kr.or.ddit.cfms.head.systemprod.dao.IHeadSystemprodDAO;

/**
 * @author 진예은
 * @since 2021. 5. 29
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 29      진예은       시스템 상품조회
 * 2021. 5. 31      진예은       시스템 상품 결제
 * 2021. 6. 01      진예은       이용중인 상품내역 조회
 * 2021. 6. 01      진예은       서비스 해지
 * 2021. 6. 02      진예은       서비스 변경
 * 2021. 6. 03      진예은       서비스 해지 후 환불(예치금 입금), 상품변경
 * 2021. 6. 04      진예은       상품변경 -> 이용중상품수정 -> 예치금 출금
 * 2021. 6. 04      진예은       이용중인 정기결제 내역조회
 * 2021. 6. 13      진예은       서비스 해지 후  PIN번호여부 N으로 변경
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class HeadSystemprodServiceImpl implements IHeadSystemprodService {
	private final Logger logger = LoggerFactory.getLogger(HeadSystemprodServiceImpl.class);
	
	@Inject
	private IHeadSystemprodDAO systemprodDAO;
	
	//시스템 상품조회
	@Override
	public List<AdminProdVO> retrieveSystemprodList() {
		
		return systemprodDAO.selectSystemprodList();
	}

	
	//시스템 상품결제
	@Transactional
	@Override
	public ServiceResult createHeadSystemprod(PayListVO payListVO) {

		ServiceResult result = ServiceResult.FAIL;
		int cnt = systemprodDAO.insertHeadSystemprod(payListVO);
		cnt += systemprodDAO.updatePayPinNumber(payListVO.getHead_code());
		if(payListVO.getUsedpayVO() != null) {
			//조건문추가하자 점심먹고와
			
			if(payListVO.getHeadsmnList() != null) {
				cnt += systemprodDAO.insertOutHeadPay(payListVO.getHeadsmnList());
			}
			
			if(payListVO.getUsedpayVO() != null) {
				cnt += systemprodDAO.deletePay(payListVO.getUsedpayVO());
			}
		}
		if(cnt > 0) {
			result =  ServiceResult.OK;
		}
		
		return result;
	}


	//이용중인 상품내역 조회
	@Override
	public PayListVO retrieveUseProd(String code) {
		
		return systemprodDAO.selectUseProd(code);
	}

	//결제내역조회
	@Override
	public List<PayListVO> retrievePayList(PagingVO<PayListVO> pagingVO) {
		
		return systemprodDAO.selectPayList(pagingVO);
	}

	
	//서비스 해지
	@Transactional
	@Override
	public ServiceResult removePay(PayListVO payListVO) {
		
		ServiceResult result = ServiceResult.FAIL;
		int cnt = systemprodDAO.deletePay(payListVO);
		if(cnt > 0) {
			
					
			cnt += systemprodDAO.insertHeadPayback(payListVO.getHeadsmnList());
			cnt += systemprodDAO.updatePinNumber(payListVO.getHead_code());
			
			if(cnt > 0) {
				result =  ServiceResult.OK;
			}
		}
		
		return result;
	}


	//서비스 변경
	@Override
	public List<systempaymentVO> retrieveupdateList(String code) {
		
		return systemprodDAO.modiProdList(code);
	}

	//예치금 조회
	@Override
	public HeadsmnVO retrieveHeadsmnPay() {

		return systemprodDAO.selectHeadsmnPay();
	}

	//이용중인 정기결제 내역조회
	@Override
	public PayListVO retrieveUseRegular(String code) {

		return systemprodDAO.selectUseRegular(code);
	}

	//정기결제 내역조회
	@Override
	public List<PayListVO> retrieveRegularList(PagingVO<PayListVO> pagingVO) {

		return systemprodDAO.selectRegularList(pagingVO);
	}

	//결제내역 Count
	@Override
	public int retrieveMaxPay(String code) {
		
		return systemprodDAO.selectMaxpay(code);
	}

	//정기결제내역 Count
	@Override
	public int retrieveMaxRegular(String code) {

		return systemprodDAO.selectRegularCount(code);
	}

}
