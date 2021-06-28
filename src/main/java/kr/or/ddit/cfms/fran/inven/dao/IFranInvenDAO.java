package kr.or.ddit.cfms.fran.inven.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.inven.vo.FranInvenListVO;
import kr.or.ddit.cfms.fran.inven.vo.FranInvenVO;
import kr.or.ddit.cfms.fran.prod.vo.FranProdVO;

/**
 * @author 이진수
 * @since 2021. 5. 26
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 26      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IFranInvenDAO {
	public int selectFranInvenCount(PagingVO<FranInvenVO> pagingVO);
	public List<FranInvenVO> selectFranInvenList(PagingVO<FranInvenVO> pagingVO);
	public FranInvenVO selectFranInven(FranInvenVO franInvenVO);
	// 가맹점 재고 미사용 일괄 체크
	public int deleteFranInven(FranInvenVO franInvenVO);
	// 가맹점 적정재고 수정을 폼에 출력할 제품목록
	public List<FranInvenVO> selectFranProdList(FranInvenVO franInvenVO);
	// 가맹점 적정재고 수정
	public int updateFranInven(FranInvenVO franInvenVO);
}
