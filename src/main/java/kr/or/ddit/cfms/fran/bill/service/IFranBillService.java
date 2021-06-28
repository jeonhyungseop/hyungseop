package kr.or.ddit.cfms.fran.bill.service;
import java.util.List;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.bill.vo.FranBillVO;
import kr.or.ddit.cfms.fran.deposit.vo.FrdsmnVO;

public interface IFranBillService {
	//공통코드 조회
	public ComCodeGrpVO retrieveCodeList(String code);
	
	//가맹비 리스트 조회
	public List<FranBillVO> retrieveBillList(PagingVO<FranBillVO> pagingVO);
	
	//가맹비 개수 조회
	public int retrieveBillCount(PagingVO<FranBillVO> pagingVO);
	
	//가맹비 잔액 가져오기
	public int retireveFranDepositBlce(FrdsmnVO depositVO);
	
	//가맹비 결제 업데이트
	public int updateFranBill(FranBillVO vo);
	
	
}