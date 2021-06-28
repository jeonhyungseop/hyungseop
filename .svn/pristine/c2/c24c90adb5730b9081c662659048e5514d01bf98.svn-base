package kr.or.ddit.cfms.head.royal.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.royal.vo.HeadBillVO;
import kr.or.ddit.cfms.head.royal.vo.HeadRoyalVO;

@Repository
public interface IHeadRoyalDAO {
	public ComCodeGrpVO selectCodeList(String code);
	
	public int selectBillCount(PagingVO<HeadBillVO> pagingVO);
	
	public List<HeadBillVO> selectBillList(PagingVO<HeadBillVO> pagingVO);
	
	public List<HeadRoyalVO> selectRoyalChart(String code);
	
	public List<HeadRoyalVO> selectRoyalList(PagingVO<HeadRoyalVO> pagingVO);
	
	public int selectRoyalCount(PagingVO<HeadRoyalVO> pagingVO);
	
	public int insertRoyal(HeadRoyalVO royal);
	
	public List<String> selectheadcode();
	
	public void updateRoyalJob(Map<String, Object> pMap);
	
	public void insertBillJob(Map<String, Object> pMap);
}
