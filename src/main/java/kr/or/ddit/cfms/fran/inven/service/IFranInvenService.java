package kr.or.ddit.cfms.fran.inven.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
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
public interface IFranInvenService {
	public int retrieveFranInvenCount(PagingVO<FranInvenVO> pagingVO);
	public List<FranInvenVO> retrieveFranInvenList(PagingVO<FranInvenVO> pagingVO);
	public FranInvenVO retrieveFranInven(FranInvenVO franInvenVO);
	public ServiceResult removeFranInven(FranInvenVO franInvenVO);
	public List<FranInvenVO> retrieveFranProdList(FranInvenVO franInvenVO);
	public int modifyFranInven(FranInvenListVO franInvenListVO);
}
