package kr.or.ddit.cfms.head.royal.service;

import java.util.List;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.royal.vo.HeadBillVO;
import kr.or.ddit.cfms.head.royal.vo.HeadRoyalVO;

/**
 * @author 진유리
 * @since 2021. 06. 09
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * ------------     --------    ----------------------
 * 2021. 06. 09     진유리         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

public interface IHeadRoyalService {
	//공통코드 조회
	public ComCodeGrpVO retrieveCodeList(String code);
	
	//가맹비수납내역 개수
	public int retrievetBillCount(PagingVO<HeadBillVO> pagingVO);
		
	//가맹비수납내역 리스트 조회
	public List<HeadBillVO> retrieveBillList(PagingVO<HeadBillVO> pagingVO);
	
	//가맹비 변동를 보기 위한 차트 리스트 조회
	public List<HeadRoyalVO> retrieveRoyalChart(String code);
	
	//가맹비내역 리스트 조회
	public List<HeadRoyalVO> retrieveRoyalList(PagingVO<HeadRoyalVO> pagingVO);
	
	//가맹비내역 리스트 조회
	public int retrieveRoyalCount(PagingVO<HeadRoyalVO> pagingVO);
	
	//가맹비 등록
	public int insertRoyal(HeadRoyalVO royal);
}