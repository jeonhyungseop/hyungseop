package kr.or.ddit.cfms.head.systemprod.service;

import java.util.List;

import kr.or.ddit.cfms.admin.headmanage.vo.PayListVO;
import kr.or.ddit.cfms.admin.headmanage.vo.systempaymentVO;
import kr.or.ddit.cfms.admin.prod.vo.AdminProdVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.deposit.vo.HeadsmnVO;

/**
 * @author 진예은
 * @since 2021. 5. 29
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 29    진예은           시스템 상품조회
 * 2021. 5. 31    진예은           시스템 상품 결제
 * 2021. 6. 01    진예은           이용중인 상품내역 조회
 * 2021. 6. 01    진예은           서비스 해지
 * 2021. 6. 02    진예은           서비스 변경
 * 2021. 6. 03    진예은           서비스 변경(예치금 잔액조회)
 * 2021. 6. 04    진예은           이용중인 정기결제 내역조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IHeadSystemprodService {

	//시스템 상품조회
	public List<AdminProdVO> retrieveSystemprodList();
	
	//시스템 상품 결제
	public ServiceResult createHeadSystemprod(PayListVO payListVO);
	
	//이용중인 상품 내역
	public PayListVO retrieveUseProd(String code);
	
	//결제내역조회
	public List<PayListVO> retrievePayList(PagingVO<PayListVO> pagingVO);
	
	//서비스 해지
	public ServiceResult removePay(PayListVO payListVO);
	
	//서비스 변경
	public List<systempaymentVO> retrieveupdateList(String code);
	
	//예치금 잔액조회
	public HeadsmnVO retrieveHeadsmnPay();
	
	//이용중인 정기결제 내역조회
	public PayListVO retrieveUseRegular(String code);
	
	//정기결제 내역조회
	public List<PayListVO> retrieveRegularList(PagingVO<PayListVO> pagingVO);
	
	//결제내역 count
	public int retrieveMaxPay(String code);
	
	//정기결제내역 count
	public int retrieveMaxRegular(String code);
	
	
}
