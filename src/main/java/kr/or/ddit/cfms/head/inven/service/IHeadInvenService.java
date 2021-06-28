package kr.or.ddit.cfms.head.inven.service;

import java.util.List;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenListVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.inven.vo.UnitpcListVO;

/**
 * @author 이진수
 * @since 2021. 5. 21
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 21      작성자명       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface IHeadInvenService {
	public int retrieveHeadInvenCount(PagingVO<HeadInvenVO> pagingVO);
	public List<HeadInvenVO> retrieveHeadInvenList(PagingVO<HeadInvenVO> pagingVO);
	public HeadInvenVO retrieveHeadInven(HeadInvenVO headInvenVO);
	public ComCodeGrpVO retrieveCodeList(String code);
	public ServiceResult createInven(HeadInvenListVO headInvenList);
	public ServiceResult removeInven(String[] prod_codes);
	public List<HeadInvenVO> retrieveHeadProd(String[] prod_codes);
	public AttachfileVO retrieveAttachFile(AttachfileVO attachFile);
	public int modifyInven(HeadInvenListVO headInvenList);
	public List<UnitpcListVO> retrieveUnitpcList(String prod_code);
}
