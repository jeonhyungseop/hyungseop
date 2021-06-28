package kr.or.ddit.cfms.fran.bill.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.bill.vo.FranBillVO;
import kr.or.ddit.cfms.fran.deposit.vo.FrdsmnVO;

@Repository
public interface IFranBillDAO {
	//공통코드 조회
	public ComCodeGrpVO selectCodeList(String code);
	
	//가맹비 리스트 조회
	public List<FranBillVO> selectBillList(PagingVO<FranBillVO> pagingVO);
	
	//가맹비 개수 조회
	public int selectBillCount(PagingVO<FranBillVO> pagingVO);
	
	//가맹비 잔액 가져오기
	public int selectFranDepositblce(FrdsmnVO depositVO);
	
	//가맹비 결제 업데이트
	public int updateFranBill(FranBillVO vo);
	
	//예치금 내역 추가
	public int insertFranDeposit(FrdsmnVO vo);
}