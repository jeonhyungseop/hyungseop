package kr.or.ddit.cfms.fran.bill.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.bill.dao.IFranBillDAO;
import kr.or.ddit.cfms.fran.bill.vo.FranBillVO;
import kr.or.ddit.cfms.fran.deposit.vo.FrdsmnVO;

@Service
public class FranBillServiceImpl implements IFranBillService {
	
	@Inject
	private IFranBillDAO dao;
	
	@Override
	public ComCodeGrpVO retrieveCodeList(String code) {
		return dao.selectCodeList(code);
	}

	@Override
	public List<FranBillVO> retrieveBillList(PagingVO<FranBillVO> pagingVO) {
		return dao.selectBillList(pagingVO);
	}

	@Override
	public int retrieveBillCount(PagingVO<FranBillVO> pagingVO) {
		return dao.selectBillCount(pagingVO);
	}

	@Override
	public int retireveFranDepositBlce(FrdsmnVO depositVO) {
		return dao.selectFranDepositblce(depositVO);
	}

	@Override
	@Transactional
	public int updateFranBill(FranBillVO vo) {
		int cnt = 0;
		FrdsmnVO frds = vo.getFrdsmnVO();
		if(frds != null) {
			cnt += dao.insertFranDeposit(frds);
			
			if(cnt>0) {
				cnt = 0;
				cnt += dao.updateFranBill(vo);
			}
		}else {
			cnt += dao.updateFranBill(vo);
		}
		
		return cnt;
	}
	
}