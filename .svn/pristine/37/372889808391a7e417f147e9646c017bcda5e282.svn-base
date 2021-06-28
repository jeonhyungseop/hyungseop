package kr.or.ddit.cfms.head.systemprod.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.admin.headmanage.vo.PayListVO;
import kr.or.ddit.cfms.admin.headmanage.vo.systempaymentVO;
import kr.or.ddit.cfms.admin.prod.vo.AdminProdVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
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
 * 2021. 5. 29      진예은       시스템 상품 조회
 * 2021. 5. 31      진예은       시스템 상품 결제
 * 2021. 6. 01      진예은       이용중인 상품내역 조회
 * 2021. 6. 01      진예은       서비스 해지
 * 2021. 6. 02      진예은       서비스 변경
 * 2021. 6. 03      진예은       서비스 해지 후 환불(예치금 입금), 상품변경
 * 2021. 6. 04      진예은       예치금 출금, 이용중인 정기결제내역조회
 * 2021. 6. 13      진예은       서비스 해지후  PIN번호 여부 변경
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IHeadSystemprodDAO {

	//시스템 상품조회
	public List<AdminProdVO> selectSystemprodList();
	
	
	//시스템 상품결제
	public int insertHeadSystemprod(PayListVO payListVO);
	
	//이용중인 상품내역
	public PayListVO selectUseProd(String code);
	
	//결제내역조회
	public List<PayListVO> selectPayList(PagingVO<PayListVO> pagingVO);
	
	//서비스 해지
	public int deletePay(PayListVO payListVO);
	
	//서비스 변경
	public List<systempaymentVO> modiProdList(String code);
	
	//예치금 입금
	public int insertHeadPayback(HeadsmnVO headsmnVO);
	
	//예치금 잔액조회
	public HeadsmnVO selectHeadsmnPay();
	
	//예치금 출금
	public int insertOutHeadPay(HeadsmnVO headsmnVO);
	
	//이용중인 정기결제 내역
	public PayListVO selectUseRegular(String code);
	
	//정기결제 내역조회
	public List<PayListVO> selectRegularList(PagingVO<PayListVO> pagingVO);
	
	//결제내역 Count
	public int selectMaxpay(String code);
	
	//정기결제 내역 Count
	public int selectRegularCount(String code);
	
	//서비스 해지후  PIN번호 여부 변경
	public int updatePinNumber(String code);
	
	//상품구매후 PIN번호 여부 변경
	public int updatePayPinNumber(String code);
}
